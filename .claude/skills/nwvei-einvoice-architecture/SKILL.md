---
name: nwvei-einvoice-architecture
description: "Apply the NWVEI e-invoice architecture and data-flow baseline. Use for NWVEI provider integrations, JSON payload mapping, access tokens, invoice creation, printing, sending, deletion, cancellation, tax updates, source-document adapters, or architectural review of the NWVEI model."
---

# NWVEI E-Invoice Architecture

1. Read [guide.md](references/guide.md) before changing NWVEI behavior.
2. Apply `$d365fo-xpp-core` and `$integration-patterns`.
3. Verify the current NWVEI source and metadata because the baseline is architectural guidance, not a substitute for live code.
4. Preserve data-driven field mapping through `NWVEIMappingDetail` and its provider, API type, and source-document keys.
5. Do not hardcode D365FO-to-provider payload field mappings in builders or service classes.
6. Preserve provider abstraction, token handling, source-document separation, logging, and retry semantics.
7. Identify any intentional deviation from the baseline in the implementation report.
