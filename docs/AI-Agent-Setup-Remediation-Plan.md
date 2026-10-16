# Kế hoạch tái thiết AI Agent Setup — NWV-D365FO-Core

**Trạng thái:** ✅ **ĐÃ THỰC THI** 2026-09-18 trên nhánh `chore/agent-setup-remediation`
(4 commit). Xem §9 cuối tài liệu để biết cái gì đã làm, đã verify thế nào, và cái gì còn lại.
**Ngày lập:** 2026-09-18
**Phạm vi khảo sát:** `C:\D365_Local_Backups\NWV-D365FO-Core-Standalone` và
`C:\Users\khiemchg\Documents\d365fo-agent-setup`
**Quyết định kiến trúc đã chốt:** `.claude/skills/` là single source of truth.

---

## 0. Tóm tắt điều hành

Bộ cấu hình agent hiện tại có **7 bản sao** của cùng một nội dung skill, đã lệch
nhau, và **bản chất lượng cao nhất lại là bản duy nhất không nằm trong Git**.
Đoạn policy đã gây sự cố production ~2 ngày (OData 404, xem `PROVENANCE.md`) vẫn
đang sống trong **65 file**. Script được viết ra để ngăn đúng sự cố đó đang **FAIL**
và chỉ quét được 9/65 file nhiễm.

Ba việc phải làm, theo thứ tự: **(1)** gỡ policy nguy hiểm khỏi toàn bộ 65 file mà
không phá nội dung; **(2)** đưa `.claude/` vào version control; **(3)** thu 7 mirror
về 1 nguồn + 1 generator, rồi chuyển các luật quan trọng từ "văn bản thuyết phục"
sang "hook cưỡng chế".

---

## 1. Phương pháp khảo sát

Mọi con số trong tài liệu này đến từ lệnh chạy thật trên máy, không suy đoán:

| Việc kiểm tra | Lệnh |
|---|---|
| So sánh 2 cây setup | `diff -rq`, `md5sum` |
| Tình trạng tracking | `git ls-files`, `git check-ignore -v` |
| Mức độ rút gọn skill | `git diff --numstat -- .agents` |
| Quét policy nguy hiểm | `grep -rlE` với 2 cụm từ khoá của banner |
| Sức khỏe toolchain | `d365fo doctor --output json` |
| Guard script | `.\tools\check-skill-sync.ps1` |

**Chưa verify được:** hành vi thực tế của Copilot/Codex khi đọc các mirror của
chúng (không chạy được 2 agent đó trong phiên này). Các nhận định về `.github/` và
`.codex/` dựa trên nội dung file, không dựa trên quan sát runtime.

---

## 2. Kết luận về `C:\Users\khiemchg\Documents\d365fo-agent-setup`

**Đây không phải nguồn gốc.** Nó là bản trích xuất từ chính working tree của repo
này ngày 2026-09-15:

- `AGENTS.md`, `CLAUDE.md`, `PROVENANCE.md`, `README.md`, `.mcp.json` — giống hệt byte-for-byte.
- `.claude/skills` (56 dir) và `.agents/skills` (34 dir) — `diff -rq` **không báo file nào khác nội dung**.
- Nó *thiếu* `.github/instructions/` (21 file), `.github/skills/*` (48 file), `.vscode/skills/` (28 file).

**Hệ quả cho kế hoạch:** không có gì để merge ngược. Cây đó có thể xoá hoặc giữ làm
snapshot lịch sử. Toàn bộ công việc diễn ra trong repo này.

---

## 3. Phát hiện (có bằng chứng)

### F1 — Policy nguy hiểm đang sống trong 65 file · **Nghiêm trọng**

Nguyên văn đoạn banner:

> 💡 **TOOLCHAIN & FALLBACK POLICY:** When `d365fo` CLI is available, prioritize
> `d365fo generate …` commands. When `d365fo` is NOT available, **DO NOT STOP OR
> ABORT**. Fallback gracefully to directly generating/editing valid D365FO AOT XML
> metadata files (`.xml`) ...

Đây chính là policy mà `PROVENANCE.md` xác định là nguyên nhân sự cố `AxDataEntityView`
hand-author compile sạch nhưng không route được OData.

| Mirror | Số file nhiễm |
|---|---|
| `.agents/` | 8 |
| `.github/` | 29 |
| `.vscode/` | 28 |
| `.codex/` | 0 |
| `.claude/` | **0** |
| **Tổng** | **65** |

`.claude/` sạch — một lý do nữa để chọn nó làm nguồn.

### F2 — Guard script đang FAIL và phủ sóng thiếu · **Nghiêm trọng**

`.\tools\check-skill-sync.ps1` → `exit 1`, 15 lỗi. Không có CI nào gọi nó.

Nghiêm trọng hơn, script chỉ quét `$agentsDir, $claudeDir`. **56/65 file nhiễm nằm
ngoài vùng quét** (`.github/`, `.vscode/`). Nó được viết để ngăn đúng sự cố này
nhưng không nhìn thấy 86% bề mặt.

### F3 — Việc gỡ banner trước đây đã xoá mất 1.986 dòng nội dung · **Cao**

`git diff --stat -- .agents` → **258 thêm / 1.986 xoá** trên 32 file.

Cách "sửa" là thay skill giàu nội dung bằng stub ~15 dòng, thay vì chỉ xoá đoạn
blockquote. Ví dụ `coc-extension-authoring`:

| Phiên bản | Số dòng | Có banner? | Có `prepare change --grounding-token`? |
|---|---|---|---|
| HEAD (`.agents`, committed) | 105 | Có | Có |
| Working tree (`.agents`) | **15** | Không | **Không** |
| `.claude` (untracked) | **157** | **Không** | **Có** |

Workflow `d365fo prepare change … --grounding-token` là cơ chế chống bịa metadata —
nó trả về signature thật, các CoC wrapper đã tồn tại, và một token buộc generator
phải bám vào metadata thật. Nó đã bị xoá cùng với banner.

**24 skill** hiện ở trạng thái stub trong khi `.claude` có bản đầy đủ:

```
business-events-authoring       14 → 185     object-extension-authoring      14 → 250
coc-extension-authoring         15 → 157     review-and-checkpoint-workflow  14 → 118
custom-service-authoring        15 → 199     security-hierarchy-trace        15 →  81
data-entity-scaffolding         15 →  87     sysoperation-batch-patterns     15 → 190
event-handler-authoring         15 → 136     table-scaffolding               15 → 269
form-pattern-scaffolding        14 → 224     xpp-best-practice-rules         14 → 181
integration-patterns            15 → 195     xpp-class-and-method-rules      15 → 109
label-translation               14 → 104     xpp-database-queries            16 → 183
model-dependency-and-coupling   13 →  71     xpp-statement-and-type-rules    15 → 136
```

### F4 — Toàn bộ setup Claude Code nằm ngoài Git · **Nghiêm trọng**

`.gitignore` dùng chiến lược chặn `/*` rồi whitelist. Whitelist (dòng 27–33) có
`.github/ .agents/ .codex/ .vscode/ docs/ tools/ AGENTS.md` — **không có `.claude/`**.

```
$ git ls-files .claude/skills | wc -l
0
```

| File | Trạng thái |
|---|---|
| `.claude/` (toàn bộ, 56 skill) | **IGNORED** |
| `CLAUDE.md` | **IGNORED** |
| `.mcp.json` | **IGNORED** |
| `PROVENANCE.md` | **IGNORED** |
| `AGENTS.md` | không ignore, **chưa từng `git add`** |
| `README.md` | không ignore, **chưa từng `git add`** |
| `tools/bootstrap-d365fo-cli.ps1` | không ignore, **chưa từng `git add`** |
| `tools/check-skill-sync.ps1` | không ignore, **chưa từng `git add`** |

`CLAUDE.md` tự khẳng định sai về chính nó:

> *"`tools/bootstrap-d365fo-cli.ps1` is committed to this repo (tracked, survives a
> plain `git clone`)"*

Thực tế: `git clone` mới → không có `CLAUDE.md`, không có skill Claude nào, không có
script bootstrap để tự phục hồi.

### F5 — 5 skill Claude là thư mục rỗng · **Cao**

Không có `SKILL.md`, nên Claude Code bỏ qua hoàn toàn (đã xác nhận: 5 tên này vắng
mặt trong danh sách skill khả dụng của phiên làm việc):

`data-upgrade-and-migration` · `error-handling-and-logging` ·
`financial-dimensions-patterns` · `ledger-posting-patterns` · `unit-testing-patterns`

Bản `.agents` của chúng có nội dung thật (124–180 dòng) — nhưng **đúng 5 bản đó lại
nằm trong nhóm 8 file nhiễm banner** ở F1. Đây là lý do chúng bị bỏ lại khi người
trước dọn `.claude`.

### F6 — Subagent được chỉ dẫn nhưng không tồn tại với Claude Code · **Cao**

`AGENTS.md` §Multi-Agent Orchestration và `CLAUDE.md` đều bảo dùng `reviewer`,
`tech-lead`, `xpp-coder`, `db-query`, `integration`, `security-auditor`.

**`.claude/agents/` không tồn tại.** 6 agent chỉ có ở `.codex/agents/*.toml` và
`.github/agents/*.agent.md`. Claude Code không đọc hai định dạng đó.

Thêm một lỗi tên: `.github/agents/reviewer.agent.md` khai
`tools: [read, search, "d365fo-mcp-se/*"]` trong khi `.mcp.json` đặt tên server là
`d365fo-mcp-server` → tool filter không bao giờ khớp.

### F7 — Sprawl 7 mirror, tất cả đã lệch nhau · **Trung bình**

`AGENTS.md` mô tả 3 mirror. Thực tế với `coc-extension-authoring`:

| Đường dẫn | Bytes | md5 (8 ký tự đầu) |
|---|---|---|
| `.agents/skills/…/SKILL.md` | 1.055 | `ad6aa689` |
| `.claude/skills/…/SKILL.md` | 7.819 | `8d8c9546` |
| `.github/instructions/….instructions.md` | 5.128 | `bc9fa453` |
| `.github/skills/….instructions.md` | 5.128 | `bc9fa453` |
| `.github/skills/…/SKILL.md` | 4.671 | `71f12869` |
| `.github/skills/d365fo-cli/references/….md` | 7.462 | `9e58ca2e` |
| `.vscode/skills/…/SKILL.md` | — | (bản thứ 7) |

5 nội dung khác nhau cho 1 chủ đề. `PROVENANCE.md` đã ghi `.github/instructions/`
là *"superseded, not merged"* nhưng chưa ai xoá.

### F8 — Không có lớp cưỡng chế nào · **Cao**

Không có `.claude/settings.json` (chỉ `settings.local.json` cá nhân, untracked, chứa
permission ad-hoc bao gồm cả một entry `Bash(...)` dài dòng dán nguyên từ một phiên
debug cũ). Không hooks. Không `.claude/commands/`. Không CI gate.

Mọi luật trong `AGENTS.md` — *"chạy doctor trước khi làm gì"*, *"không bao giờ
hand-author AOT XML"*, *"chưa review thì chưa xong"* — đều chỉ là văn bản thuyết
phục model. Luật quan trọng nhất trong số đó đã từng bị vi phạm và gây thiệt hại thật.

### F9 — CLI và MCP chồng chéo, không có luật chọn · **Trung bình**

MCP server `d365fo-mcp-server` cung cấp ~44 tool (`generate_object`, `validate`,
`lint`, `prepare`, `sdlc`, `get_knowledge`, `find_references`, …) phủ gần hết bề mặt
CLI. Nhưng 100% skill viết theo cú pháp Bash `d365fo generate …`.

Không tài liệu nào nói khi nào dùng cái nào → agent chọn tuỳ hứng, và mỗi lần gọi
Bash lại phát sinh permission prompt.

### F10 — Index đang stale · **Thấp, sửa ngay được**

```
d365fo doctor --output json  →  "allOk": false
  index freshness (stale-index): FAIL
  "Metadata\NWVEI\CompileLabels.xml (03:02:41Z) is newer than the index (02:42:07Z)"
```

Mọi thứ khác OK: bridge enabled + executable, xppc/xppbp/SyncEngine, MSBuild,
custom packages path trỏ đúng `Metadata/`.

### F11 — Trùng ngữ nghĩa làm loãng router · **Trung bình**

51 skill project + ~25 skill built-in nạp description vào mọi phiên. Các cụm chồng lấn:

| Cụm | Các skill |
|---|---|
| X++ class | `xpp-class-authoring` (stub 15 dòng) · `x++-class-authoring` (177) · `xpp-class-and-method-rules` (109) |
| Tài chính | `posting-and-financials` (220) · `ledger-posting-patterns` (rỗng) · `financial-dimensions-patterns` (rỗng) |
| Testing | `testing-and-quality` (150) · `unit-testing-patterns` (rỗng) |
| Integration | `integration-patterns` (195) · `integration-dmf-dualwrite` (204) |

---

## 4. Quyết định kiến trúc

**`.claude/skills/` là single source of truth.**

Lý do: đây là bản giàu nội dung nhất (157–269 dòng vs 13–16 dòng ở `.agents`), sạch
banner nguy hiểm (0/65 file nhiễm), và giữ được workflow `prepare change --grounding-token`.

Điều kiện tiên quyết: **phải đưa `.claude/` vào Git trước** (P2), nếu không thì nguồn
sự thật lại là thứ duy nhất không được bảo vệ — đúng lỗi đang mắc.

Mô hình đích:

```
.claude/skills/<id>/SKILL.md          ← NGUỒN (tracked, người sửa ở đây)
        │
        └── tools/sync-agent-skills.ps1 (generator)
                ├──→ .agents/skills/<id>/           (Codex)
                ├──→ .github/skills/<id>/           (Copilot)
                └──→ .vscode/skills/<id>/           (VS Code)
```

Các mirror sinh ra được đánh dấu "GENERATED — DO NOT EDIT" ở đầu file và được CI
kiểm tra là khớp với nguồn.

---

## 5. Lộ trình

### P0 — Chặn máu · ~0,5 ngày · rủi ro thấp, không xoá gì

| # | Việc | Tiêu chí nghiệm thu |
|---|---|---|
| 1 | Viết `tools/strip-fallback-banner.ps1`: xoá **đúng** dòng blockquote banner, giữ nguyên phần còn lại của file | `git diff` cho thấy mỗi file chỉ -1 dòng (±dòng trống) |
| 2 | Chạy trên cả 65 file (`.agents` 8, `.github` 29, `.vscode` 28) | Quét lại toàn repo → 0 hit |
| 3 | Mở rộng `check-skill-sync.ps1`: quét banner trên `.agents .claude .github .vscode .codex` | Script báo đúng 0 hit sau bước 2 |
| 4 | `d365fo index refresh` | `d365fo doctor --output json` → `allOk: true` |

**Rollback:** `git checkout -- .agents .github .vscode`. Bước 4 độc lập, chạy lại vô hại.

### P1 — Khôi phục nội dung đã mất · ~0,5 ngày · rủi ro trung bình

| # | Việc | Ghi chú |
|---|---|---|
| 5 | Lấp 5 skill rỗng trong `.claude/skills/` từ bản `.agents` **sau khi P0 đã gỡ banner** | F5; đây là lý do phải làm P0 trước |
| 6 | Copy `.agents/skills/d365fo-xpp-core/references/aot-metadata-safety.md` sang `.claude` | File chỉ có ở `.agents` |
| 7 | Chuẩn hoá `electronic-reporting-configuration-authoring`: 2 file rời ở `.agents` → layout `SKILL.md` + `references/` | `PROVENANCE.md` ghi đã reshape nhưng `.agents` vẫn còn bản cũ |
| 8 | **Không** khôi phục 24 stub ở `.agents` bằng tay — chúng sẽ được generator ghi đè ở P3 | Tránh làm 2 lần |
| 9 | Cập nhật `PROVENANCE.md`: ghi nhận đợt regression thứ hai (F3) và cách xử lý | Giữ đúng tinh thần tài liệu gốc |

**Rủi ro:** bước 5 đưa nội dung từ mirror kém tin cậy hơn vào nguồn. Phải đọc tay
từng file trong 5 file đó trước khi commit, không copy mù.

### P2 — Đưa vào version control · ~0,5 ngày · rủi ro thấp

| # | Việc |
|---|---|
| 10 | Thêm vào whitelist `.gitignore`: `!.claude/`, `!CLAUDE.md`, `!.mcp.json`, `!PROVENANCE.md` |
| 11 | Loại trừ lại phần cá nhân: `.claude/settings.local.json`, `.claude/*.local.json` |
| 12 | `git add` các file bị bỏ quên: `AGENTS.md`, `README.md`, `tools/bootstrap-d365fo-cli.ps1`, `tools/check-skill-sync.ps1` |
| 13 | Tách `settings.local.json`: phần dùng chung (permission cho `d365fo *`, đọc `PackagesLocalDirectory`) → `.claude/settings.json` (tracked); phần ad-hoc cá nhân ở lại local |
| 14 | Sửa câu khẳng định sai về bootstrap script trong `CLAUDE.md` (F4) |

**Tiêu chí nghiệm thu:** `git clone` vào thư mục sạch → có đủ `CLAUDE.md`,
`AGENTS.md`, `.claude/skills/`, `.mcp.json`, `tools/*.ps1`.

### P3 — Dẹp sprawl · ~1 ngày · **rủi ro cao, cần review kỹ**

| # | Việc | Ảnh hưởng |
|---|---|---|
| 15 | Viết `tools/sync-agent-skills.ps1`: sinh 3 mirror từ `.claude/skills/` | File mới |
| 16 | Chạy generator, ghi đè `.agents/`, `.github/skills/`, `.vscode/skills/` | Ghi đè 24 stub + 28 + 20 file |
| 17 | **Xoá** `.github/instructions/` (21 file) | Legacy, `PROVENANCE.md` đã ghi "superseded" |
| 18 | **Xoá** `.github/skills/*.instructions.md` (20 file) | Trùng hệt `.github/instructions/` (md5 giống nhau) |
| 19 | Gộp skill trùng ngữ nghĩa theo F11 → còn ~40 skill | Đổi tên/xoá thư mục |
| 20 | Viết lại §Instruction Routing trong `AGENTS.md` cho đúng mô hình mới | Hiện đang mô tả sai (3 mirror thay vì 7) |

**Rollback:** commit tách bạch theo từng bước 15–20 để revert được riêng lẻ. Bước
17–18 xoá 41 file — làm trên nhánh riêng, không squash.

**Lưu ý:** bước 19 thay đổi tên skill mà các skill khác tham chiếu bằng cú pháp
`$skill-name`. Phải grep toàn corpus tìm tên cũ và cập nhật đồng thời.

### P4 — Lớp cưỡng chế · ~1 ngày · đây là phần "hiện đại" thật sự

| # | Việc | Vì sao cần |
|---|---|---|
| 21 | Tạo `.claude/agents/` với 6 subagent port từ `.codex/agents/*.toml` | F6 — chỉ dẫn hiện trỏ vào agent không tồn tại |
| 22 | Sửa tên MCP server trong cả 3 định dạng agent: `d365fo-mcp-se` → `d365fo-mcp-server` | F6 |
| 23 | **PreToolUse hook**: chặn `Write`/`Edit` tạo file `Ax*.xml` **mới** dưới `Metadata/` | Luật duy nhất đã từng bị vi phạm gây thiệt hại thật. Chỉ chặn file mới; sửa file đã tồn tại vẫn cho phép, đúng như `AGENTS.md` quy định |
| 24 | **SessionStart hook**: chạy `d365fo doctor`, cảnh báo nếu bridge thiếu hoặc index stale | Thay vì bắt model nhớ bước 0 của Required Workflow |
| 25 | **PostToolUse hook**: sau khi sửa `.xml` chứa X++ → `d365fo validate xpp` + `lint` | Bắt lỗi sớm, không chờ build |
| 26 | `.claude/commands/`: `/d365fo-review`, `/d365fo-scaffold`, `/d365fo-doctor` | Đóng gói workflow lặp lại |
| 27 | Thêm `check-skill-sync.ps1` + kiểm tra generator-drift vào `azure-pipelines.yml` | F2 — guard phải chạy tự động |

**Nguyên tắc thiết kế hook:** chỉ cưỡng chế những luật mà (a) vi phạm gây thiệt hại
thật đã được ghi nhận, và (b) kiểm tra được bằng máy. Không hook hoá những thứ cần
phán đoán (ví dụ "có nên dùng CoC hay event handler") — để skill lo.

### P5 — Tài liệu luật CLI vs MCP · ~2 giờ

| # | Việc |
|---|---|
| 28 | Thêm §"CLI vs MCP" vào `AGENTS.md`: **MCP tool** cho đọc/tra cứu (có cấu trúc, không cần permission prompt); **Bash CLI** cho ghi/generate (có audit trail trong transcript) |
| 29 | Cập nhật allowlist permission trong `.claude/settings.json` cho khớp luật trên |
| 30 | Dọn entry `Bash(...)` rác trong `settings.local.json` |

---

## 6. Ma trận rủi ro

| Bước | Rủi ro | Giảm thiểu |
|---|---|---|
| P0-2 | Regex xoá nhầm nội dung hợp lệ | Chạy `-WhatIf` trước, kiểm `git diff --numstat` phải là -1 dòng/file |
| P1-5 | Đưa nội dung chất lượng thấp vào nguồn | Đọc tay 5 file, không copy mù |
| P3-17/18 | Xoá nhầm file còn được tham chiếu | Grep tên file trước khi xoá; commit riêng |
| P3-19 | Gãy tham chiếu `$skill-name` chéo giữa các skill | Grep toàn bộ corpus, sửa đồng thời |
| P4-23 | Hook chặn nhầm thao tác hợp lệ | Chỉ chặn *file mới*; log rõ lý do + cách override có chủ đích |

---

## 7. Thứ tự phụ thuộc

```
P0 ──→ P1 ──→ P2 ──→ P3 ──→ P4
 │                    │
 └── P0-4 (index)     └── P5 (độc lập, làm lúc nào cũng được)
     độc lập
```

P0 **phải** trước P1 (F5: 5 file cần lấp đang nhiễm banner).
P2 **phải** trước P3 (không thể lấy `.claude` làm nguồn khi nó chưa được bảo vệ).

---

## 8. Việc không nằm trong kế hoạch này

- Không đụng vào `Metadata/` — không có thay đổi X++/AOT nào.
- Không sửa `d365fo-cli` upstream.
- Không đánh giá chất lượng *nội dung kỹ thuật* của từng skill (ví dụ: lời khuyên về
  CoC trong `coc-extension-authoring` có đúng không). Kế hoạch này chỉ xử lý **cấu
  trúc, tính toàn vẹn và cơ chế cưỡng chế**. Một đợt review nội dung riêng nên làm sau
  P3, khi chỉ còn 1 bản để đọc thay vì 7.
- Không xử lý `C:\Users\khiemchg\Documents\d365fo-agent-setup` — xem §2, có thể xoá.

---

## 9. Kết quả thực thi — 2026-09-18

Nhánh `chore/agent-setup-remediation`, 4 commit. Không có file nào dưới `Metadata/` bị
chạm vào (đã kiểm: `git diff --cached --name-only | grep -c '^Metadata/'` → 0 ở mọi commit).

### Đã làm và đã verify

| Bước | Kết quả | Verify bằng |
|---|---|---|
| P0-1,2 Gỡ banner | 65 → **0** file | `tools/strip-fallback-banner.ps1`, dry-run trước; grep lại toàn repo |
| P0-3 Mở rộng guard | quét 2 → **5** mirror | script báo "Swept 5 mirror(s)" |
| P0-4 Index | `allOk: false` → **`true`** | `d365fo doctor --output json` |
| P1-5 Lấp 5 skill rỗng | 5 skill **live** | hệ thống nạp chúng vào danh sách khả dụng ngay sau khi copy — bằng chứng runtime, không phải suy đoán |
| P1-6,7 File thiếu / ER | `aot-metadata-safety.md` vào nguồn; 2 file ER trùng bị xoá | `cmp` xác nhận trùng hệt trước khi xoá |
| P2-10..13 Version control | `.claude` 0 → **93 file tracked** | `git ls-files .claude \| wc -l` |
| P2-14 Sửa khẳng định sai | CLAUDE.md nói đúng sự thật | giờ đã `git add` thật |
| P3-15,16 Generator | 3 mirror × **56 skill**, đồng bộ | `sync-agent-skills.ps1 -Check` → exit 0 |
| P3-17,18 Xoá legacy | **70 file** bị xoá | `.vscode/skills` 28, `.github/instructions` 21, `*.instructions.md` 19, + 2 |
| P3-20 AGENTS.md | §Instruction Routing viết lại đúng 3 mirror | — |
| P4-21,22 Subagent | **6 subagent live** cho Claude Code | phiên sau khởi động đã liệt kê đủ 6 |
| P4-23 Hook chặn AOT XML | **hoạt động** | 4 test: tạo mới→chặn, sửa file cũ→cho, ngoài `Metadata/`→cho, override→cho |
| P4-24 Hook doctor | **hoạt động** | phiên sau khởi động tự báo index stale |
| P4-26 Slash command | **3 command live** | `/d365fo-doctor`, `/d365fo-review`, `/d365fo-scaffold` |
| P5-28,29,30 CLI vs MCP | §"Tooling: CLI vs MCP" trong AGENTS.md; `settings.json` tách khỏi local | — |
| Clone sạch | có đủ **toàn bộ** cấu hình agent | `git clone` vào thư mục tạm, kiểm 16 đường dẫn, guard chạy được |

### Khác với kế hoạch ban đầu

1. **`.vscode/skills/` bị xoá, không phải giữ.** Tài liệu chính thức VS Code xác nhận nó
   **không phải** vị trí client nào đọc — VS Code lấy skill từ `.github/skills`,
   `.claude/skills`, `.agents/skills`. 28/65 file nhiễm nằm đúng ở đó, nơi không guard nào
   nhìn tới.
2. **Codex đọc `.agents/skills`, không phải `.codex/skills`.** Tài liệu OpenAI xác nhận —
   cấu trúc sẵn có đã đúng, không cần đổi.
3. **Agent Skills là chuẩn mở** (agentskills.io), format giống hệt nhau giữa 3 client, nên
   mirror là bản sao chứ không phải bản dịch. Generator đơn giản hơn dự kiến nhiều.
4. **P3-19 (gộp skill trùng) chưa làm** — chờ kết quả agent review.
5. **Hai guard bị tách lại trách nhiệm.** Chúng mâu thuẫn nhau sau khi generator thêm banner
   GENERATED. `sync-agent-skills.ps1` giữ phần mirror; `check-skill-sync.ps1` giữ phần policy
   + cấu trúc. Hai check cùng một thuộc tính chính là cách regression lần trước lọt lưới.
6. **`bootstrap-d365fo-cli.ps1` phải khoá lại.** Bước 5 của nó ghi đè `.claude/skills` bằng
   bản upstream và tái tạo `.github/skills/d365fo-cli/` — chạy nó sẽ undo P0–P3. Giờ cần
   `-DeployUpstreamSkills` mới chạy, kèm cảnh báo.

### Còn lại

- **P3-19 gộp skill trùng ngữ nghĩa** (F11) — chờ agent review.
- **P4-27 CI gate** — `tools/ci/agent-guards.yml` đã viết (template Azure DevOps), nhưng
  repo standalone này **không có** `azure-pipelines.yml` để include vào; phải làm ở repo
  Azure DevOps thật. Repo `d365fo-agent-setup` đã có GitHub Actions workflow tương đương.
- **Chưa verify runtime với Copilot và Codex.** Vị trí thư mục lấy từ tài liệu chính thức,
  nhưng tôi không chạy được hai agent đó trong phiên này để xác nhận chúng thực sự nạp skill.
