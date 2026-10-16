---
name: error-handling-and-logging
description: 'Patterns for X++ exception handling, Infolog messaging, try/catch/retry, and CLR exception interop in D365FO. Use when the user asks about "throw error", "try catch", "retry loop", "catch DuplicateKeyException", "CLRError", or how to surface a message to the user. For the tts nesting and UpdateConflict rules themselves, use $transactions-and-concurrency.'
---
> 💡 **TOOLCHAIN POLICY:** Create every new AOT object with `d365fo generate … --install-to <Model>` or the D365FO MCP scaffolding tools. If the CLI or Bridge is unavailable, **stop and report the missing prerequisite** — never hand-author a new AOT XML object. Editing an *existing* object's XML is fine once you have verified its path and model ownership. The only sanctioned exception is the `aot-xml-direct-scaffolding` procedure, which requires explicit user authorization first.

# X++ Exception Handling & Logging

> **Source of truth:** [learn:xpp-exceptions](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/dev-ref/xpp-exceptions)

## Exception enum values (complete list)

| Exception | Catchable inside tts? | Retryable? | Description |
|---|---|---|---|
| `Exception::Error` | No (tts rolls back) | No | Fatal error. Transaction stopped. |
| `Exception::Warning` | No | No | Non-fatal warning. Do NOT throw. |
| `Exception::Info` | No | No | Informational. Do NOT throw. |
| `Exception::UpdateConflict` | **Yes** (explicit only) | **Yes** | Optimistic concurrency conflict — retry. |
| `Exception::DuplicateKeyException` | **Yes** (explicit only) | **Yes** | Unique index violation — retry. |
| `Exception::DuplicateKeyExceptionNotRecovered` | No | No | Cannot be caught inside tts. |
| `Exception::UpdateConflictNotRecovered` | No | No | Cannot be caught inside tts. |
| `Exception::CLRError` | No | No | .NET interop error — call `CLRInterop::getLastException()`. |
| `Exception::Deadlock` | No | **Yes** | DB deadlock. Retry after delay. |
| `Exception::Timeout` | No | **Yes** | SQL timeout. Cannot catch inside tts. |
| `Exception::Numeric` | No | No | str2int/str2num failure. |

## Pattern 1 — Preferred throw pattern

```xpp
// ✅ CORRECT: Global::error() writes to Infolog AND returns Exception::Error enum
throw Global::error("@MyModel:MyErrorLabel");

// ✅ Also valid (shorthand)
throw error("@MyModel:MyErrorLabel");

// ❌ WRONG: Throws error but writes NOTHING to Infolog
throw Exception::Error;
```

## Pattern 2 — Standard try/catch structure

```xpp
try
{
    ttsbegin;
    // ... business logic ...
    ttscommit;
}
catch (Exception::UpdateConflict)    // Must be OUTSIDE ttsbegin/ttscommit
{
    if (appl.ttsLevel() == 0)        // Only retry if we are not in an outer tts
    {
        retry;
    }
    throw;                           // Re-throw if nested inside another tts
}
catch (Exception::DuplicateKeyException)
{
    ttsabort;                        // Explicit abort needed here
    throw error("@MyModel:DuplicateKeyError");
}
catch (Exception::CLRError)
{
    System.Exception ex = CLRInterop::getLastException();
    throw error(ex.get_Message());
}
catch
{
    // Catch-all for outermost block
    throw;                           // Re-throw to caller
}
finally
{
    // Always executes — use for cleanup (dispose, unlock, etc.)
}
```

## Pattern 3 — Retry with counter (prevent infinite loop)

```xpp
int retryCount = 0;
const int maxRetries = 3;

try
{
    ttsbegin;
    // ... DB operation ...
    ttscommit;
}
catch (Exception::UpdateConflict)
{
    if (retryCount < maxRetries)
    {
        retryCount++;
        retry;
    }
    throw error("@MyModel:UpdateConflictMaxRetries");
}
```

> ❗ **`retry` erases all Infolog messages** written since entering the `try` block. Do not rely on Infolog state across retries.

## Pattern 4 — Exception inside a transaction

An exception thrown inside `ttsbegin`/`ttscommit` aborts the transaction, and the `catch`
that fires is the first one **outside** the block — an inner `catch (Exception::Error)`
never runs. The two exceptions to that are `Exception::UpdateConflict` and
`Exception::DuplicateKeyException`, which a named inner `catch` can still take (a bare
`catch{}` cannot).

That rule, the retry loop it implies, `ttsLevel`, `UnitOfWork`, and the validator rules
TTS002/TTS003 that enforce it all live in **`$transactions-and-concurrency`** — go there
rather than re-deriving them. This skill owns what to throw and how to surface it, not
where the transaction boundary goes.

## Pattern 5 — .NET (CLR) exception handling

```xpp
// Option A: Catch by type (preferred when you know the exception type)
System.ArgumentException ex;
try
{
    // ... call .NET method ...
}
catch (ex)
{
    error(ex.get_Message());
}

// Option B: Catch all CLR errors
try
{
    // ... call .NET method ...
}
catch (Exception::CLRError)
{
    System.Exception netEx = CLRInterop::getLastException();
    error(netEx.get_Message());
}
```

## Pattern 6 — Empty catch block (suppress warning)

```xpp
catch
{
    Global::exceptionTextFallThrough(); // Explicitly do nothing — suppresses compiler warning
}
```

## Pattern 8 — Infolog message types

```xpp
info("@MyModel:MyInfoLabel");       // Blue — informational
warning("@MyModel:MyWarnLabel");    // Yellow — non-fatal warning
error("@MyModel:MyErrorLabel");     // Red — will NOT throw by itself
throw error("@MyModel:MyError");    // Red + throws Exception::Error
checkFailed("@MyModel:Validation"); // Like error() but returns false
```

## Hard rules

- **ALWAYS use `Global::error()` / `error()` before `throw`** — never `throw Exception::Error` alone (no Infolog message).
- **Use label tokens** for ALL `info()`, `warning()`, `error()`, `throw error()` messages — never hardcoded strings.
- **ALWAYS add a retry counter** when using `retry` — without it you risk infinite loops.
- **Place catch for `UpdateConflict`/`DuplicateKeyException` OUTSIDE the tts block** — they cannot be caught inside (except explicit inner catch for those two specific types).
- **Use `Global::exceptionTextFallThrough()`** for intentionally empty catch blocks.
- **Use `CLRInterop::getLastException()` in `catch (Exception::CLRError)`** to surface the .NET exception message.
