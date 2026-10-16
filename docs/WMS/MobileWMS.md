# MobileWMS — phân tích class trong model

> **Phạm vi:** `C:\GIT\NWVWMS\Metadata\MobileWMS` — chỉ các class trong `MobileWMS/AxClass`.
> **Kết quả inventory:** 64 class, 366 method, đối chiếu CLI và AxClass XML khớp 64/64.
> **Model:** `MobileWMS`, Display name `Tasklet Mobile WMS`, publisher `Tasklet Factory`, phiên bản `4.0.9`.

## Giả định và giới hạn

- Nguồn nghiệp vụ là `Metadata/MobileWMS/MobileWMS/AxClass/*.xml`; `XppMetadata` là metadata biên dịch. Index đang hoạt động của CLI trỏ tới `C:\AosService`, vì vậy đã tạo index tạm chỉ cho model trong repo và dùng `d365fo search class`/`get class` để inventory, xác nhận kế thừa.
- `d365fo read class` trỏ tới bản `XppMetadata` và không trả source body. Phần flow bên dưới được đối chiếu từ AxClass XML trong đúng model; không suy diễn implementation của `TFM*`, D365FO standard hay cấu hình runtime nằm ngoài phạm vi.
- Descriptor khai báo `ModuleReferences` tới `TFMobile`, `TaskletPlatform` và các module D365FO khác; `ModelReferences` rỗng. `d365fo models deps` không hiện dependency cho descriptor dạng này, nên quan hệ module lấy từ descriptor, không lấy kết quả đó làm kết luận không phụ thuộc.
- Field chỉ liệt kê field khai báo trực tiếp; `—` nghĩa là class không có field riêng trong declaration. Method là method tiêu biểu, không phải toàn bộ 366 method. Tên/mục đích dựa trên source comment, tên và method body; chỗ suy luận hoặc cần runtime configuration được ghi rõ.
- Ví dụ là pattern sử dụng, không phải chương trình độc lập. Process/logic block do Tasklet framework khởi tạo và dispatch; không nên gọi `post()` thủ công nếu chưa xác minh lifecycle.

## Bức tranh tổng thể

| Nhóm | Vai trò và luồng thường gặp |
|---|---|
| Process | `TFMProcess` chuyên biệt quy trình; constructor ghép logic block, nhánh điều kiện và add-on. Framework nhận request rồi dispatch process. |
| Logic block | `registrationCollectors()`/`headerFieldsNeeded()` khai báo dữ liệu cần nhập; `preparePost()` dựng/tra record và dimension; `post()` ghi hoặc gọi nghiệp vụ D365FO, trả `TFMPostResponseData`. |
| Component/context/operator | Component nạp buffer hoặc collector theo request; context bổ sung dữ liệu/điều kiện; operator như on-hand thêm dữ liệu vào logic context. |
| Add-on | Được gắn vào block tương thích, biến đổi collector/request trước khi post hoặc điều chỉnh dữ liệu trước khi post. |
| Contract/extension/expression | Contract serialize cấu hình; CoC mở rộng dimension setup; expression trả vị trí picking/issue theo item và warehouse. |
| Luồng chung | Mobile input → process/block thu thập item, quantity, dimensions, journal hoặc license plate → validate/ghi/post → response hoặc side effect nghiệp vụ. |

## Danh mục 64 class

### Logic block, journal, inventory và production

### `MwmsLogicBlock`
1. **Tên class:** `MwmsLogicBlock`
2. **Mục đích/chức năng chính:** Base logic block dùng chung trong MobileWMS.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `new()`, `blockName()` — thiết lập và nhận diện block.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicBlock`; base cho các block MobileWMS.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Process tạo block → framework gọi các hook của base/derived block.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Được process kế thừa/ghép, không gọi trực tiếp.
8. **Lưu ý/rủi ro thường gặp:** Không chứa nghiệp vụ riêng; xem lớp dẫn xuất để biết side effect.

### `MwmsLogicBlockAddBOMPickLine`
1. **Tên class:** `MwmsLogicBlockAddBOMPickLine`
2. **Mục đích/chức năng chính:** Tạo dòng pick-list/BOM cho journal sản xuất.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `inventDim`, `inventTable`, `prodJournalTable`, `prodJournalBOM`: dimension, item, header và dòng BOM đang xử lý.
4. **Method chính và khi nào dùng:** `initProdJournalBOMCreate()`, `preparePost()`, `post()`, `headerFieldsNeeded()` — dựng và ghi dòng.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlock`; dùng `ProdJournalTable/BOM`, `InventTable/Dim`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/qty/dimension → khởi tạo BOM journal line → ghi dòng và trả response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Được add vào process sản xuất; ví dụ flow là process, không khởi tạo trực tiếp.
8. **Lưu ý/rủi ro thường gặp:** Kiểm tra journal type, item/dimension và trạng thái journal trước khi post.

### `MwmsLogicBlockAddCountLine`
1. **Tên class:** `MwmsLogicBlockAddCountLine`
2. **Mục đích/chức năng chính:** Chuyên biệt việc thêm dòng counting journal và giá trị on-hand.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `inventTable`: item hiện tại.
4. **Method chính và khi nào dùng:** `Construct()`, `preparePost()`, `post()`, `registrationCollectors()` — thu thập và ghi dòng đếm.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlockCreateCountingJournalLine`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/dimension/count → chuẩn bị dòng và on-hand → ghi counting line.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsLogicBlockAddCountLine::Construct()` trong process.
8. **Lưu ý/rủi ro thường gặp:** On-hand phụ thuộc dimension và thời điểm; không coi số liệu cũ là tồn hiện tại.

### `MwmsLogicBlockAddonCancelMoveWhenSimilar`
1. **Tên class:** `MwmsLogicBlockAddonCancelMoveWhenSimilar`
2. **Mục đích/chức năng chính:** Add-on nhằm bỏ/điều chỉnh thao tác move khi input tương tự trạng thái hiện có; ý nghĩa “similar” cần xác minh theo block/config cụ thể.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `compatibleWithBlock()`, `modifyDataBeforePost()`, `addonName()` — chọn block và tác động trước post.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicBlockAddon`; được gắn vào block tương thích.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Block move + input source/destination → add-on kiểm tra/sửa trước post → tiếp tục hoặc không tạo thay đổi.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `blockCollection().addBlockAddon(block, new MwmsLogicBlockAddonCancelMoveWhenSimilar())`.
8. **Lưu ý/rủi ro thường gặp:** Xác nhận điều kiện so sánh có bao gồm mọi dimension/LP cần thiết; tránh hủy move hợp lệ.

### `MwmsLogicBlockAddonClassifyInput`
1. **Tên class:** `MwmsLogicBlockAddonClassifyInput`
2. **Mục đích/chức năng chính:** Phân loại input scan và bổ sung giá trị item/dimension/on-hand vào request/collectors.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `ScanBarcodeFieldName`: key scan; `uniqueValuesFields`: map các giá trị unique cần trả lại.
4. **Method chính và khi nào dùng:** `modifyRequest()`, `modifyRegistrationCollectors()`, `modifyHeaderCollectors()`, `addOnHandQty()`, `findUniqueValues()`, `resetUniqueFields()` — xử lý barcode/giá trị phân loại.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicBlockAddon`; dùng trong process transfer/tag-count có classify input.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Barcode/request → map ItemId hoặc batch/serial, tìm giá trị unique và on-hand → request/collector đã enrich.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Gắn vào block collection của process có bước classify.
8. **Lưu ý/rủi ro thường gặp:** Tên key là contract với client; xác minh trường barcode và quy tắc phân loại/unique trước khi đổi.

### `MwmsLogicBlockAddonInventoryUnit`
1. **Tên class:** `MwmsLogicBlockAddonInventoryUnit`
2. **Mục đích/chức năng chính:** Thêm dữ liệu đơn vị tồn kho cho block.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `compatibleWithBlock()`, `modifyRegistrationCollectors()`, `makeUnitOfMeasureCollector()`, `modifyRequestBeforePost()` — thu thập/chuyển unit theo request.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicBlockAddon`; dùng `TFMRegistrationCollector*`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/unit scan → collector UOM và request được bổ sung → block xử lý quantity theo unit.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Đăng ký add-on với block hỗ trợ inventory unit.
8. **Lưu ý/rủi ro thường gặp:** UOM, conversion và unit mặc định phải phù hợp item; không giả định mọi unit có thể quy đổi.

### `MwmsLogicBlockAddonNegativeQuantity`
1. **Tên class:** `MwmsLogicBlockAddonNegativeQuantity`
2. **Mục đích/chức năng chính:** Áp dụng quy tắc quantity âm cho luồng adjustment.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `compatibleWithBlock()`, `modifyRequestBeforePost()` — giới hạn block tương thích và sửa request.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicBlockAddon`; được process Negative Adjustment gắn với line block.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Quantity input → add-on chuẩn hóa dấu → adjustment line được post.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Process gắn `new MwmsLogicBlockAddonNegativeQuantity()` lên line block.
8. **Lưu ý/rủi ro thường gặp:** Sai dấu có thể tạo adjustment ngược nghiệp vụ; chỉ dùng trong flow đã thiết kế.

### `MwmsLogicBlockAddonTransformItemDimensions`
1. **Tên class:** `MwmsLogicBlockAddonTransformItemDimensions`
2. **Mục đích/chức năng chính:** Điều chỉnh cách collectors thu thập item dimensions; phạm vi cụ thể phụ thuộc collector/block.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `compatibleWithBlock()`, `modifyRegistrationCollectors()` — đổi cấu hình collectors.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicBlockAddon`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/dimension setup → collector được biến đổi → dữ liệu dimension đi vào request.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Gắn trong block collection cần transform dimensions.
8. **Lưu ý/rủi ro thường gặp:** Thay collector có thể đổi protocol màn hình; test item có dimension group khác nhau.

### `MwmsLogicBlockCancelPickLine`
1. **Tên class:** `MwmsLogicBlockCancelPickLine`
2. **Mục đích/chức năng chính:** Hủy dòng pick hiện có.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `wmsOrderTrans`: dòng kho được hủy.
4. **Method chính và khi nào dùng:** `cancelPickLine()`, `post()`, `registrationCollectors()` — nhận và thực hiện hủy.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicBlock`; được dùng bởi `MwmsProcessCancelPickLine`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Order/trans input → nạp `WMSOrderTrans` → cập nhật trạng thái pick và response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Process add `MwmsLogicBlockCancelPickLine::Construct()`.
8. **Lưu ý/rủi ro thường gặp:** Hủy đúng work/order line; xác minh status, reservation và khả năng hủy trước khi retry.

### `MwmsLogicBlockCreateCountingJournal`
1. **Tên class:** `MwmsLogicBlockCreateCountingJournal`
2. **Mục đích/chức năng chính:** Tạo counting journal header.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —; header state dùng base `MwmsLogicBlockjournalsCommon`.
4. **Method chính và khi nào dùng:** `Construct()`, `headerFieldsNeeded()`, `registrationCollectors()`, `post()` — thu thập header và tạo journal.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlockjournalsCommon`; dùng journal component chung.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Warehouse/journal name/description → tạo header → trả journal context cho line block.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsLogicBlockCreateCountingJournal::Construct()` trong process.
8. **Lưu ý/rủi ro thường gặp:** Journal name/type và warehouse/site phải hợp lệ trước khi tạo.

### `MwmsLogicBlockCreateCountingJournalLine`
1. **Tên class:** `MwmsLogicBlockCreateCountingJournalLine`
2. **Mục đích/chức năng chính:** Tạo counting journal line.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —; buffer dùng base `MwmsLogicBlockJournalLinesCommon`.
4. **Method chính và khi nào dùng:** `Construct()`, `preparePost()`, `post()`, `addOnhandStuff()` — chuẩn bị và ghi line/on-hand.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlockJournalLinesCommon`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/count/dimension → tạo hoặc chuẩn bị counting trans → ghi line.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsLogicBlockCreateCountingJournalLine::Construct()` trong process.
8. **Lưu ý/rủi ro thường gặp:** Kiểm tra dimension và cách tính counted quantity; xử lý duplicate/retry theo journal line.

### `MwmsLogicBlockCreateMovementJournal`
1. **Tên class:** `MwmsLogicBlockCreateMovementJournal`
2. **Mục đích/chức năng chính:** Tạo movement journal header.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —; kế thừa header request/buffer.
4. **Method chính và khi nào dùng:** `Construct()`, `headerFieldsNeeded()`, `post()`, `autoCreatedProcesses()` — tạo header và hỗ trợ process phụ.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlockjournalsCommon`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Header input → tạo movement journal → truyền header cho line/move blocks.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsLogicBlockCreateMovementJournal::Construct()` trong process.
8. **Lưu ý/rủi ro thường gặp:** Xác minh journal name, warehouse/site và auto-created flow.

### `MwmsLogicBlockCreateMovementJournalLine`
1. **Tên class:** `MwmsLogicBlockCreateMovementJournalLine`
2. **Mục đích/chức năng chính:** Tạo movement journal line.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —; kế thừa buffer chung.
4. **Method chính và khi nào dùng:** `Construct()`, `preparePost()`, `post()`, `registrationCollectors()` — dựng và ghi line.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlockJournalLinesCommon`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/qty/from-to dimensions → tạo line → trả post response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Ghép sau movement header bằng process.
8. **Lưu ý/rủi ro thường gặp:** From/to dimension phải nhất quán; kiểm tra quantity và journal status.

### `MwmsLogicBlockCreateProfitLossJournal`
1. **Tên class:** `MwmsLogicBlockCreateProfitLossJournal`
2. **Mục đích/chức năng chính:** Tạo profit/loss adjustment journal header.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `Construct()`, `InventoryAdjustmentCauses()`, `post()` — cấu hình header/cause và tạo journal.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlockjournalsCommon`; dùng với line và journal-post block.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Warehouse/cause/header → tạo adjustment journal → line block tiếp tục.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsLogicBlockCreateProfitLossJournal::Construct()` trong adjustment process.
8. **Lưu ý/rủi ro thường gặp:** Adjustment cause và journal type ảnh hưởng posting/accounting.

### `MwmsLogicBlockCreateProfitLossJournalLine`
1. **Tên class:** `MwmsLogicBlockCreateProfitLossJournalLine`
2. **Mục đích/chức năng chính:** Tạo profit/loss journal line.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `Construct()`, `preparePost()`, `post()`, `registrationCollectors()` — thu thập và ghi adjustment line.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlockJournalLinesCommon`; negative add-on có thể đổi quantity.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/qty/dimension/cause → tạo line → trả kết quả cho journal-post block.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Process gắn negative-quantity add-on lên line block.
8. **Lưu ý/rủi ro thường gặp:** Xác minh dấu quantity, offset/cause và dimension tài chính theo cấu hình.

### `MwmsLogicBlockCreateQuarantineOrder`
1. **Tên class:** `MwmsLogicBlockCreateQuarantineOrder`
2. **Mục đích/chức năng chính:** Tạo quarantine order từ mobile request.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `qOrder`: buffer quarantine order đang khởi tạo.
4. **Method chính và khi nào dùng:** `createQuarantineOrder()`, `getQuarantineInventDimWithWMSLocation()`, `post()`, `headerFieldsNeeded()` — xây dimension/order và ghi.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicBlock`; được dùng bởi quarantine process và data-context/image block.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/qty/warehouse/dimensions → dựng quarantine dimension/order → ghi order/response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsLogicBlockCreateQuarantineOrder::Construct()` trong process.
8. **Lưu ý/rủi ro thường gặp:** Bắt buộc dimension/location hợp lệ; tránh tạo trùng order khi client retry.

### `MwmsLogicBlockCreateTagCountingJournal`
1. **Tên class:** `MwmsLogicBlockCreateTagCountingJournal`
2. **Mục đích/chức năng chính:** Tạo tag-counting journal header.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `new()`, `headerFieldsNeeded()`, `registrationCollectors()`, `post()` — cấu hình và tạo header.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlockjournalsCommon`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Warehouse/header fields → journal header → tag line process.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Process tag counting tạo header block qua framework.
8. **Lưu ý/rủi ro thường gặp:** Không nhầm tag-count journal với standard counting journal.

### `MwmsLogicBlockCreateTagCountingJournalLicensePlateLine`
1. **Tên class:** `MwmsLogicBlockCreateTagCountingJournalLicensePlateLine`
2. **Mục đích/chức năng chính:** Tạo tag-counting line theo nội dung license plate.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `Construct()`, `post()`, `updateToLocationOnTransferJournalLicensePlateLines()` — ghi/cập nhật LP line.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlockJournalLinesCommon`; dùng WHS license plate.
6. **Luồng sử dụng thực tế (input → xử lý → output):** LP + item/dimension/count → tạo tag line tương ứng → response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `...LicensePlateLine::Construct()` ở nhánh LP.
8. **Lưu ý/rủi ro thường gặp:** LP phải tồn tại và dimension content phải khớp.

### `MwmsLogicBlockCreateTagCountingJournalLine`
1. **Tên class:** `MwmsLogicBlockCreateTagCountingJournalLine`
2. **Mục đích/chức năng chính:** Tạo tag-count journal line cho item.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `Construct()`, `preparePost()`, `post()`, `addTagnumber()` — thêm tag number và cập nhật header totals.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlockJournalLinesCommon`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/tag/count input → lấy/tạo tag line number → ghi và cập nhật journal.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsLogicBlockCreateTagCountingJournalLine::Construct()` trong process.
8. **Lưu ý/rủi ro thường gặp:** `addTagnumber()` dựa trên LineNum lớn nhất; đồng thời tạo line cần kiểm tra cạnh tranh.

### `MwmsLogicBlockCreateTransferJournal`
1. **Tên class:** `MwmsLogicBlockCreateTransferJournal`
2. **Mục đích/chức năng chính:** Tạo transfer journal header.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `Construct()`, `headerFieldsNeeded()`, `registrationCollectors()`, `post()` — khởi tạo header.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlockjournalsCommon`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Warehouse/from-to context → tạo transfer header → line block xử lý item/LP.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsLogicBlockCreateTransferJournal::Construct()` trong process transfer.
8. **Lưu ý/rủi ro thường gặp:** Header warehouse/site phải tương thích với dimension hai đầu.

### `MwmsLogicBlockCreateTransferJournalLicensePlateLine`
1. **Tên class:** `MwmsLogicBlockCreateTransferJournalLicensePlateLine`
2. **Mục đích/chức năng chính:** Tạo transfer journal line theo license plate.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `Construct()`, `post()`, `updateToLocationOnTransferJournalLicensePlateLines()` — tạo/cập nhật LP line.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlockJournalLinesCommon`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** LP + destination → tạo transfer line → response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Dùng ở nhánh LP của transfer process.
8. **Lưu ý/rủi ro thường gặp:** Đảm bảo LP, source location và destination phù hợp quy tắc WHS.

### `MwmsLogicBlockCreateTransferJournalLine`
1. **Tên class:** `MwmsLogicBlockCreateTransferJournalLine`
2. **Mục đích/chức năng chính:** Tạo hoặc cập nhật transfer journal line.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —; shared state ở base journal line.
4. **Method chính và khi nào dùng:** `preparePost()`, `post()`, `updateJournalLine()`, `registrationCollectors()` — phân nhánh Add/Update, tạo dimensions và validate transfer.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlockJournalLinesCommon`; gọi `MobPostHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Request item/from-to/qty → resolve journal và dimensions → insert/update line, validate journal → response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsLogicBlockCreateTransferJournalLine::Construct()` trong process.
8. **Lưu ý/rủi ro thường gặp:** Update dùng referred record; kiểm tra Add/Update, From/To dimension và duplicate submit.

### `MwmsLogicBlockDeleteJournalLine`
1. **Tên class:** `MwmsLogicBlockDeleteJournalLine`
2. **Mục đích/chức năng chính:** Xóa journal line theo request.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `headerFieldsNeeded()`, `registrationCollectors()`, `post()`, `autoCreatedProcesses()` — xác định line và xóa.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlock`; tác động journal buffer.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Journal/line identifier → resolve line → delete và trả response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Được gọi từ process/config có thao tác delete line.
8. **Lưu ý/rủi ro thường gặp:** Side effect phá hủy dữ liệu; xác minh line thuộc journal đúng và chưa posted.

### `MwmsLogicBlockFinishQuarantineOrder`
1. **Tên class:** `MwmsLogicBlockFinishQuarantineOrder`
2. **Mục đích/chức năng chính:** Hoàn tất quarantine order; hỗ trợ scrap và partial quantity.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `qOrder`: order; `inventQuarantineId`: mã; `qty`, `scrapQty`: lượng hoàn tất/phế.
4. **Method chính và khi nào dùng:** `parmInventQuarantineId()`, `parmQuantity()`, `parmScrapQuantity()`, `post()` — validate, split, report finished và end order.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicBlock`; được ghép với `MwmsProcessFinishQuarantineOrders` và move block.
6. **Luồng sử dụng thực tế (input → xử lý → output):** ID/qty/scrap → kiểm tra remain, xử lý scrap/split, report finished, end → response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Process finish quarantine đưa block vào flow.
8. **Lưu ý/rủi ro thường gặp:** Không để `qty + scrapQty` vượt `RemainQty`; transaction retry và trạng thái từng bước cần được quản lý.

### `MwmsLogicBlockJournalLinesCommon`
1. **Tên class:** `MwmsLogicBlockJournalLinesCommon`
2. **Mục đích/chức năng chính:** Base cho inventory journal lines; giữ buffer và cờ Add/Update.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `inventJournalTrans`, `_tag`, `inventJournalTable`, `inventDim`; `createOrUpdate`: chế độ thêm/sửa.
4. **Method chính và khi nào dùng:** `getInventJournalTrans*()`, `parmCreateOrUpdate()`, `lockWarehouseInHeader()`, `getTables()` — resolve/khóa buffer.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlock`; base cho các line blocks.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Request → resolve header/line/dim → lớp dẫn xuất chuẩn bị/post.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Lớp dẫn xuất gọi `getTables()`/`parmCreateOrUpdate()`.
8. **Lưu ý/rủi ro thường gặp:** Không chia sẻ buffer qua request khác; kiểm tra locking và transaction ở derived post.

### `MwmsLogicBlockjournalsCommon`
1. **Tên class:** `MwmsLogicBlockjournalsCommon`
2. **Mục đích/chức năng chính:** Base cho inventory journal headers và request.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `inventJournalTable`: header; `docRequest`: request đã chuyển kiểu item/dim.
4. **Method chính và khi nào dùng:** `getInventJournalTable()`, `parmRequest()`, `new()` — lưu request/header state chung.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlock`; base cho các header blocks.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Header request → giữ typed request/buffer → lớp dẫn xuất tạo journal.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Dùng gián tiếp qua counting/transfer/movement/adjustment header.
8. **Lưu ý/rủi ro thường gặp:** `docRequest` là request state; không dùng nhầm request type hoặc company context.

### `MwmsLogicBlockMoveInvent`
1. **Tên class:** `MwmsLogicBlockMoveInvent`
2. **Mục đích/chức năng chính:** Di chuyển tồn kho qua movement journal, gồm from/to dimension.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `inventJournalTable`, `inventJournalTrans`; `inventDimIssue`, `inventDimReceipt`: hai đầu di chuyển.
4. **Method chính và khi nào dùng:** `headerFieldsNeeded()`, `registrationCollectors()`, `preparePost()`, `post()` — thu thập và ghi move.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlock`; dùng `MwmsLogicComponentInventoryMovement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/qty/from/to → chuẩn hóa dimensions, tạo journal line → ghi move/response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `new MwmsLogicBlockMoveInvent()` trong move process.
8. **Lưu ý/rủi ro thường gặp:** Nhầm from/to, location hoặc LP có thể chuyển tồn sai; validate warehouse/dimension đầy đủ.

### `MwmsLogicBlockMoveLicensePlate`
1. **Tên class:** `MwmsLogicBlockMoveLicensePlate`
2. **Mục đích/chức năng chính:** Di chuyển license plate.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `inventJournalTable`: journal được dùng cho thao tác.
4. **Method chính và khi nào dùng:** `Construct()`, `registrationCollectors()`, `post()`, `blockName()` — nhận LP/destination và di chuyển.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicBlock`; kết hợp với move-item block trong `MwmsProcessMoveInventory`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** LP + destination → kiểm tra/ghi chuyển vị trí → response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsLogicBlockMoveLicensePlate::Construct()` trong process.
8. **Lưu ý/rủi ro thường gặp:** Chỉ áp dụng khi LP tracking/location setup cho phép.

### `MwmsLogicBlockMoveMultipleLicensePlates`
1. **Tên class:** `MwmsLogicBlockMoveMultipleLicensePlates`
2. **Mục đích/chức năng chính:** Di chuyển nhiều license plate trong một flow.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `registrationCollectors()`, `post()`, `autoCreatedProcesses()` — thu thập nhiều LP và xử lý move.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicBlock`; dùng framework process/collectors.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Nhiều LP + destination → xử lý danh sách move → kết quả của process.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Framework cấu hình block cho thao tác multiple LP.
8. **Lưu ý/rủi ro thường gặp:** Xác minh xử lý một phần/thất bại giữa nhiều LP; không retry toàn bộ mù quáng.

### `MwmsLogicBlockPostInventoryJournal`
1. **Tên class:** `MwmsLogicBlockPostInventoryJournal`
2. **Mục đích/chức năng chính:** Post inventory journal từ thiết bị.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `postJournalId`: tên/key process phụ `PostJournal`.
4. **Method chính và khi nào dùng:** `Construct()`, `post()`, `autoCreatedProcesses()`, `addTranslations()` — dispatch posting và thông báo.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlock`; dùng D365FO journal-posting framework.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Journal ID → post journal → response/infolog.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsLogicBlockPostInventoryJournal::Construct()` sau khi tạo line.
8. **Lưu ý/rủi ro thường gặp:** Posting không idempotent; kiểm tra journal chưa posted trước khi retry.

### `MwmsLogicBlockProdErrorQty`
1. **Tên class:** `MwmsLogicBlockProdErrorQty`
2. **Mục đích/chức năng chính:** Đăng ký scrap/error quantity trong production.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `Construct()`, `registrationCollectors()`, `post()` — nhận và ghi production error quantity.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicBlock`; liên quan production journal.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Production order + error qty → ghi scrap registration → response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Dùng trong production process có scrap registration.
8. **Lưu ý/rủi ro thường gặp:** Xác minh đơn vị, quantity dấu dương/âm, và trạng thái lệnh sản xuất.

### `MwmsLogicBlockRegisterBarcode`
1. **Tên class:** `MwmsLogicBlockRegisterBarcode`
2. **Mục đích/chức năng chính:** Đăng ký barcode mới cho item.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `inventTable`, `inventItemBarcode`, `inventDim`: item, barcode record và dimension.
4. **Method chính và khi nào dùng:** `barcodeSetup()`, `preparePost()`, `post()`, `extractInfoLogInfo()` — validate setup và ghi barcode.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicBlock`; dùng barcode/item/dimension setup.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item + barcode + dimension input → validate mapping/setup → tạo barcode record/response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsLogicBlockRegisterBarcode::Construct()` trong barcode process.
8. **Lưu ý/rủi ro thường gặp:** Barcode phải duy nhất và đúng unit/dimension; không nhầm registration với barcode scan/lookup.

### `MwmsLogicBlockRegisterItemImage`
1. **Tên class:** `MwmsLogicBlockRegisterItemImage`
2. **Mục đích/chức năng chính:** Lưu/đăng ký hình ảnh cho item.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `inventTable`, `inventDim`, `common`: item, dimension và record liên quan.
4. **Method chính và khi nào dùng:** `getRecord()`, `getCommon()`, `post()`, `registrationCollectors()` — resolve record và ghi image.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MWmsLogicBlock`; dùng image/data context của Tasklet.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/record + image input → xác định record đích → lưu image/response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsLogicBlockRegisterItemImage::Construct()` trong process.
8. **Lưu ý/rủi ro thường gặp:** Xác nhận record đích, định dạng/kích thước ảnh và quyền; không truyền ảnh sai item.

### `MwmsLogicBlockReportProductionAsFinished`
1. **Tên class:** `MwmsLogicBlockReportProductionAsFinished`
2. **Mục đích/chức năng chính:** Báo cáo production order là finished và tạo journal tương ứng.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `prodJournalTable`, `prodTable`, `prodRoute`, `inventDim`, `prodJournalProd`: header/order/route/dim/line.
4. **Method chính và khi nào dùng:** `makeJournalLine()`, `postReportAsFinished_Route()`, `post()`, `setConditionToManualAllocation()` — dựng line và post RAF.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicBlock`, implement collection interfaces; dùng production journal APIs.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Order/good qty/dim/batch/serial → dựng production line → post RAF và response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Ghép trong process sản xuất; framework lấy `post()` làm bước nghiệp vụ.
8. **Lưu ý/rủi ro thường gặp:** Route/material allocation, batch expiry và serialization ảnh hưởng posting; source có version-conditional logic.

### `MwmsLogicBlockStartProductionOrder`
1. **Tên class:** `MwmsLogicBlockStartProductionOrder`
2. **Mục đích/chức năng chính:** Khởi động production order theo quantity.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `prodTable`: lệnh được tìm thấy.
4. **Method chính và khi nào dùng:** `post()` — tạo/start-up parameters, đặt quantity rồi chạy `ProdMultiStartUp`.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicBlock`; gọi D365FO production APIs.
6. **Luồng sử dụng thực tế (input → xử lý → output):** ProdId/qty → tìm order, tạo start-up parm → start và trả response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Process gọi block `post()` thông qua framework.
8. **Lưu ý/rủi ro thường gặp:** Source đặt `RouteAutoConsump` và `BOMAutoConsump` là `Never`; không giả định consumption tự động.

### Component, context, operator và image handler

### `MwmsLogicComponentInventoryJournalId`
1. **Tên class:** `MwmsLogicComponentInventoryJournalId`
2. **Mục đích/chức năng chính:** Component cung cấp/khởi tạo journal ID/header context.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `requestClassProvided()`, `provideDataIfPossible()`, `initInventJournalTable()`, `headerFieldsNeeded()` — khởi tạo khi block cần buffer.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicComponent`; dùng request/dimension components và journal tables.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Typed request → component tạo/điền journal header → trả buffer cho block.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Lấy qua block component registry theo framework.
8. **Lưu ý/rủi ro thường gặp:** Journal ID phải được lấy từ đúng journal name/sequence và warehouse context.

### `MwmsLogicComponentInventoryJournalLicensePlates`
1. **Tên class:** `MwmsLogicComponentInventoryJournalLicensePlates`
2. **Mục đích/chức năng chính:** Thu thập/license-plate data trên inventory journal.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `initLicensePlate()`, `provideDataIfPossible()`, `headerFieldsNeeded()` — tạo/điền LP state.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicComponentInventoryJournalId`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** LP/request → khởi tạo dimension/license plate buffer → cung cấp cho line block.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Dùng như component của journal line block.
8. **Lưu ý/rủi ro thường gặp:** Kiểm tra LP tồn tại, warehouse và dimension group.

### `MwmsLogicComponentInventoryJournalLines`
1. **Tên class:** `MwmsLogicComponentInventoryJournalLines`
2. **Mục đích/chức năng chính:** Khởi tạo inventory journal line và quantity/dimensions.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `initInventJournalTrans()`, `provideDataIfPossible()`, `new()` — nạp line buffer từ request.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `MwmsLogicComponentInventoryJournalId`; dùng dimension/quantity components.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/qty/dim request → tạo/điền journal trans → block chuẩn bị ghi.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Component được block truy cập qua `components`.
8. **Lưu ý/rủi ro thường gặp:** Item, unit, journal type và InventDim phải thống nhất.

### `MwmsLogicComponentInventoryJournalsCommonHeader`
1. **Tên class:** `MwmsLogicComponentInventoryJournalsCommonHeader`
2. **Mục đích/chức năng chính:** Component chung tạo inventory journal header.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `requestClassProvided()`, `provideDataIfPossible()`, `initJournalTable()`, `registrationCollectors()` — dựng header từ request.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicComponent`; dùng `JournalTableData`, journal name và warehouse.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Header request → cấp JournalId, site/warehouse, type, description → header buffer.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Được các journal-header blocks dùng tự động.
8. **Lưu ý/rủi ro thường gặp:** Kiểm tra JournalNameId, journal type và tồn tại warehouse/site.

### `MwmsLogicComponentInventoryMovement`
1. **Tên class:** `MwmsLogicComponentInventoryMovement`
2. **Mục đích/chức năng chính:** Thu thập destination location và license plate cho inventory movement.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `requestClassProvided()`, `registrationCollectors()`, `headerFieldsNeeded()` — thêm collectors có điều kiện theo dimension setup.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicComponent`; dùng `TFMLogicContextDimensionSetup`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/setup → collector To-location/To-LP bật/tắt → dữ liệu đến request.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Component đăng ký trong move block.
8. **Lưu ý/rủi ro thường gặp:** Điều kiện active/optional phụ thuộc item dimension setup; không mặc định luôn yêu cầu location và LP.

### `MwmsLogicContextUnitOfMeasure`
1. **Tên class:** `MwmsLogicContextUnitOfMeasure`
2. **Mục đích/chức năng chính:** Cung cấp context cho danh sách UOM của item.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `Construct()`, `process()`, `Name()`, `icon()` — tạo context function và xử lý unit context.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicContextFunctions`; dùng `TFMUnitOfMeasureContextContract` và UOM helpers.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/context → resolve UOM list/default → trả context cho client/collector.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Đăng ký/cấu hình như context function, không gọi như business process.
8. **Lưu ý/rủi ro thường gặp:** Conversion phụ thuộc item và unit setup; kiểm tra contract/version giữa client và server.

### `MwmsLogicStepOperatorOnHand`
1. **Tên class:** `MwmsLogicStepOperatorOnHand`
2. **Mục đích/chức năng chính:** Đưa InventSum/on-hand record vào logic context.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `inventSum`: tổng tồn đã resolve theo item/dimensions.
4. **Method chính và khi nào dùng:** `runLogic()`, `getInventSum()`, `blockName()` — resolve request item/dimension rồi ghi context.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMLogicBlock`, implement `TFMLogicStepOperatorInterface`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item + InventDim → `InventSum::findSum()` → thêm dữ liệu vào logic context.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Được gọi như operator trong process rule graph.
8. **Lưu ý/rủi ro thường gặp:** On-hand phụ thuộc dimensions đưa vào; không đồng nghĩa quantity khả dụng/reservable.

### `MwmsImageHandlerCombinedImages`
1. **Tên class:** `MwmsImageHandlerCombinedImages`
2. **Mục đích/chức năng chính:** Image handler cho flow production, xử lý ảnh tổng hợp.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `process()`, `productionStart()` — framework gọi khi xử lý ảnh và bắt đầu production flow.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMImageHandler`; dependency Tasklet image framework.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Image/production context → xử lý callback → ảnh/kết quả cho handler.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Đăng ký/được framework gọi, không tự tạo handler trong process nghiệp vụ.
8. **Lưu ý/rủi ro thường gặp:** Contract ảnh và callback phụ thuộc framework; kiểm tra payload, thứ tự callback và dung lượng.

### Process — ghép workflow

### `MwmsProcessAddCountLine`
1. **Tên class:** `MwmsProcessAddCountLine`
2. **Mục đích/chức năng chính:** Process thêm counting line; tắt value transfer tự động trên block.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `new()` — tạo `MwmsLogicBlockAddCountLine` và gắn disable-value-transfer add-on.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMProcess`; dùng `MwmsLogicBlockAddCountLine`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/count request → line block → counting journal line.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Tasklet dispatcher tạo process theo configuration.
8. **Lưu ý/rủi ro thường gặp:** Cần counting header hợp lệ và value-transfer behavior phù hợp.

### `MwmsProcessCancelPickLine`
1. **Tên class:** `MwmsProcessCancelPickLine`
2. **Mục đích/chức năng chính:** Process hủy pick line.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `new()` — đặt process name và add cancel block.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMProcess`; dùng `MwmsLogicBlockCancelPickLine`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Work/order line input → cancel block → trạng thái/response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Framework dispatch theo process name `CancelPickLine`.
8. **Lưu ý/rủi ro thường gặp:** Retry có thể đụng line đã hủy/đổi trạng thái.

### `MwmsProcessCreateQuarantineOrder`
1. **Tên class:** `MwmsProcessCreateQuarantineOrder`
2. **Mục đích/chức năng chính:** Process tạo quarantine order và gắn thêm bước lấy ảnh/data context.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `new()`, `Construct()` — nối create-order block với take-image block.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMProcess`; dùng `MwmsLogicBlockCreateQuarantineOrder`, `TFMLogicBlockTakeImage`, data context.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Quarantine request → create order → liên kết record context/image → response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsProcessCreateQuarantineOrder::Construct()`.
8. **Lưu ý/rủi ro thường gặp:** Key của table/block trong data context phải khớp; xác minh attachment requirement.

### `MwmsProcessCreateTagCountingJournalLine`
1. **Tên class:** `MwmsProcessCreateTagCountingJournalLine`
2. **Mục đích/chức năng chính:** Tạo tag-count line, mặc định Add; dùng nhánh item/LP.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `Construct()`, `new()`, `createBlocksSetup()` — cấu hình hai line blocks theo license-plating setup.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMProcess`; gọi shared helper trong `MwmsProcessCreateTransferJournalLine`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item hoặc LP scan → phân nhánh theo setup → tạo tag-count line/response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsProcessCreateTagCountingJournalLine::Construct()`.
8. **Lưu ý/rủi ro thường gặp:** Sai Add/Update hoặc trạng thái license plating có thể chọn nhầm nhánh.

### `MwmsProcessCreateTransferJournalLine`
1. **Tên class:** `MwmsProcessCreateTransferJournalLine`
2. **Mục đích/chức năng chính:** Tạo transfer line và phân loại item/LP input.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `Construct()`, `new()`, `addBlocksForHandlingLicenseAndItems()` — ráp classify/condition/item/LP blocks.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMProcess`; dùng transfer line blocks và Tasklet operators/add-ons.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Scan/request → classify input → rẽ nhánh item hay LP → tạo transfer line.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsProcessCreateTransferJournalLine::Construct()`.
8. **Lưu ý/rủi ro thường gặp:** Input field names là protocol; kiểm tra nhánh empty/LP và dimension setup.

### `MwmsProcessFinishQuarantineOrders`
1. **Tên class:** `MwmsProcessFinishQuarantineOrders`
2. **Mục đích/chức năng chính:** Kết thúc quarantine order, sau đó move hàng nếu quantity dương.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `new()` — nối finish block, condition và move block; gắn cancel-similar add-on.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMProcess`; dùng finish/move blocks.
6. **Luồng sử dụng thực tế (input → xử lý → output):** ID/qty/scrap → finish order → nếu qty > 0 thì move về vị trí thực → response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Được framework dispatch theo quarantine process configuration.
8. **Lưu ý/rủi ro thường gặp:** Finish và move có nhiều side effect; xử lý retry/partial success cẩn thận.

### `MwmsProcessMoveInventory`
1. **Tên class:** `MwmsProcessMoveInventory`
2. **Mục đích/chức năng chính:** Process move theo item hoặc license plate.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `Construct()`, `new()` — lắp item-move và LP-move blocks qua shared helper.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMProcess`; dùng `MwmsLogicBlockMoveInvent`, `MwmsLogicBlockMoveLicensePlate`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Scan item/LP + destination → classify/branch → ghi movement.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsProcessMoveInventory::Construct()`.
8. **Lưu ý/rủi ro thường gặp:** Chọn đúng branch; validate destination theo WMS setup.

### `MwmsProcessNegativeAdjustment`
1. **Tên class:** `MwmsProcessNegativeAdjustment`
2. **Mục đích/chức năng chính:** Tạo negative adjustment qua journal-header → line → post.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `new()` — ghép ba block và negative-quantity add-on.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMProcess`; dùng profit/loss blocks và `MwmsLogicBlockPostInventoryJournal`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/qty/cause → tạo journal/line → post journal.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Framework dispatch; process gắn add-on cho line.
8. **Lưu ý/rủi ro thường gặp:** Posting final; quantity âm và cause phải đúng; tránh submit trùng.

### `MwmsProcessRegisterBarcode`
1. **Tên class:** `MwmsProcessRegisterBarcode`
2. **Mục đích/chức năng chính:** Process đăng ký barcode cho item, trước đó lấy item info.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `new()` — link item-info block sang register-barcode block.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMProcess`; dùng `TFMLogicBlockItemInfo` và `MwmsLogicBlockRegisterBarcode`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/barcode/dim → lấy item info → validate và ghi barcode.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Framework tạo process theo `RegisterBarcode`.
8. **Lưu ý/rủi ro thường gặp:** Không nhầm barcode lookup scan với tạo barcode record; kiểm tra duplicate.

### `MwmsProcessRegisterItemImage`
1. **Tên class:** `MwmsProcessRegisterItemImage`
2. **Mục đích/chức năng chính:** Process đăng ký ảnh item.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `new()` — add `MwmsLogicBlockRegisterItemImage`.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMProcess`; dùng register-item-image block.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/record + image → resolve target record → lưu ảnh.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Framework dispatcher khởi tạo theo cấu hình.
8. **Lưu ý/rủi ro thường gặp:** Cần xác minh target record và image payload; retry có thể ghi attachment trùng.

### `MwmsProcessTagCountingJournalLine`
1. **Tên class:** `MwmsProcessTagCountingJournalLine`
2. **Mục đích/chức năng chính:** Process tag counting hỗ trợ Add/Update, item và LP; mặc định Update.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `Construct()`, `getHeaders()`, `new()`, `createBlocksSetup()` — tạo branch/line blocks và error path.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMProcess`; dùng tag line blocks, IF/throw operators và disable-transfer add-on.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Identifier scan → nếu item thì item line; nếu bật LP thì LP line; không có identifier thì error.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsProcessTagCountingJournalLine::Construct()`.
8. **Lưu ý/rủi ro thường gặp:** Source có hard-coded error text; đảm bảo client gửi đúng identifier và setup license plating.

### `MwmsProcessTransferJournalLine`
1. **Tên class:** `MwmsProcessTransferJournalLine`
2. **Mục đích/chức năng chính:** Process transfer journal line; source comment có thể nhầm tag-counting.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `Construct()`, `getHeaders()`, `new()` — dùng shared classify helper với transfer blocks.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMProcess`; dùng `MwmsProcessTagCountingJournalLine::createBlocksSetup()` và transfer line blocks.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/LP request → shared conditional branch → tạo/update transfer line.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsProcessTransferJournalLine::Construct()`.
8. **Lưu ý/rủi ro thường gặp:** Tin method body/constructor hơn comment cũ; xác minh `_addOrUpdate` và identifier.

### `MwmsProcessUnplannedCount`
1. **Tên class:** `MwmsProcessUnplannedCount`
2. **Mục đích/chức năng chính:** Tạo unplanned counting journal theo chuỗi header → line → post.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `new()` — thêm ba blocks và nối theo thứ tự.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMProcess`; dùng counting header/line và post journal blocks.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Warehouse/item/count → tạo journal → tạo line → post → response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Framework dispatch process; không gọi từng `post()` thủ công.
8. **Lưu ý/rủi ro thường gặp:** Gửi đủ journal/header fields; posting có side effect không thể coi là retry an toàn.

### `MwmsProcessUnplannedMove`
1. **Tên class:** `MwmsProcessUnplannedMove`
2. **Mục đích/chức năng chính:** Di chuyển inventory không cần tạo transfer journal line flow riêng.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** —
4. **Method chính và khi nào dùng:** `Construct()`, `new()` — add `MwmsLogicBlockMoveInvent`.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMProcess`; dùng move-inventory block.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item/from-to/qty → move block → movement result.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `MwmsProcessUnplannedMove::Construct()`.
8. **Lưu ý/rủi ro thường gặp:** Kiểm tra source/destination và dimension setup như mọi movement.

### `MwmsRequestCartContentElement`
1. **Tên class:** `MwmsRequestCartContentElement`.
2. **Mục đích/chức năng chính:** Marker request class cho nội dung cart; source comment mô tả dùng cho cart.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance riêng.
4. **Method chính và khi nào dùng:** Không có method riêng; dùng kiểu request của framework.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không khai báo base class; được framework dùng trong cart flow.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Cart payload → typed request → handler đọc nội dung cart.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Dùng class name khi framework cần typed request; không tự tạo state.
8. **Lưu ý/rủi ro thường gặp:** Declaration có comment base cũ đã comment lại; không suy ra behavior kế thừa.

### `MwmsRequestItemAndDimensionsElement`
1. **Tên class:** `MwmsRequestItemAndDimensionsElement`.
2. **Mục đích/chức năng chính:** Request class chung cho request có item và dimension fields.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance riêng; dữ liệu lấy qua request/base framework.
4. **Method chính và khi nào dùng:** Không có method riêng; dùng typed request conversion trong block.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không khai báo base class; được nhiều journal/move blocks dùng.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Request → `convertToOtherRequestType(classStr(...))` → đọc ItemId/InventDim/quantity.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `request.convertToOtherRequestType(classStr(MwmsRequestItemAndDimensionsElement))`.
8. **Lưu ý/rủi ro thường gặp:** Typed conversion không tự validate field; kiểm tra field bắt buộc trong collector/block.

### `TFMExpressionsDefaultIssueLocation`
1. **Tên class:** `TFMExpressionsDefaultIssueLocation`.
2. **Mục đích/chức năng chính:** Expression lấy default issue location theo item và warehouse.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance riêng.
4. **Method chính và khi nào dùng:** `processExpressionValue()` — tra fixed warehouse issue location; `processExpressionCommon()` đã obsolete.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMExpressions`; dùng `InventItemLocation` và `InventDim`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item + warehouse → lookup fixed warehouse → `WMSLocationIdDefaultIssue` hoặc rỗng.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Cấu hình expression framework với item/warehouse parameters.
8. **Lưu ý/rủi ro thường gặp:** Không gọi `[SysObsolete] processExpressionCommon()`; giá trị rỗng có thể do chưa cấu hình.

### `TFMExpressionsDefaultPickingLocation`
1. **Tên class:** `TFMExpressionsDefaultPickingLocation`.
2. **Mục đích/chức năng chính:** Expression lấy default picking location theo item và warehouse.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance riêng.
4. **Method chính và khi nào dùng:** `processExpressionValue()` — tra `wMSPickingLocation`; `processExpressionCommon()` đã obsolete.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa `TFMExpressions`; dùng `InventItemLocation` và `InventDim`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item + warehouse → lookup fixed warehouse → picking location hoặc rỗng.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Được expression framework gọi với item/warehouse parameters.
8. **Lưu ý/rủi ro thường gặp:** Không gọi `[SysObsolete] processExpressionCommon()`; phân biệt picking location với issue location.

### `TFMInventDimensionSetupContract_Extension`
1. **Tên class:** `TFMInventDimensionSetupContract_Extension`.
2. **Mục đích/chức năng chính:** Bổ sung flag serialize cho việc yêu cầu batch expiration date.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `expDateActive`: cho biết có cần thu thập expiration date.
4. **Method chính và khi nào dùng:** `parmExpDateActive()` — đọc/ghi extension contract field.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** CoC extension của `TFMInventDimensionSetupContract`; DataMember `ExpDateActive`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Dimension setup → contract extension → client biết có cần nhập expiry date.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Framework serialize contract; không khởi tạo extension riêng.
8. **Lưu ý/rủi ro thường gặp:** Field là client/server contract; giữ ổn định tên DataMember và serialization.

### `TFMLogicContextDimensionSetup_Extension`
1. **Tên class:** `TFMLogicContextDimensionSetup_Extension`.
2. **Mục đích/chức năng chính:** Điều chỉnh active dimension fields theo item/warehouse setup và bật batch expiry khi cần.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance riêng.
4. **Method chính và khi nào dùng:** CoC `process()` — gọi `next`, cập nhật WMS location/LP active state và expiration flag.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Extension của `TFMLogicContextDimensionSetup`; dùng `TFMInventDimSetup`, InventTable/Batch.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Item + field/context → resolve dimension setup/batch expiry → trả contract dimension setup.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Được gọi tự động qua CoC khi framework gọi `process()`.
8. **Lưu ý/rủi ro thường gặp:** Phụ thuộc call chain; kiểm tra các tổ hợp batch, LP và WMS location.

### `TFMUnitOfMeasureContextContract`
1. **Tên class:** `TFMUnitOfMeasureContextContract`.
2. **Mục đích/chức năng chính:** Data contract cho danh sách UOM và unit mặc định.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `listOfUnitOfMeasure`: danh sách unit; `unitId`: default unit.
4. **Method chính và khi nào dùng:** `parmListOfUnitOfMeasure()`, `parmDefaultUnitId()` — serialize/deserialize contract values.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** `[DataContract]`; dùng bởi `MwmsLogicContextUnitOfMeasure`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** UOM context → contract fields → client nhận danh sách/default unit.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `c.parmListOfUnitOfMeasure(list); c.parmDefaultUnitId(unitId);`.
8. **Lưu ý/rủi ro thường gặp:** Giữ tên DataMember `ListOfUnitsOfMeasure` và `DefaultUnitID` để tránh phá payload.

## Quick Start — thứ tự tìm hiểu và dùng

- **1. Chọn entry process** theo nghiệp vụ: ví dụ `MwmsProcessMoveInventory`, `MwmsProcessUnplannedCount`, `MwmsProcessNegativeAdjustment` hoặc `MwmsProcessCreateQuarantineOrder`. Dispatcher/configuration Tasklet quyết định khi nào process chạy.
- **2. Đọc `new()` của process** để thấy block graph, nhánh item-vs-LP, add-on và thứ tự thực thi. Không bắt đầu từ block `post()` riêng lẻ.
- **3. Theo dõi input contract/collectors:** `headerFieldsNeeded()` → `registrationCollectors()`/components → typed request như `MwmsRequestItemAndDimensionsElement`.
- **4. Theo dõi persistence:** `preparePost()` resolve buffer/dimension; `post()` ghi line/order hoặc gọi posting API. Xác định transaction, response và trạng thái trước khi thêm retry.
- **5. Mở rộng đúng hook:** add-on để đổi collector/request, CoC cho dimension setup, contract cho dữ liệu serialize; không gọi extension thủ công.
- **6. Ví dụ contract UOM:** `TFMUnitOfMeasureContextContract c = new TFMUnitOfMeasureContextContract(); c.parmListOfUnitOfMeasure(list); c.parmDefaultUnitId(unitId);` (đối số phụ thuộc caller). Ví dụ process factory: `MwmsProcessMoveInventory::Construct();` — việc execute thuộc Tasklet dispatcher, không gọi `post()` trực tiếp.
- **7. Trước khi thay đổi:** kiểm tra item/warehouse/dimensions, license plating, Add/Update, duplicate request, journal state và test cả nhánh item/LP cùng batch/serial nếu áp dụng.
