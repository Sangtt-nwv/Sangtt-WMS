# TFMobile — phân tích class

**Phạm vi:** 194 class trong `Metadata/TFMobile/TF Mobile/AxClass` (model display name: `TF Mobile`), lấy bằng `d365fo index extract` và `d365fo read class`. Có 1.335 method trực tiếp theo index. Chỉ xét class thuộc model này; base class bên ngoài model không được mở rộng phân tích.

**Giả định/giới hạn:** mục đích ưu tiên XML summary; nếu thiếu sẽ ghi là suy luận từ tên, kiểu và method. Ý nghĩa field được suy ra từ identifier/type, không phải business definition đã xác nhận. XML summary được giữ nguyên tiếng Anh; một số comment có thể cũ/copy sai (các trường hợp nhận diện được được đánh dấu). References là tham chiếu dạng chữ trong source, không tự khẳng định composition/runtime call. Chỉ liệt kê method đại diện; ví dụ dùng placeholder `<...>` và không đảm bảo compile-ready. Rủi ro/luồng suy luận được đánh dấu rõ.

## Quick Start

- **Entry/application:** `MobRequestApplication` chỉ kế thừa `TFMRequestApplication` và không khai báo method riêng; dispatch/request contract nằm ở base/framework ngoài phạm vi model. Không giả định đây là class cần `new` thủ công.
- **Danh sách page:** gọi `MobPagesProvider::getAllPages(languageId)` khi cần lấy page config; `instance()` trả provider theo method signature đã xác minh.
- **Chọn order handler:** dùng `MobOrder::constructFromBackendID(backendId)` hoặc `MobOrder::constructFromTableName(tableName, orderType)` để lấy `MobOrder` phù hợp; tiếp tục với methods của subtype như header/line/scanned-value theo loại tác vụ.
- **XML/contract:** các `MobXMLFormatOrders_*`, `MobXMLFormatOrderLines_*` và `Mob*Contract` đại diện những serializer/contract theo tên và signatures; dùng qua pipeline hiện có, giữ đúng schema/version của client.
- **Posting:** theo document/order-specific flow; `MobPostHelper` cung cấp thao tác journal/inventory nhưng không nên gọi thay cho business validation/reservation/posting orchestration. Rà soát transaction, warehouse dimensions và retry/idempotency.
- **Extension/event handler:** các class `_Extension`, handler attributes hoặc `*_Mob_Class_Extension` được runtime gọi; không khởi tạo trực tiếp. Kiểm tra target hook, thứ tự thực thi và `next` trong source.

## Danh mục class

### `InventLocation_FormMob_Extension`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `InventLocation_FormMob_Extension` |
| 2 | Mục đích | XML summary gốc (English): Extension class to capture when the user checks whsEnabled checkbox, to delete a record in the MobInventLocationsPickReceiveTypes table |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `InventLocation_WHSEnabled_OnModified` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Target theo attribute: `ExtensionOf: InventLocation` |
| 6 | Luồng thực tế | Input: event/CoC/platform call → xử lý: hook/handler trong class → output: thay đổi state/side effect của platform; chi tiết theo method body/attribute. |
| 7 | Ví dụ | Framework/event dispatch gọi class; không khởi tạo trực tiếp. |
| 8 | Lưu ý/rủi ro | Runtime hook: không instantiate; xác nhận event/target, thứ tự, điều kiện gọi và base/next behavior. |

### `InventLocationWHSProcessEnablementService_Mob_Class_Extension`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `InventLocationWHSProcessEnablementService_Mob_Class_Extension` |
| 2 | Mục đích | XML summary gốc (English): Post event handler enableWarehouseProcesses in the InventLocationWHSProcessEnablementService class |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `InventLocationWHSProcessEnablementService_Post_enableWarehouseProcesses` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Target theo attribute: `ExtensionOf: InventLocationWHSProcessEnablementService` |
| 6 | Luồng thực tế | Input: event/CoC/platform call → xử lý: hook/handler trong class → output: thay đổi state/side effect của platform; chi tiết theo method body/attribute. |
| 7 | Ví dụ | Framework/event dispatch gọi class; không khởi tạo trực tiếp. |
| 8 | Lưu ý/rủi ro | Runtime hook: không instantiate; xác nhận event/target, thứ tự, điều kiện gọi và base/next behavior. |

### `InventQuarantineOrderMob_Extension`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `InventQuarantineOrderMob_Extension` |
| 2 | Mục đích | Suy luận: extension/event handler. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `insert` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Target theo attribute: `ExtensionOf: InventQuarantineOrder` |
| 6 | Luồng thực tế | Input: event/CoC/platform call → xử lý: hook/handler trong class → output: thay đổi state/side effect của platform; chi tiết theo method body/attribute. |
| 7 | Ví dụ | Framework/event dispatch gọi class; không khởi tạo trực tiếp. |
| 8 | Lưu ý/rủi ro | Runtime hook: không instantiate; xác nhận event/target, thứ tự, điều kiện gọi và base/next behavior. |

### `InventTransWMS_Pick_Mob`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `InventTransWMS_Pick_Mob` |
| 2 | Mục đích | XML summary gốc (English): Class extension of the foundation class InventTransWMS_Pick, in order to call a private method in the class. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `MobupdateInventServer` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Kế thừa `InventTransWMS_Pick` (ngoài model) |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `InventTransWMS_Pick_Mob::MobupdateInventServer(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `InventTransWMS_Register_Mob`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `InventTransWMS_Register_Mob` |
| 2 | Mục đích | XML summary gốc (English): Class extension of class InventTransWMS_Register, in order to call private methods within the class. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `MobUpdateInventOnServer` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Kế thừa `InventTransWMS_Register` (ngoài model) |
| 6 | Luồng thực tế | Input: tham số/state của `MobUpdateInventOnServer` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `InventTransWMS_Register_Mob::MobUpdateInventOnServer(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `Mob2DBarcodeGenerator`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `Mob2DBarcodeGenerator` |
| 2 | Mục đích | Suy luận: helper/provider/generator/constants. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `getQRCode` — đọc/tra cứu dữ liệu<br>`showLoginUserNameBarcode` — xem body/call site để xác định hành vi<br>`showEndPointBarcode` — xem body/call site để xác định hành vi<br>`getEndPointJson` — đọc/tra cứu dữ liệu<br>… 1 method khác |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: tham số/state của `getQRCode` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `Mob2DBarcodeGenerator::getQRCode(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobAIResultChoicesContract`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobAIResultChoicesContract` |
| 2 | Mục đích | Suy luận: contract/request/response trao đổi dữ liệu. |
| 3 | Fields quan trọng | `message` (`MobAIResultMessageContract`) — state `message`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `parmMessage` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Field type/composition candidate: `MobAIResultMessageContract`; Source references (không tự khẳng định runtime call): `MobAIResultMessageContract` |
| 6 | Luồng thực tế | Input: values từ caller/serializer → xử lý: contract fields và parm/DataMember → output: object serialize/deserialize; direction cụ thể phụ thuộc caller. |
| 7 | Ví dụ | `MobAIResultChoicesContract x = new MobAIResultChoicesContract(); x.parmMessage(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobAIResultContract`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobAIResultContract` |
| 2 | Mục đích | Suy luận: contract/request/response trao đổi dữ liệu. |
| 3 | Fields quan trọng | `choices` (`List`) — state `choices`; danh sách/collection (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `parmChoices` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Source references (không tự khẳng định runtime call): `MobAIResultChoicesContract` |
| 6 | Luồng thực tế | Input: values từ caller/serializer → xử lý: contract fields và parm/DataMember → output: object serialize/deserialize; direction cụ thể phụ thuộc caller. |
| 7 | Ví dụ | `MobAIResultContract x = new MobAIResultContract(); x.parmChoices(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobAIResultMessageContract`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobAIResultMessageContract` |
| 2 | Mục đích | Suy luận: contract/request/response trao đổi dữ liệu. |
| 3 | Fields quan trọng | `content` (`MobRegularExpression`) — state `content`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `parmContent` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: values từ caller/serializer → xử lý: contract fields và parm/DataMember → output: object serialize/deserialize; direction cụ thể phụ thuộc caller. |
| 7 | Ví dụ | `MobAIResultMessageContract x = new MobAIResultMessageContract(); x.parmContent(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobBarcodeHelper`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobBarcodeHelper` |
| 2 | Mục đích | Suy luận: helper/provider/generator/constants. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `getItemBarcode` — đọc/tra cứu dữ liệu<br>`getItemBarcodeQuantity` — đọc/tra cứu dữ liệu |
| 5 | Quan hệ | Source references (không tự khẳng định runtime call): `MobHelper` |
| 6 | Luồng thực tế | Input: tham số/state của `getItemBarcode` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobBarcodeHelper::getItemBarcode(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobBasket`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobBasket` |
| 2 | Mục đích | XML summary gốc (English): Common class for processes using the Basket/Cart approach |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `description` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model) |
| 6 | Luồng thực tế | Input: tham số/state của `description` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | Dùng concrete subtype; không khởi tạo abstract class trực tiếp. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobBatchOrderType`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobBatchOrderType` |
| 2 | Mục đích | Suy luận: xử lý loại order và dữ liệu mobile. |
| 3 | Fields quan trọng | `itemInventDim` (`InventDim`) — dimension tồn kho (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `OrderType` — xác định loại order<br>`processScannedValue` — xử lý giá trị scan<br>`generateXML` — tạo XML output |
| 5 | Quan hệ | Kế thừa `MobOrder`; implements `TFMOrderTypeInterface`; Source references (không tự khẳng định runtime call): `MobHelper`, `MobOrder` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | Dùng concrete subtype; không khởi tạo abstract class trực tiếp. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobBatchOrderTypeProcess`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobBatchOrderTypeProcess` |
| 2 | Mục đích | Suy luận: xử lý loại order và dữ liệu mobile. |
| 3 | Fields quan trọng | `prodTable` (`ProdTable`) — state `prodTable`; buffer lệnh sản xuất (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getBackendID` — đọc/tra cứu dữ liệu<br>`getBatchOrders` — đọc/tra cứu dữ liệu<br>`getHeaderRecords` — đọc/tạo dữ liệu header<br>`getLatestDeliveryDate` — đọc/tra cứu dữ liệu<br>… 9 method khác |
| 5 | Quan hệ | Kế thừa `MobBatchOrderType`; Source references (không tự khẳng định runtime call): `MobBatchOrderType`, `MobConstants`, `MobDocBatchOrder`, `MobHelper` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobBatchOrderTypeProcess x = new MobBatchOrderTypeProcess(); x.getBackendID(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobCartType`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobCartType` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `typeOfCart` — xác định loại giao dịch/cart<br>`handleScan` — xử lý giá trị scan<br>`postProcess` — thực hiện bước post; xác minh validation/transaction trong body<br>`scannedItemBackendOverride` — xem body/call site để xác định hành vi<br>… 8 method khác |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | Dùng concrete subtype; không khởi tạo abstract class trực tiếp. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobCartTypePicklist`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobCartTypePicklist` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | `rereserve` (`boolean`) — cờ reserve lại; giá trị cờ bật/tắt (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `typeOfCart` — xác định loại giao dịch/cart<br>`handleScan` — xử lý giá trị scan<br>`CartModePostOverride` — xem body/call site để xác định hành vi<br>`postAddOrMoveItemToOrFromCartPostProcess` — thực hiện bước post; xác minh validation/transaction trong body<br>… 13 method khác |
| 5 | Quan hệ | Kế thừa `MobCartType`; Source references (không tự khẳng định runtime call): `MobCartType`, `MobConstants`, `MobDocUnplannedCartMove`, `MobInventDimHelper`, `MobPickOrderTypePicklist` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobCartTypePicklist x = new MobCartTypePicklist(); x.typeOfCart(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobCartTypeProdPick`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobCartTypeProdPick` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | `rereserve` (`Map`) — cờ reserve lại; map key/value (suy luận từ tên/kiểu)<br>`rereservePBom` (`Map`) — cờ reserve lại; map key/value (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `typeOfCart` — xác định loại giao dịch/cart<br>`handleScan` — xử lý giá trị scan<br>`CartModePostOverride` — xem body/call site để xác định hành vi<br>`postAddOrMoveItemToOrFromCartPostProcess` — thực hiện bước post; xác minh validation/transaction trong body<br>… 6 method khác |
| 5 | Quan hệ | Kế thừa `MobCartType`; Source references (không tự khẳng định runtime call): `MobCartType`, `MobCartTypePicklist`, `MobConstants`, `MobDocUnplannedCartMove`, `MobInventDimHelper` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobCartTypeProdPick x = new MobCartTypeProdPick(); x.typeOfCart(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobConfluencePageBodyContract`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobConfluencePageBodyContract` |
| 2 | Mục đích | Suy luận: contract/request/response trao đổi dữ liệu. |
| 3 | Fields quan trọng | `viewContract` (`MobConfluencePageViewContract`) — state `viewContract`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `view` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Field type/composition candidate: `MobConfluencePageViewContract`; Source references (không tự khẳng định runtime call): `MobConfluencePageViewContract` |
| 6 | Luồng thực tế | Input: values từ caller/serializer → xử lý: contract fields và parm/DataMember → output: object serialize/deserialize; direction cụ thể phụ thuộc caller. |
| 7 | Ví dụ | `MobConfluencePageBodyContract x = new MobConfluencePageBodyContract(); x.view(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobConfluencePageContract`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobConfluencePageContract` |
| 2 | Mục đích | Suy luận: contract/request/response trao đổi dữ liệu. |
| 3 | Fields quan trọng | `id` (`str`) — mã/định danh; giá trị văn bản (suy luận từ tên/kiểu)<br>`bodyContract` (`MobConfluencePageBodyContract`) — state `bodyContract`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `new` — xem body/call site để xác định hành vi<br>`body` — xem body/call site để xác định hành vi<br>`id` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Field type/composition candidate: `MobConfluencePageBodyContract`; Source references (không tự khẳng định runtime call): `MobConfluencePageBodyContract` |
| 6 | Luồng thực tế | Input: values từ caller/serializer → xử lý: contract fields và parm/DataMember → output: object serialize/deserialize; direction cụ thể phụ thuộc caller. |
| 7 | Ví dụ | `MobConfluencePageContract x = new MobConfluencePageContract(); x.new(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobConfluencePageViewContract`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobConfluencePageViewContract` |
| 2 | Mục đích | Suy luận: contract/request/response trao đổi dữ liệu. |
| 3 | Fields quan trọng | `value` (`str`) — state `value`; giá trị văn bản (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `value` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: values từ caller/serializer → xử lý: contract fields và parm/DataMember → output: object serialize/deserialize; direction cụ thể phụ thuộc caller. |
| 7 | Ví dụ | `MobConfluencePageViewContract x = new MobConfluencePageViewContract(); x.value(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobConsolidateOrderCreate`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobConsolidateOrderCreate` |
| 2 | Mục đích | Suy luận: xử lý loại order và dữ liệu mobile. |
| 3 | Fields quan trọng | `queryRun` (`QueryRun`) — query; cursor/trạng thái thực thi query (suy luận từ tên/kiểu)<br>`dfType` (`DialogField`) — input dialog; điều khiển/input UI (suy luận từ tên/kiểu)<br>`dfName` (`DialogField`) — input dialog; điều khiển/input UI (suy luận từ tên/kiểu)<br>`dg` (`dialogGroup`) — state `dg`; nhóm điều khiển UI (suy luận từ tên/kiểu)<br>`dgp` (`dialogGroup`) — state `dgp`; nhóm điều khiển UI (suy luận từ tên/kiểu)<br>`useRouteId` (`WMSPickingRouteID`) — cờ/điều kiện `useRouteId`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`dialogPrinterName` (`DialogField`) — input dialog; điều khiển/input UI (suy luận từ tên/kiểu)<br>`dialogPrintMedium` (`DialogField`) — input dialog; điều khiển/input UI (suy luận từ tên/kiểu)<br>`dialogGroupPrinterSetting` (`DialogGroup`) — input dialog; nhóm điều khiển UI (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `showQueryValues` — xem body/call site để xác định hành vi<br>`showQuerySelectButton` — xem body/call site để xác định hành vi<br>`lastValueElementName` — xem body/call site để xác định hành vi<br>`initParmDefault` — xem body/call site để xác định hành vi<br>… 6 method khác |
| 5 | Quan hệ | Kế thừa `RunBase` (ngoài model) |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobConsolidateOrderCreate x = new MobConsolidateOrderCreate(); x.showQueryValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobConstants`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobConstants` |
| 2 | Mục đích | XML summary gốc (English): Class for constants. Replacement for the macro. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `GetReceiveOrders` — đọc/tra cứu dữ liệu<br>`GetRegistrationConfiguration` — đọc/tra cứu dữ liệu<br>`MobRequestApplicationConfiguration` — xem body/call site để xác định hành vi<br>`MobRequestConfiguration` — xem body/call site để xác định hành vi<br>… 278 method khác |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: tham số/state của `GetReceiveOrders` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobConstants::GetReceiveOrders(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobCountOrderType`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobCountOrderType` |
| 2 | Mục đích | XML summary có dấu hiệu sai/copy: nêu `MobOrder`, không phải class hiện tại; mục đích chưa xác minh, suy luận từ tên/base/methods. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `OrderType` — xác định loại order<br>`generateResponse` — tạo response mobile |
| 5 | Quan hệ | Kế thừa `MobOrder`; implements `TFMOrderTypeInterface`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobOrder` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | Dùng concrete subtype; không khởi tạo abstract class trực tiếp. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobCountOrderTypeCount`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobCountOrderTypeCount` |
| 2 | Mục đích | XML summary gốc (English): The MobCountOrderTypeCount class is the class handling the count orders. |
| 3 | Fields quan trọng | `InventJournalTable` (`InventJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getInventJournalTable` — đọc/tra cứu dữ liệu<br>`getHeaderRecords` — đọc/tạo dữ liệu header<br>`getJournalId` — đọc/tra cứu dữ liệu<br>`getLineRecords` — đọc/tạo dữ liệu line<br>… 3 method khác |
| 5 | Quan hệ | Kế thừa `MobCountOrderType`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobCountOrderType`, `MobHelper` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobCountOrderTypeCount x = new MobCountOrderTypeCount(); x.getInventJournalTable(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobCountOrderTypeTagCount`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobCountOrderTypeTagCount` |
| 2 | Mục đích | XML summary gốc (English): The MobCountOrderTypeTagCount class is the class handling the Tag count orders. |
| 3 | Fields quan trọng | `InventJournalTable` (`InventJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getInventJournalTable` — đọc/tra cứu dữ liệu<br>`getHeaderRecords` — đọc/tạo dữ liệu header<br>`getLineRecords` — đọc/tạo dữ liệu line<br>`lineTableId` — xem body/call site để xác định hành vi<br>… 2 method khác |
| 5 | Quan hệ | Kế thừa `MobCountOrderType`; Source references (không tự khẳng định runtime call): `MobCountOrderType`, `MobHelper` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobCountOrderTypeTagCount x = new MobCountOrderTypeTagCount(); x.getInventJournalTable(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobDataMigratorPlatformModelSetup`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDataMigratorPlatformModelSetup` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | `fields` (`Map`) — state `fields`; map key/value (suy luận từ tên/kiểu)<br>`dlg` (`DialogGroup`) — state `dlg`; nhóm điều khiển UI (suy luận từ tên/kiểu)<br>`fbc` (`FormBuildButtonControl`) — state `fbc`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`qty` (`int`) — state `qty`; giá trị số nguyên (suy luận từ tên/kiểu)<br>`checkmarkFields` (`Map`) — state `checkmarkFields`; map key/value (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `selectAllButton` — xem body/call site để xác định hành vi<br>`dialog` — xem body/call site để xác định hành vi<br>`reloadDialog` — xem body/call site để xác định hành vi<br>`convertToTFMModel` — xem body/call site để xác định hành vi<br>… 19 method khác |
| 5 | Quan hệ | Kế thừa `RunBase` (ngoài model); Source references (không tự khẳng định runtime call): `Mob2DBarcodeGenerator`, `MobConstants`, `MobDocAttachments`, `MobDocGetItemImages`, `MobDocRegisterBarcode` |
| 6 | Luồng thực tế | Input: tham số/state của `selectAllButton` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDataMigratorPlatformModelSetup x = new MobDataMigratorPlatformModelSetup(); x.selectAllButton(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát state/step, caller context, quyền và đồng bộ contract với mobile client. |

### `MobDataSourceBlockLockOrderList_extension`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDataSourceBlockLockOrderList_extension` |
| 2 | Mục đích | Suy luận: xử lý loại order và dữ liệu mobile. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `Addfields` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Source references (không tự khẳng định runtime call): `MobOrder`; Target theo attribute: `ExtensionOf: TFMDataSourceBlockLockOrderList` |
| 6 | Luồng thực tế | Input: event/CoC/platform call → xử lý: hook/handler trong class → output: thay đổi state/side effect của platform; chi tiết theo method body/attribute. |
| 7 | Ví dụ | Framework/event dispatch gọi class; không khởi tạo trực tiếp. |
| 8 | Lưu ý/rủi ro | Runtime hook: không instantiate; xác nhận event/target, thứ tự, điều kiện gọi và base/next behavior. |

### `MobDocAddCountLine`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocAddCountLine` |
| 2 | Mục đích | XML summary gốc (English): Document Handler class for adding count lines to count journals. |
| 3 | Fields quan trọng | `inventDim` (`InventDim`) — dimension tồn kho (suy luận từ tên/kiểu)<br>`inventTable` (`InventTable`) — state `inventTable`; buffer bản ghi bảng (suy luận từ tên/kiểu)<br>`inventJournalTable` (`inventJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu)<br>`inventJournalTrans` (`InventJournalTrans`) — journal; buffer transaction (suy luận từ tên/kiểu)<br>`mobInventDimSetup` (`TFMInventDimSetup`) — dimension tồn kho; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getInventJournalTrans` — đọc/tra cứu dữ liệu<br>`getinventJournalTable` — đọc/tra cứu dữ liệu<br>`description` — xem body/call site để xác định hành vi<br>`pages` — xem body/call site để xác định hành vi<br>… 4 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobInventDimHelper`, `MobPageHelper` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobDocAddCountLine x = new MobDocAddCountLine(); x.getInventJournalTrans(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobDocAddPickLine`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocAddPickLine` |
| 2 | Mục đích | XML summary gốc (English): Document Handler class for adding count lines to count journals. |
| 3 | Fields quan trọng | `inventDim` (`InventDim`) — dimension tồn kho (suy luận từ tên/kiểu)<br>`inventTable` (`InventTable`) — state `inventTable`; buffer bản ghi bảng (suy luận từ tên/kiểu)<br>`prodJournalTable` (`ProdJournalTable`) — journal; buffer bản ghi bảng (suy luận từ tên/kiểu)<br>`prodJournalBOM` (`ProdJournalBOM`) — journal; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`mobInventDimSetup` (`TFMInventDimSetup`) — dimension tồn kho; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getProdJournalBOM` — đọc/tra cứu dữ liệu<br>`getprodJournalTable` — đọc/tra cứu dữ liệu<br>`description` — xem body/call site để xác định hành vi<br>`pages` — xem body/call site để xác định hành vi<br>… 5 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobInventDimHelper`, `MobPageHelper` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobDocAddPickLine x = new MobDocAddPickLine(); x.getProdJournalBOM(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobDocAttachments`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocAttachments` |
| 2 | Mục đích | XML summary có dấu hiệu sai/copy: nêu `MobDocQuarantineOrder`, không phải class hiện tại; mục đích chưa xác minh, suy luận từ tên/base/methods. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | Không khai báo method trực tiếp; dùng method kế thừa/runtime framework. |
| 5 | Quan hệ | Kế thừa `TFMDocAttachments` (ngoài model); Source references (không tự khẳng định runtime call): `MobDocQuarantineOrder` |
| 6 | Luồng thực tế | Class không có method trực tiếp: input → xử lý → output do base/runtime framework quyết định; cần xem base/caller. |
| 7 | Ví dụ | Gọi qua base/framework/provider hiện hữu; không có method trực tiếp để minh họa. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocBatchOrder`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocBatchOrder` |
| 2 | Mục đích | Suy luận: xử lý loại order và dữ liệu mobile. |
| 3 | Fields quan trọng | `returningXML` (`XML`) — state `returningXML`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`content` (`MobDocumentContentSubject`) — state `content`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `addTranslations` — ghi/cập nhật state hoặc dữ liệu<br>`BatchOrdersFilter` — xem body/call site để xác định hành vi<br>`description` — xem body/call site để xác định hành vi<br>`pages` — xem body/call site để xác định hành vi<br>… 7 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobBatchOrderType`, `MobConstants`, `MobOrder`, `MobXMLFormatOrderLines_BatchOrder` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobDocBatchOrder x = new MobDocBatchOrder(); x.addTranslations(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobDocCancelPickLine`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocCancelPickLine` |
| 2 | Mục đích | XML summary gốc (English): Document Handler class for cancelling pick lines. |
| 3 | Fields quan trọng | `wmsOrderTrans` (`WMSOrderTrans`) — dữ liệu đơn hàng; buffer transaction (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `description` — xem body/call site để xác định hành vi<br>`getwmsOrderTrans` — đọc/tra cứu dữ liệu<br>`pages` — xem body/call site để xác định hành vi<br>`postCancelPickLine` — thực hiện bước post; xác minh validation/transaction trong body<br>… 2 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobimageHandlerCombinedImages` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobDocCancelPickLine x = new MobDocCancelPickLine(); x.description(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobDocCountOrder`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocCountOrder` |
| 2 | Mục đích | XML summary gốc (English): The document handler for all count orders, both header, lines and posting. |
| 3 | Fields quan trọng | `returningXML` (`XML`) — state `returningXML`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`content` (`MobDocumentContentSubject`) — state `content`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`qtyByScan` (`NoYes`) — state `qtyByScan`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`QtyBarcode` (`NoYes`) — state `QtyBarcode`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`common` (`Common`) — state `common`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getCommonTable` — đọc/tra cứu dữ liệu<br>`pages` — xem body/call site để xác định hành vi<br>`CountOrderFilters` — xem body/call site để xác định hành vi<br>`getDocumentContentSubject` — đọc/tra cứu dữ liệu<br>… 10 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobCountOrderType`, `MobDocumentNodes`, `MobHelper`, `MobOrder` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobDocCountOrder x = new MobDocCountOrder(); x.getCommonTable(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobDocGetItemImages`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocGetItemImages` |
| 2 | Mục đích | XML summary gốc (English): Document handler for the Item Image Collector. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | Không khai báo method trực tiếp; dùng method kế thừa/runtime framework. |
| 5 | Quan hệ | Kế thừa `TFMDocGetItemImages` (ngoài model) |
| 6 | Luồng thực tế | Class không có method trực tiếp: input → xử lý → output do base/runtime framework quyết định; cần xem base/caller. |
| 7 | Ví dụ | Gọi qua base/framework/provider hiện hữu; không có method trực tiếp để minh họa. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocLicensePlateMultiMove`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocLicensePlateMultiMove` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `description` — xem body/call site để xác định hành vi<br>`registerMenu` — xem body/call site để xác định hành vi<br>`MoveMultipleLicensePlatesFilter` — xem body/call site để xác định hành vi<br>`addTranslations` — ghi/cập nhật state hoặc dữ liệu<br>… 2 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobOnlineValidator`, `MobPostHelper` |
| 6 | Luồng thực tế | Input: tham số/state của `description` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocLicensePlateMultiMove x = new MobDocLicensePlateMultiMove(); x.description(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobDocLicensePlateMultiMoveAction`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocLicensePlateMultiMoveAction` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `description` — xem body/call site để xác định hành vi<br>`pages` — xem body/call site để xác định hành vi<br>`MoveMultipleLicensePlatesActionFilter` — xem body/call site để xác định hành vi<br>`MoveMultipleLicensePlatesPrompt` — xem body/call site để xác định hành vi<br>… 1 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobPostHelper` |
| 6 | Luồng thực tế | Input: tham số/state của `description` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocLicensePlateMultiMoveAction x = new MobDocLicensePlateMultiMoveAction(); x.description(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobDocLicensePlateOverview`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocLicensePlateOverview` |
| 2 | Mục đích | XML summary gốc (English): Document handler for the License Plate overview page |
| 3 | Fields quan trọng | `enableLicensePlating` (`NoYes`) — state `enableLicensePlating`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `description` — xem body/call site để xác định hành vi<br>`addTranslations` — ghi/cập nhật state hoặc dữ liệu<br>`pages` — xem body/call site để xác định hành vi<br>`registerImage` — xem body/call site để xác định hành vi<br>… 5 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobPageHelper` |
| 6 | Luồng thực tế | Input: tham số/state của `description` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocLicensePlateOverview x = new MobDocLicensePlateOverview(); x.description(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobDocLocateItem`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocLocateItem` |
| 2 | Mục đích | XML summary gốc (English): The Document handler class for the Locate Item page. |
| 3 | Fields quan trọng | `fieldNameToOmit` (`FieldName`) — state `fieldNameToOmit`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`enableOmitField` (`NoYes`) — state `enableOmitField`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `description` — xem body/call site để xác định hành vi<br>`pages` — xem body/call site để xác định hành vi<br>`lookupLocateItem` — đọc/tra cứu dữ liệu<br>`LocateItemCfgHeader` — xem body/call site để xác định hành vi<br>… 2 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobInventOnhand_availAndPhysical` |
| 6 | Luồng thực tế | Input: tham số/state của `description` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocLocateItem x = new MobDocLocateItem(); x.description(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocLocationContent`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocLocationContent` |
| 2 | Mục đích | XML summary gốc (English): Document handler class for the Location Content page. |
| 3 | Fields quan trọng | `fieldNameToOmit` (`FieldName`) — state `fieldNameToOmit`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`enableOmitField` (`NoYes`) — state `enableOmitField`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `description` — xem body/call site để xác định hành vi<br>`LocationContentCfgHeader` — xem body/call site để xác định hành vi<br>`pages` — xem body/call site để xác định hành vi<br>`lookupLocationContent` — đọc/tra cứu dữ liệu<br>… 4 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobInventOnhand_availAndPhysical` |
| 6 | Luồng thực tế | Input: tham số/state của `description` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocLocationContent x = new MobDocLocationContent(); x.description(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocMovementJournal`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocMovementJournal` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | `inventJournalTrans` (`inventJournalTrans`) — journal; buffer transaction (suy luận từ tên/kiểu)<br>`inventJournalTable` (`inventJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu)<br>`inventDim` (`inventDim`) — dimension tồn kho (suy luận từ tên/kiểu)<br>`inventTable` (`inventTable`) — state `inventTable`; buffer bản ghi bảng (suy luận từ tên/kiểu)<br>`mobInventDimSetup` (`TFMInventDimSetup`) — dimension tồn kho; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`docRequest` (`TFMRequestItemAndDimensionElement`) — yêu cầu; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `addTranslations` — ghi/cập nhật state hoặc dữ liệu<br>`description` — xem body/call site để xác định hành vi<br>`pages` — xem body/call site để xác định hành vi<br>`CreateMovementJournalHeader` — tạo/định dạng output<br>… 11 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobimageHandlerCombinedImages`, `MobInventDimHelper`, `MobInventJournalTableCommon` |
| 6 | Luồng thực tế | Input: tham số/state của `addTranslations` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocMovementJournal x = new MobDocMovementJournal(); x.addTranslations(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobDocNegativeAdjustment`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocNegativeAdjustment` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | `inventDim` (`InventDim`) — dimension tồn kho (suy luận từ tên/kiểu)<br>`inventTable` (`InventTable`) — state `inventTable`; buffer bản ghi bảng (suy luận từ tên/kiểu)<br>`inventJournalTable` (`InventJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu)<br>`inventJournalTrans` (`inventJournalTrans`) — journal; buffer transaction (suy luận từ tên/kiểu)<br>`mobInventDimSetup` (`TFMInventDimSetup`) — dimension tồn kho; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`negAdjRequest` (`TFMRequestItemAndDimensionElement`) — yêu cầu; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `description` — xem body/call site để xác định hành vi<br>`getinventJournalTable` — đọc/tra cứu dữ liệu<br>`getinventJournalTrans` — đọc/tra cứu dữ liệu<br>`createNegativeAdjustmentConfiguration` — tạo/định dạng output<br>… 5 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobInventDimHelper` |
| 6 | Luồng thực tế | Input: tham số/state của `description` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocNegativeAdjustment x = new MobDocNegativeAdjustment(); x.description(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocOfflineUploadAdhocRegistrations`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocOfflineUploadAdhocRegistrations` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `getDocumentTypes` — đọc/tra cứu dữ liệu<br>`description` — xem body/call site để xác định hành vi<br>`pages` — xem body/call site để xác định hành vi<br>`UploadAdhocRegistrations` — xem body/call site để xác định hành vi<br>… 2 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocumentConnector` |
| 6 | Luồng thực tế | Input: tham số/state của `getDocumentTypes` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocOfflineUploadAdhocRegistrations x = new MobDocOfflineUploadAdhocRegistrations(); x.getDocumentTypes(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocPackingItems`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocPackingItems` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | `returningXML` (`XML`) — state `returningXML`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`content` (`MobDocumentContentSubject`) — state `content`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`restoteTable` (`MobToteTable`) — state `restoteTable`; buffer bản ghi bảng (suy luận từ tên/kiểu)<br>`toteId` (`MobToteId`) — mã/định danh; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`useGrossWeight` (`NoYes`) — cờ/điều kiện `useGrossWeight`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`regs` (`MobToteContent`) — state `regs`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`orderTrans` (`WMSOrderTrans`) — dữ liệu đơn hàng; buffer transaction (suy luận từ tên/kiểu)<br>`boxesMapCache` (`Map`) — state `boxesMapCache`; map key/value (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `description` — xem body/call site để xác định hành vi<br>`pages` — xem body/call site để xác định hành vi<br>`addTranslations` — ghi/cập nhật state hoặc dữ liệu<br>`registerImage` — xem body/call site để xác định hành vi<br>… 20 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocPickOrder`, `MobHelper` |
| 6 | Luồng thực tế | Input: tham số/state của `description` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocPackingItems x = new MobDocPackingItems(); x.description(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocPallet`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocPallet` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | `inventJournalTable` (`inventJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `description` — xem body/call site để xác định hành vi<br>`addTranslations` — ghi/cập nhật state hoặc dữ liệu<br>`CreatePalletHeader` — tạo/định dạng output<br>`UnplannedPalletMoveHeader` — xem body/call site để xác định hành vi<br>… 2 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobPostHelper` |
| 6 | Luồng thực tế | Input: tham số/state của `description` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocPallet x = new MobDocPallet(); x.description(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocPickOrder`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocPickOrder` |
| 2 | Mục đích | XML summary gốc (English): The MobDocPickOrder class is the document handler for all pick orders that should be made available on the pick order page. |
| 3 | Fields quan trọng | `returningXML` (`XML`) — state `returningXML`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`content` (`MobDocumentContentSubject`) — state `content`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`pickListOperatorWorker` (`NoYes`) — state `pickListOperatorWorker`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`pickListAccumulate` (`NoYes`) — state `pickListAccumulate`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`salesAccumulate` (`NoYes`) — state `salesAccumulate`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`setCurrentDateWhenPostingFromDevice` (`NoYes`) — state `setCurrentDateWhenPostingFromDevice`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`prodAccumulate` (`NoYes`) — state `prodAccumulate`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`prodCreateNew` (`NoYes`) — state `prodCreateNew`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`prodOprSegregate` (`NoYes`) — state `prodOprSegregate`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`useTotePicking` (`NoYes`) — cờ/điều kiện `useTotePicking`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`FinishRoute` (`NoYes`) — route/đường xử lý; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`usePackingSlipForPickingList` (`NoYes`) — cờ/điều kiện `usePackingSlipForPickingList`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`toteGroupingField` (`str`) — state `toteGroupingField`; giá trị văn bản (suy luận từ tên/kiểu)<br>`defaultContainerType` (`WHSDefaultContainerTypeCode`) — state `defaultContainerType`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`common` (`Common`) — state `common`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `pages` — xem body/call site để xác định hành vi<br>`makeOrderList` — xem body/call site để xác định hành vi<br>`PickOrderFilters` — xem body/call site để xác định hành vi<br>`description` — xem body/call site để xác định hành vi<br>… 17 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobimageHandlerCombinedImages`, `MobOrder`, `MobPickOrderType` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobDocPickOrder x = new MobDocPickOrder(); x.pages(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobDocPlannedMove`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocPlannedMove` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | `returningXML` (`XML`) — state `returningXML`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`content` (`MobDocumentContentSubject`) — state `content`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`qtyByScan` (`NoYes`) — state `qtyByScan`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`QtyBarcode` (`NoYes`) — state `QtyBarcode`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`common` (`Common`) — state `common`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`InventJournalTable` (`InventJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getCommonTable` — đọc/tra cứu dữ liệu<br>`registerImage` — xem body/call site để xác định hành vi<br>`getDocumentContentSubject` — đọc/tra cứu dữ liệu<br>`pages` — xem body/call site để xác định hành vi<br>… 12 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobCountOrderType`, `MobDocReceiveOrder`, `MobDocumentNodes`, `MobHelper` |
| 6 | Luồng thực tế | Input: tham số/state của `getCommonTable` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocPlannedMove x = new MobDocPlannedMove(); x.getCommonTable(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocProdReportErrorQty`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocProdReportErrorQty` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `addTranslations` — ghi/cập nhật state hoặc dữ liệu<br>`createProdReportErrorsPrompt` — tạo/định dạng output<br>`pages` — xem body/call site để xác định hành vi<br>`description` — xem body/call site để xác định hành vi<br>… 2 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper` |
| 6 | Luồng thực tế | Input: tham số/state của `addTranslations` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocProdReportErrorQty x = new MobDocProdReportErrorQty(); x.addTranslations(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocProductionOrders`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocProductionOrders` |
| 2 | Mục đích | XML summary gốc (English): Document handler class for the Production Orders page. |
| 3 | Fields quan trọng | `prodJournalTable` (`ProdJournalTable`) — journal; buffer bản ghi bảng (suy luận từ tên/kiểu)<br>`prodTable` (`ProdTable`) — state `prodTable`; buffer lệnh sản xuất (suy luận từ tên/kiểu)<br>`prodRoute` (`ProdRoute`) — route/đường xử lý; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`promptForRAF` (`boolean`) — state `promptForRAF`; giá trị cờ bật/tắt (suy luận từ tên/kiểu)<br>`showInfo` (`NoYes`) — state `showInfo`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`askForLocation` (`NoYes`) — state `askForLocation`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getResultingProdJournalTable` — đọc/tra cứu dữ liệu<br>`getProdTable` — đọc/tra cứu dữ liệu<br>`pages` — xem body/call site để xác định hành vi<br>`description` — xem body/call site để xác định hành vi<br>… 13 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobPageHelper` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobDocProductionOrders x = new MobDocProductionOrders(); x.getResultingProdJournalTable(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocProfitLoss`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocProfitLoss` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | `inventJournalTrans` (`inventJournalTrans`) — journal; buffer transaction (suy luận từ tên/kiểu)<br>`inventJournalTable` (`inventJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu)<br>`inventDim` (`inventDim`) — dimension tồn kho (suy luận từ tên/kiểu)<br>`inventTable` (`inventTable`) — state `inventTable`; buffer bản ghi bảng (suy luận từ tên/kiểu)<br>`mobInventDimSetup` (`TFMInventDimSetup`) — dimension tồn kho; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`docRequest` (`TFMRequestItemAndDimensionElement`) — yêu cầu; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `description` — xem body/call site để xác định hành vi<br>`addTranslations` — ghi/cập nhật state hoặc dữ liệu<br>`pages` — xem body/call site để xác định hành vi<br>`getinventJournalTable` — đọc/tra cứu dữ liệu<br>… 13 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobInventDimHelper`, `MobInventJournalTableCommon` |
| 6 | Luồng thực tế | Input: tham số/state của `description` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocProfitLoss x = new MobDocProfitLoss(); x.description(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocQuarantineOrder`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocQuarantineOrder` |
| 2 | Mục đích | XML summary gốc (English): The MobDocQuarantineOrder class is the document handler for the quarantine order creation in Mobile Wms. |
| 3 | Fields quan trọng | `inventTable` (`InventTable`) — state `inventTable`; buffer bản ghi bảng (suy luận từ tên/kiểu)<br>`inventDim` (`InventDim`) — dimension tồn kho (suy luận từ tên/kiểu)<br>`qOrder` (`InventQuarantineOrder`) — dữ liệu đơn hàng; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`QuarantineRequest` (`TFMRequestQuarantineElement`) — yêu cầu; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`showInfo` (`boolean`) — state `showInfo`; giá trị cờ bật/tắt (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `pages` — xem body/call site để xác định hành vi<br>`getInventQuarantineOrder` — đọc/tra cứu dữ liệu<br>`preProcess` — xem body/call site để xác định hành vi<br>`tag2Dimension` — xem body/call site để xác định hành vi<br>… 12 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobInventDimHelper`, `MobPostHelper` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobDocQuarantineOrder x = new MobDocQuarantineOrder(); x.pages(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocReceiveOrder`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocReceiveOrder` |
| 2 | Mục đích | XML summary gốc (English): The Document handler for all receive orders on the receive page. |
| 3 | Fields quan trọng | `returningXML` (`XML`) — state `returningXML`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`content` (`MobDocumentContentSubject`) — state `content`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`suggestBatchNumber` (`NoYes`) — state `suggestBatchNumber`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`PromptPackingSlip` (`NoYes`) — packing slip/journal; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`packingSlipPrefix` (`str`) — packing slip/journal; giá trị văn bản (suy luận từ tên/kiểu)<br>`common` (`Common`) — state `common`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `pages` — xem body/call site để xác định hành vi<br>`makeOrderList` — xem body/call site để xác định hành vi<br>`ReceiveOrderFilters` — xem body/call site để xác định hành vi<br>`description` — xem body/call site để xác định hành vi<br>… 10 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobListOrderLinesReceive`, `MobOrder`, `MobReceiveOrderType` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobDocReceiveOrder x = new MobDocReceiveOrder(); x.pages(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobDocRegisterBarcode`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocRegisterBarcode` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | `inventDim` (`InventDim`) — dimension tồn kho (suy luận từ tên/kiểu)<br>`inventTable` (`InventTable`) — state `inventTable`; buffer bản ghi bảng (suy luận từ tên/kiểu)<br>`mobInventDimSetup` (`TFMInventDimSetup`) — dimension tồn kho; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`inventItemBarCode` (`InventItemBarcode`) — dữ liệu mặt hàng; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`barcodeRequest` (`TFMRequestItemAndDimensionElement`) — yêu cầu; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`promptForUnit` (`TFMPromptForUnit`) — state `promptForUnit`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`promptForBarcodeSetup` (`NoYes`) — state `promptForBarcodeSetup`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`DefaultBarcodeSetup` (`BarcodeSetupID`) — state `DefaultBarcodeSetup`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`promptForQuantity` (`NoYes`) — state `promptForQuantity`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`showInfo` (`NoYes`) — state `showInfo`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getInventTable` — đọc/tra cứu dữ liệu<br>`getInventItemBarcode` — đọc/tra cứu dữ liệu<br>`getInventDim` — đọc/tra cứu dữ liệu<br>`description` — xem body/call site để xác định hành vi<br>… 11 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model) |
| 6 | Luồng thực tế | Input: tham số/state của `getInventTable` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocRegisterBarcode x = new MobDocRegisterBarcode(); x.getInventTable(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocRegisterGenericImage`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocRegisterGenericImage` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | Không khai báo method trực tiếp; dùng method kế thừa/runtime framework. |
| 5 | Quan hệ | Kế thừa `TFMDocRegisterGenericImage` (ngoài model) |
| 6 | Luồng thực tế | Class không có method trực tiếp: input → xử lý → output do base/runtime framework quyết định; cần xem base/caller. |
| 7 | Ví dụ | Gọi qua base/framework/provider hiện hữu; không có method trực tiếp để minh họa. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocShipTotes`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocShipTotes` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | `returningXML` (`XML`) — state `returningXML`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`shipUnstaged` (`NoYes`) — state `shipUnstaged`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `description` — xem body/call site để xác định hành vi<br>`addTranslations` — ghi/cập nhật state hoặc dữ liệu<br>`registerImage` — xem body/call site để xác định hành vi<br>`pages` — xem body/call site để xác định hành vi<br>… 8 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper` |
| 6 | Luồng thực tế | Input: tham số/state của `description` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocShipTotes x = new MobDocShipTotes(); x.description(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocTagCounting`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocTagCounting` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | `inventDim` (`InventDim`) — dimension tồn kho (suy luận từ tên/kiểu)<br>`inventJournalTable` (`InventJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu)<br>`mobInventDimSetup` (`TFMInventDimSetup`) — dimension tồn kho; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`inventJournalTrans_Tag` (`InventJournalTrans_Tag`) — journal; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`docRequest` (`TFMRequestItemAndDimensionElement`) — yêu cầu; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `description` — xem body/call site để xác định hành vi<br>`pages` — xem body/call site để xác định hành vi<br>`getInventJournalTrans_Tag` — đọc/tra cứu dữ liệu<br>`getinventJournalTable` — đọc/tra cứu dữ liệu<br>… 13 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocTransferJournal`, `MobHelper`, `MobInventDimHelper`, `MobInventJournalTableCommon` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobDocTagCounting x = new MobDocTagCounting(); x.description(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobDocTransferJournal`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocTransferJournal` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | `inventJournalTrans` (`inventJournalTrans`) — journal; buffer transaction (suy luận từ tên/kiểu)<br>`inventJournalTable` (`inventJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu)<br>`inventDim` (`inventDim`) — dimension tồn kho (suy luận từ tên/kiểu)<br>`inventTable` (`inventTable`) — state `inventTable`; buffer bản ghi bảng (suy luận từ tên/kiểu)<br>`docRequest` (`TFMRequestItemAndDimensionElement`) — yêu cầu; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `addTranslations` — ghi/cập nhật state hoặc dữ liệu<br>`description` — xem body/call site để xác định hành vi<br>`pages` — xem body/call site để xác định hành vi<br>`createDeleteJournalLineConfiguration` — tạo/định dạng output<br>… 16 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocUnplannedMove`, `MobimageHandlerCombinedImages`, `MobInventJournalTableCommon`, `MobPostHelper` |
| 6 | Luồng thực tế | Input: tham số/state của `addTranslations` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocTransferJournal x = new MobDocTransferJournal(); x.addTranslations(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobDocumentConnector`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocumentConnector` |
| 2 | Mục đích | XML summary gốc (English): This class is the entry point for outside calls to the Mobile WMS business logic. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | Không khai báo method trực tiếp; dùng method kế thừa/runtime framework. |
| 5 | Quan hệ | Kế thừa `TFMDocumentConnector` (ngoài model) |
| 6 | Luồng thực tế | Class không có method trực tiếp: input → xử lý → output do base/runtime framework quyết định; cần xem base/caller. |
| 7 | Ví dụ | Gọi qua base/framework/provider hiện hữu; không có method trực tiếp để minh họa. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocumentNode`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocumentNode` |
| 2 | Mục đích | XML summary gốc (English): The MobDocumentNode is a class matching a XML tag in an xml document. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `new` — xem body/call site để xác định hành vi<br>`Construct` — tạo/định dạng output |
| 5 | Quan hệ | Kế thừa `TFMDocumentNode` (ngoài model); Source references (không tự khẳng định runtime call): `MobDocumentNodes` |
| 6 | Luồng thực tế | Input: tham số/state của `new` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocumentNode x = new MobDocumentNode(); x.new(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocumentNodes`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocumentNodes` |
| 2 | Mục đích | XML summary gốc (English): The MobDocumentNodes class contains a hierarchy of nodes, that can be exported to XML. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `Construct` — tạo/định dạng output<br>`new` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Kế thừa `TFMDocumentNodes` (ngoài model); Source references (không tự khẳng định runtime call): `MobDocumentNode` |
| 6 | Luồng thực tế | Input: tham số/state của `Construct` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocumentNodes::Construct(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobDocUnplannedCartMove`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocUnplannedCartMove` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | `reservationLevel` (`MobCartReservationLevelEnum`) — state `reservationLevel`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`inventJournalTable` (`inventJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu)<br>`lockCarts` (`NoYes`) — cart; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`allowOverDelivery` (`NoYes`) — state `allowOverDelivery`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`allowUnderDelivery` (`NoYes`) — state `allowUnderDelivery`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getinventJournalTable` — đọc/tra cứu dữ liệu<br>`addTranslations` — ghi/cập nhật state hoặc dữ liệu<br>`CartOverviewFilter` — xem body/call site để xác định hành vi<br>`CartContentFilter` — xem body/call site để xác định hành vi<br>… 25 method khác |
| 5 | Quan hệ | Kế thừa `MobBasket`; Source references (không tự khẳng định runtime call): `MobBasket`, `MobCartType`, `MobCartTypePicklist`, `MobConstants`, `MobHelper` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobDocUnplannedCartMove x = new MobDocUnplannedCartMove(); x.getinventJournalTable(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobDocUnplannedCount`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocUnplannedCount` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | `inventDim` (`InventDim`) — dimension tồn kho (suy luận từ tên/kiểu)<br>`inventTable` (`InventTable`) — state `inventTable`; buffer bản ghi bảng (suy luận từ tên/kiểu)<br>`inventJournalTable` (`inventJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu)<br>`inventJournalTrans` (`InventJournalTrans`) — journal; buffer transaction (suy luận từ tên/kiểu)<br>`mobInventDimSetup` (`TFMInventDimSetup`) — dimension tồn kho; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`dimLocked` (`boolean`) — state `dimLocked`; giá trị cờ bật/tắt (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getInventJournalTrans` — đọc/tra cứu dữ liệu<br>`getinventJournalTable` — đọc/tra cứu dữ liệu<br>`description` — xem body/call site để xác định hành vi<br>`UnplannedCountHeader` — xem body/call site để xác định hành vi<br>… 3 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobInventDimHelper`, `MobPostHelper` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobDocUnplannedCount x = new MobDocUnplannedCount(); x.getInventJournalTrans(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobDocUnplannedMove`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobDocUnplannedMove` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | `mobInventDimSetup` (`TFMInventDimSetup`) — dimension tồn kho; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`inventJournalTable` (`inventJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu)<br>`unplannedMoveRequest` (`TFMRequestItemAndDimensionElement`) — yêu cầu; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getinventJournalTable` — đọc/tra cứu dữ liệu<br>`UnplannedMoveHeader` — xem body/call site để xác định hành vi<br>`description` — xem body/call site để xác định hành vi<br>`preProcess` — xem body/call site để xác định hành vi<br>… 3 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobInventDimHelper`, `MobPostHelper` |
| 6 | Luồng thực tế | Input: tham số/state của `getinventJournalTable` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobDocUnplannedMove x = new MobDocUnplannedMove(); x.getinventJournalTable(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobExpressionsCurrentWorker`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobExpressionsCurrentWorker` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `processExpressionCommon` — xem body/call site để xác định hành vi<br>`processExpressionValue` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Kế thừa `TFMExpressions` (ngoài model) |
| 6 | Luồng thực tế | Input: tham số/state của `processExpressionCommon` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobExpressionsCurrentWorker x = new MobExpressionsCurrentWorker(); x.processExpressionCommon(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobExpressionsDefaultReceiptLocation`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobExpressionsDefaultReceiptLocation` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `processExpressionCommon` — xem body/call site để xác định hành vi<br>`processExpressionValue` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Kế thừa `TFMExpressions` (ngoài model) |
| 6 | Luồng thực tế | Input: tham số/state của `processExpressionCommon` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobExpressionsDefaultReceiptLocation x = new MobExpressionsDefaultReceiptLocation(); x.processExpressionCommon(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobExpressionsInventDimStr`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobExpressionsInventDimStr` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `processExpressionCommon` — xem body/call site để xác định hành vi<br>`processExpressionValue` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Kế thừa `TFMExpressions` (ngoài model) |
| 6 | Luồng thực tế | Input: tham số/state của `processExpressionCommon` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobExpressionsInventDimStr x = new MobExpressionsInventDimStr(); x.processExpressionCommon(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobExpressionsInventSumField`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobExpressionsInventSumField` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `processExpressionValue` — xem body/call site để xác định hành vi<br>`processExpressionCommon` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Kế thừa `TFMExpressions` (ngoài model) |
| 6 | Luồng thực tế | Input: tham số/state của `processExpressionValue` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobExpressionsInventSumField x = new MobExpressionsInventSumField(); x.processExpressionValue(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobExpressionsOnHandInventory`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobExpressionsOnHandInventory` |
| 2 | Mục đích | XML summary gốc (English): An expression used to retrieve the company image, that is used for reports. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `processExpressionCommon` — xem body/call site để xác định hành vi<br>`processExpressionValue` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Kế thừa `TFMExpressions` (ngoài model); Source references (không tự khẳng định runtime call): `MobHelper` |
| 6 | Luồng thực tế | Input: tham số/state của `processExpressionCommon` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobExpressionsOnHandInventory x = new MobExpressionsOnHandInventory(); x.processExpressionCommon(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobFormLookupHelper`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobFormLookupHelper` |
| 2 | Mục đích | XML summary gốc (English): Class containg Lookup helper methods. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `lookupClassesExtendingCertainClass` — đọc/tra cứu dữ liệu<br>`lookupClasses` — đọc/tra cứu dữ liệu<br>`lookupXMLFormatClassOrderTypes` — đọc/tra cứu dữ liệu<br>`lookupEDTNames` — đọc/tra cứu dữ liệu<br>… 30 method khác |
| 5 | Quan hệ | Source references (không tự khẳng định runtime call): `MobOrder` |
| 6 | Luồng thực tế | Input: tham số/state của `lookupClassesExtendingCertainClass` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobFormLookupHelper::lookupClassesExtendingCertainClass(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Rà soát state/step, caller context, quyền và đồng bộ contract với mobile client. |

### `MobFormXMLFormatter`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobFormXMLFormatter` |
| 2 | Mục đích | XML summary gốc (English): Converting xml string to a color formatted html representation. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `htmlColorXML` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobFormXMLFormatter::htmlColorXML(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobGetReferenceData_Extension`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobGetReferenceData_Extension` |
| 2 | Mục đích | Suy luận: extension/event handler. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `EncryptStringToBytes_Aes` — xem body/call site để xác định hành vi<br>`ReturnDisposition` — xem body/call site để xác định hành vi<br>`defaultItemIdOrLPCollector` — xem body/call site để xác định hành vi<br>`defaultJournalIdCollector` — xem body/call site để xác định hành vi<br>… 6 method khác |
| 5 | Quan hệ | Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocLicensePlateOverview`, `MobHelper`; Target theo attribute: `ExtensionOf: TFMGetReferenceData` |
| 6 | Luồng thực tế | Input: event/CoC/platform call → xử lý: hook/handler trong class → output: thay đổi state/side effect của platform; chi tiết theo method body/attribute. |
| 7 | Ví dụ | Framework/event dispatch gọi class; không khởi tạo trực tiếp. |
| 8 | Lưu ý/rủi ro | Runtime hook: không instantiate; xác nhận event/target, thứ tự, điều kiện gọi và base/next behavior. |

### `MobGraphicsHelper`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobGraphicsHelper` |
| 2 | Mục đích | Suy luận: helper/provider/generator/constants. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `color2hex` — xem body/call site để xác định hành vi<br>`scaleColor` — xem body/call site để xác định hành vi<br>`hex2color` — xem body/call site để xác định hành vi<br>`addBackgroundColor` — ghi/cập nhật state hoặc dữ liệu<br>… 22 method khác |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: tham số/state của `color2hex` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobGraphicsHelper::color2hex(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobGraphRectInteraction`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobGraphRectInteraction` |
| 2 | Mục đích | XML summary gốc (English): Class to represent rectangles in a bitmap, that should be interactive. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | Không khai báo method trực tiếp; dùng method kế thừa/runtime framework. |
| 5 | Quan hệ | Kế thừa `TFMGraphRectInteraction` (ngoài model) |
| 6 | Luồng thực tế | Class không có method trực tiếp: input → xử lý → output do base/runtime framework quyết định; cần xem base/caller. |
| 7 | Ví dụ | Gọi qua base/framework/provider hiện hữu; không có method trực tiếp để minh họa. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobGraphRectInteractionWorkflow`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobGraphRectInteractionWorkflow` |
| 2 | Mục đích | Suy luận: workflow mobile. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | Không khai báo method trực tiếp; dùng method kế thừa/runtime framework. |
| 5 | Quan hệ | Kế thừa `TFMGraphRectInteractionWorkflow` (ngoài model) |
| 6 | Luồng thực tế | Input: workflow configuration/state → xử lý: method workflow/step → output: definition/steps hoặc validation; suy luận nếu không có summary. |
| 7 | Ví dụ | Gọi qua base/framework/provider hiện hữu; không có method trực tiếp để minh họa. |
| 8 | Lưu ý/rủi ro | Rà soát state/step, caller context, quyền và đồng bộ contract với mobile client. |

### `MobHelper`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobHelper` |
| 2 | Mục đích | XML summary gốc (English): General helper class, with common functions used in the Mobile WMS module. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `attachBase64ToCommon` — xem body/call site để xác định hành vi<br>`matchRegex` — xem body/call site để xác định hành vi<br>`matchRegexSet` — xem body/call site để xác định hành vi<br>`getParametersFromClassAndMethod` — đọc/tra cứu dữ liệu<br>… 76 method khác |
| 5 | Quan hệ | Source references (không tự khẳng định runtime call): `MobConstants` |
| 6 | Luồng thực tế | Input: tham số/state của `attachBase64ToCommon` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobHelper::attachBase64ToCommon(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobHtmlHelper`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobHtmlHelper` |
| 2 | Mục đích | Suy luận: helper/provider/generator/constants. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `map2Html` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: tham số/state của `map2Html` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobHtmlHelper::map2Html(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobImageCombiner`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobImageCombiner` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `combineImages` — xem body/call site để xác định hành vi<br>`combineImage` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: tham số/state của `combineImages` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobImageCombiner::combineImages(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobimageHandlerCombinedImages`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobimageHandlerCombinedImages` |
| 2 | Mục đích | Suy luận: extension/event handler. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `process` — xem body/call site để xác định hành vi<br>`attachListToCart` — xem body/call site để xác định hành vi<br>`detachListFromCart` — xem body/call site để xác định hành vi<br>`movementJournalIcon` — xem body/call site để xác định hành vi<br>… 2 method khác |
| 5 | Quan hệ | Kế thừa `TFMImageHandler` (ngoài model) |
| 6 | Luồng thực tế | Input: tham số/state của `process` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobimageHandlerCombinedImages x = new MobimageHandlerCombinedImages(); x.process(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobImageHandlerOrderImages`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobImageHandlerOrderImages` |
| 2 | Mục đích | Suy luận: xử lý loại order và dữ liệu mobile. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `process` — xem body/call site để xác định hành vi<br>`recordMap2Image` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Kế thừa `TFMImageHandler` (ngoài model); Source references (không tự khẳng định runtime call): `MobOrder` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobImageHandlerOrderImages x = new MobImageHandlerOrderImages(); x.process(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobImageHelper`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobImageHelper` |
| 2 | Mục đích | Suy luận: helper/provider/generator/constants. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `ExifRotateBase64Image` — xem body/call site để xác định hành vi<br>`ExifRotateImageStream` — xem body/call site để xác định hành vi<br>`ExifRotateImage` — xem body/call site để xác định hành vi<br>`Image2Base64` — xem body/call site để xác định hành vi<br>… 4 method khác |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: tham số/state của `ExifRotateBase64Image` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobImageHelper::ExifRotateBase64Image(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobInventDimHelper`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobInventDimHelper` |
| 2 | Mục đích | Suy luận: helper/provider/generator/constants. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `GetInventDimCollectors` — đọc/tra cứu dữ liệu<br>`getStorageDimensions` — đọc/tra cứu dữ liệu<br>`getTrackingDimensions` — đọc/tra cứu dữ liệu<br>`getProductDimensions` — đọc/tra cứu dữ liệu<br>… 16 method khác |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: tham số/state của `GetInventDimCollectors` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobInventDimHelper::GetInventDimCollectors(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobInventDimSetup_Extension`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobInventDimSetup_Extension` |
| 2 | Mục đích | XML summary gốc (English): Class to handle the inventory Dimension setup per item with support for license plating (or using location instead of licence plating)  [ExtensionOf(classStr(TFMInventDimSetup))] |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `registerWMSPallet` — xem body/call site để xác định hành vi<br>`registerLicensePlate` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Source references (không tự khẳng định runtime call): `MobDocLicensePlateOverview`; Target theo attribute: `ExtensionOf: TFMInventDimSetup` |
| 6 | Luồng thực tế | Input: event/CoC/platform call → xử lý: hook/handler trong class → output: thay đổi state/side effect của platform; chi tiết theo method body/attribute. |
| 7 | Ví dụ | Framework/event dispatch gọi class; không khởi tạo trực tiếp. |
| 8 | Lưu ý/rủi ro | Runtime hook: không instantiate; xác nhận event/target, thứ tự, điều kiện gọi và base/next behavior. |

### `MobInventJournalTableCommon`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobInventJournalTableCommon` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `modifyPages` — xem body/call site để xác định hành vi<br>`lookupInventJournals` — đọc/tra cứu dữ liệu<br>`lookupInventJournalLines` — đọc/tra cứu dữ liệu<br>`journalType2JournalPageName` — xem body/call site để xác định hành vi<br>… 4 method khác |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: tham số/state của `modifyPages` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobInventJournalTableCommon::modifyPages(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobInventOnhand_availAndPhysical`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobInventOnhand_availAndPhysical` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `onHandQty` — xem body/call site để xác định hành vi<br>`pdsCWOnHandQty` — xem body/call site để xác định hành vi<br>`newAvailAndPhysical` — xem body/call site để xác định hành vi<br>`populateLookupResponse` — xem body/call site để xác định hành vi<br>… 2 method khác |
| 5 | Quan hệ | Kế thừa `InventDimOnHand` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobInventDimHelper` |
| 6 | Luồng thực tế | Input: tham số/state của `onHandQty` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobInventOnhand_availAndPhysical x = new MobInventOnhand_availAndPhysical(); x.onHandQty(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobInventSumHelper`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobInventSumHelper` |
| 2 | Mục đích | Suy luận: helper/provider/generator/constants. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `findInventSum` — đọc/tra cứu dữ liệu |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: tham số/state của `findInventSum` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobInventSumHelper::findInventSum(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobListItemContract`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobListItemContract` |
| 2 | Mục đích | Suy luận: contract/request/response trao đổi dữ liệu. |
| 3 | Fields quan trọng | `listItemId` (`str`) — dữ liệu mặt hàng; giá trị văn bản (suy luận từ tên/kiểu)<br>`title` (`str`) — state `title`; giá trị văn bản (suy luận từ tên/kiểu)<br>`line2` (`str`) — state `line2`; giá trị văn bản (suy luận từ tên/kiểu)<br>`line3` (`str`) — state `line3`; giá trị văn bản (suy luận từ tên/kiểu)<br>`line4` (`str`) — state `line4`; giá trị văn bản (suy luận từ tên/kiểu)<br>`iconName` (`str`) — state `iconName`; giá trị văn bản (suy luận từ tên/kiểu)<br>`line4Class` (`str`) — state `line4Class`; giá trị văn bản (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `parmListItemId` — ghi/cập nhật state hoặc dữ liệu<br>`parmTitle` — ghi/cập nhật state hoặc dữ liệu<br>`parmLine2` — ghi/cập nhật state hoặc dữ liệu<br>`parmLine3` — ghi/cập nhật state hoặc dữ liệu<br>… 3 method khác |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: values từ caller/serializer → xử lý: contract fields và parm/DataMember → output: object serialize/deserialize; direction cụ thể phụ thuộc caller. |
| 7 | Ví dụ | `MobListItemContract x = new MobListItemContract(); x.parmListItemId(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobListLookupCartContent`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobListLookupCartContent` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `getList` — đọc/tra cứu dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMList` (ngoài model) |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobListLookupCartContent x = new MobListLookupCartContent(); x.getList(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobListOrderLinesReceive`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobListOrderLinesReceive` |
| 2 | Mục đích | Suy luận: xử lý loại order và dữ liệu mobile. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `getList` — đọc/tra cứu dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMListOrderLines` (ngoài model) |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobListOrderLinesReceive x = new MobListOrderLinesReceive(); x.getList(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobListValuesElement`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobListValuesElement` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | Không khai báo method trực tiếp; dùng method kế thừa/runtime framework. |
| 5 | Quan hệ | Kế thừa `TFMListValuesElement` (ngoài model) |
| 6 | Luồng thực tế | Class không có method trực tiếp: input → xử lý → output do base/runtime framework quyết định; cần xem base/caller. |
| 7 | Ví dụ | Gọi qua base/framework/provider hiện hữu; không có method trực tiếp để minh họa. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobLocalizationContract`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobLocalizationContract` |
| 2 | Mục đích | Suy luận: contract/request/response trao đổi dữ liệu. |
| 3 | Fields quan trọng | `key` (`str`) — state `key`; giá trị văn bản (suy luận từ tên/kiểu)<br>`translation` (`str`) — state `translation`; giá trị văn bản (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `parmKey` — ghi/cập nhật state hoặc dữ liệu<br>`parmTranslation` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: values từ caller/serializer → xử lý: contract fields và parm/DataMember → output: object serialize/deserialize; direction cụ thể phụ thuộc caller. |
| 7 | Ví dụ | `MobLocalizationContract x = new MobLocalizationContract(); x.parmKey(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobLogicStepOperatorInterface`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobLogicStepOperatorInterface` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `runLogic` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: tham số/state của `runLogic` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobLogicStepOperatorInterface x = new MobLogicStepOperatorInterface(); x.runLogic(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobMediaItem`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobMediaItem` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | `name` (`str`) — state `name`; giá trị văn bản (suy luận từ tên/kiểu)<br>`base64` (`str`) — state `base64`; giá trị văn bản (suy luận từ tên/kiểu)<br>`url` (`str`) — state `url`; giá trị văn bản (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `new` — xem body/call site để xác định hành vi<br>`getBase64ForHtml` — đọc/tra cứu dữ liệu<br>`getMediaForHtml` — đọc/tra cứu dữ liệu<br>… 3 method khác |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: tham số/state của `new` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobMediaItem x = new MobMediaItem(); x.new(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobOnlineValidator`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobOnlineValidator` |
| 2 | Mục đích | XML summary gốc (English): The Document handler for the online validation aspect of the mobile WMS. |
| 3 | Fields quan trọng | `validationRequest` (`MobRequestValidationElement`) — yêu cầu; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`valueInteractionPermissionBatch` (`TFMValueInteractionPermission`) — state `valueInteractionPermissionBatch`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`updateBatchQuantity` (`NoYes`) — state `updateBatchQuantity`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`valueInteractionPermissionSerial` (`TFMValueInteractionPermission`) — state `valueInteractionPermissionSerial`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`updateSerialQuantity` (`NoYes`) — state `updateSerialQuantity`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`promptForContainerType` (`NoYes`) — state `promptForContainerType`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `description` — xem body/call site để xác định hành vi<br>`getDocumentTypes` — đọc/tra cứu dữ liệu<br>`getReferenceDataMethods` — đọc/tra cứu dữ liệu<br>`preProcess` — xem body/call site để xác định hành vi<br>… 25 method khác |
| 5 | Quan hệ | Kế thừa `TFMDocumentHandler` (ngoài model); Field type/composition candidate: `MobRequestValidationElement`; Source references (không tự khẳng định runtime call): `MobInventSumHelper`, `MobOrder`, `MobRequestValidationElement` |
| 6 | Luồng thực tế | Input: tham số/state của `description` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobOnlineValidator x = new MobOnlineValidator(); x.description(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobOrder`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobOrder` |
| 2 | Mục đích | XML summary gốc (English): The MobOrder class is an abstract parent class that all orders and order lines, that should be made available in the Mobile WMS, must inherit from. |
| 3 | Fields quan trọng | `messageID` (`TFMDocumentMessageID`) — mã/định danh; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`resultXML` (`XMLDocument`) — phản hồi/kết quả; tài liệu XML (suy luận từ tên/kiểu)<br>`responseData` (`TFMPostResponseData`) — phản hồi/kết quả; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`tblName` (`TableName`) — state `tblName`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`orderId` (`str`) — dữ liệu đơn hàng; giá trị văn bản (suy luận từ tên/kiểu)<br>`orderType` (`str`) — dữ liệu đơn hàng; giá trị văn bản (suy luận từ tên/kiểu)<br>`skipRouteActivation` (`boolean`) — route/đường xử lý; giá trị cờ bật/tắt (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getHeaderRecords` — đọc/tạo dữ liệu header<br>`getLineRecords` — đọc/tạo dữ liệu line<br>`postRequest` — thực hiện bước post; xác minh validation/transaction trong body<br>`enrichResponseXML` — xem body/call site để xác định hành vi<br>… 22 method khác |
| 5 | Quan hệ | implements `TFMBackendIDInterface` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | Dùng concrete subtype; không khởi tạo abstract class trực tiếp. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobOrderLinesResponseElement_Extension`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobOrderLinesResponseElement_Extension` |
| 2 | Mục đích | Suy luận: contract/request/response trao đổi dữ liệu. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `appendToXML` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Source references (không tự khẳng định runtime call): `MobOrder`; Target theo attribute: `ExtensionOf: TFMOrderLinesResponseElement` |
| 6 | Luồng thực tế | Input: event/CoC/platform call → xử lý: hook/handler trong class → output: thay đổi state/side effect của platform; chi tiết theo method body/attribute. |
| 7 | Ví dụ | Framework/event dispatch gọi class; không khởi tạo trực tiếp. |
| 8 | Lưu ý/rủi ro | Runtime hook: không instantiate; xác nhận event/target, thứ tự, điều kiện gọi và base/next behavior. |

### `MobPageAdhocMenuItemsAdditionalProperties`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobPageAdhocMenuItemsAdditionalProperties` |
| 2 | Mục đích | Suy luận: page/configuration mobile. |
| 3 | Fields quan trọng | `documentType` (`MobDocumentTypeId`) — state `documentType`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`contentType` (`MobDocumentContentSubject`) — state `contentType`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`refreshOnSuccess` (`boolean`) — state `refreshOnSuccess`; giá trị cờ bật/tắt (suy luận từ tên/kiểu)<br>`pageId` (`MobPageID`) — page; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getparameters` — đọc/tra cứu dữ liệu<br>… 4 method khác |
| 5 | Quan hệ | Kế thừa `MobPageMenuItemsAdditionalProperties`; Source references (không tự khẳng định runtime call): `MobPageMenuItemsAdditionalProperties` |
| 6 | Luồng thực tế | Input: tham số/state của `getparameters` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobPageAdhocMenuItemsAdditionalProperties x = new MobPageAdhocMenuItemsAdditionalProperties(); x.getparameters(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát state/step, caller context, quyền và đồng bộ contract với mobile client. |

### `MobPageHelper`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobPageHelper` |
| 2 | Mục đích | Suy luận: page/configuration mobile. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `getPagesFromClass` — đọc/tra cứu dữ liệu<br>`findOrderlistRequestDocuments` — đọc/tra cứu dữ liệu<br>`menuContainer2Classes` — xem body/call site để xác định hành vi<br>`getMethodsUsingSysAttribute` — đọc/tra cứu dữ liệu<br>… 3 method khác |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: tham số/state của `getPagesFromClass` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobPageHelper::getPagesFromClass(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Rà soát state/step, caller context, quyền và đồng bộ contract với mobile client. |

### `MobPageLineAdhocRequestAttribute`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobPageLineAdhocRequestAttribute` |
| 2 | Mục đích | XML summary gốc (English): The attribute to add if the adhoc action should appear on the 'adhoc' menu items in the add menu item lookup page. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | Không khai báo method trực tiếp; dùng method kế thừa/runtime framework. |
| 5 | Quan hệ | Kế thừa `TFMPageLineAdhocRequestAttribute` (ngoài model) |
| 6 | Luồng thực tế | Input: values từ caller/serializer → xử lý: contract fields và parm/DataMember → output: object serialize/deserialize; direction cụ thể phụ thuộc caller. |
| 7 | Ví dụ | Gọi qua base/framework/provider hiện hữu; không có method trực tiếp để minh họa. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobPageMenuConfiguration`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobPageMenuConfiguration` |
| 2 | Mục đích | Suy luận: page/configuration mobile. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | Không khai báo method trực tiếp; dùng method kế thừa/runtime framework. |
| 5 | Quan hệ | Kế thừa `TFMPageMenuConfiguration` (ngoài model) |
| 6 | Luồng thực tế | Class không có method trực tiếp: input → xử lý → output do base/runtime framework quyết định; cần xem base/caller. |
| 7 | Ví dụ | Gọi qua base/framework/provider hiện hữu; không có method trực tiếp để minh họa. |
| 8 | Lưu ý/rủi ro | Rà soát state/step, caller context, quyền và đồng bộ contract với mobile client. |

### `MobPageMenuItemsAdditionalProperties`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobPageMenuItemsAdditionalProperties` |
| 2 | Mục đích | Suy luận: page/configuration mobile. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | Không khai báo method trực tiếp; dùng method kế thừa/runtime framework. |
| 5 | Quan hệ | Kế thừa `TFMPageMenuItemsAdditionalProperties` (ngoài model) |
| 6 | Luồng thực tế | Class không có method trực tiếp: input → xử lý → output do base/runtime framework quyết định; cần xem base/caller. |
| 7 | Ví dụ | Gọi qua base/framework/provider hiện hữu; không có method trực tiếp để minh họa. |
| 8 | Lưu ý/rủi ro | Rà soát state/step, caller context, quyền và đồng bộ contract với mobile client. |

### `MobPageMenuItemsHelper`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobPageMenuItemsHelper` |
| 2 | Mục đích | Suy luận: page/configuration mobile. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `addMenuItemsToXML` — ghi/cập nhật state hoặc dữ liệu<br>`addActionToXml` — ghi/cập nhật state hoặc dữ liệu<br>`findElementForPageSpecificMenuItem` — đọc/tra cứu dữ liệu<br>`setMenuItemsAttributesValues` — ghi/cập nhật state hoặc dữ liệu<br>… 3 method khác |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: tham số/state của `addMenuItemsToXML` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobPageMenuItemsHelper::addMenuItemsToXML(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Rà soát state/step, caller context, quyền và đồng bộ contract với mobile client. |

### `MobPagesProvider`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobPagesProvider` |
| 2 | Mục đích | Suy luận: page/configuration mobile. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `instance` — xem body/call site để xác định hành vi<br>`getAllPages` — đọc/tra cứu dữ liệu |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: tham số/state của `instance` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobPagesProvider::instance(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Rà soát state/step, caller context, quyền và đồng bộ contract với mobile client. |

### `MobPageTitle`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobPageTitle` |
| 2 | Mục đích | Suy luận: page/configuration mobile. |
| 3 | Fields quan trọng | `defaultValue` (`str`) — state `defaultValue`; giá trị văn bản (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `parmDefaultValue` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: tham số/state của `parmDefaultValue` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobPageTitle x = new MobPageTitle(); x.parmDefaultValue(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát state/step, caller context, quyền và đồng bộ contract với mobile client. |

### `MobPickOrderType`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobPickOrderType` |
| 2 | Mục đích | XML summary gốc (English): The parent class of all the classes to provide data for the pick order page. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `OrderType` — xác định loại order<br>`generateResponse` — tạo response mobile |
| 5 | Quan hệ | Kế thừa `MobOrder`; implements `TFMOrderTypeInterface`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobOrder` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | Dùng concrete subtype; không khởi tạo abstract class trực tiếp. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobPickOrderTypeConsolidatedPicklist`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobPickOrderTypeConsolidatedPicklist` |
| 2 | Mục đích | Suy luận: xử lý loại order và dữ liệu mobile. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | Không khai báo method trực tiếp; dùng method kế thừa/runtime framework. |
| 5 | Quan hệ | Kế thừa `MobPickOrderTypePicklist`; Source references (không tự khẳng định runtime call): `MobPickOrderTypePicklist` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | Gọi qua base/framework/provider hiện hữu; không có method trực tiếp để minh họa. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobPickOrderTypePicklist`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobPickOrderTypePicklist` |
| 2 | Mục đích | XML summary gốc (English): The MobPickOrderTypePicklist class handles the pick list data and posting logic. |
| 3 | Fields quan trọng | `resPickingRoute` (`WMSPickingRoute`) — route/đường xử lý; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`packingSlipJour` (`CustPackingSlipJour`) — packing slip/journal; buffer journal (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getPackingSlipJour` — đọc/tra cứu dữ liệu<br>`getHeaderRecords` — đọc/tạo dữ liệu header<br>`postRequest` — thực hiện bước post; xác minh validation/transaction trong body<br>`getWMSPickingRoute` — đọc/tra cứu dữ liệu<br>… 9 method khác |
| 5 | Quan hệ | Kế thừa `MobPickOrderType`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocPickOrder`, `MobHelper`, `MobPickOrderType` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobPickOrderTypePicklist x = new MobPickOrderTypePicklist(); x.getPackingSlipJour(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobPickOrderTypeProd`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobPickOrderTypeProd` |
| 2 | Mục đích | XML summary gốc (English): The MobPickOrderTypeProd class handles the production picking list data and posting logic. |
| 3 | Fields quan trọng | `journalTable` (`ProdJournalTable`) — journal; buffer bản ghi bảng (suy luận từ tên/kiểu)<br>`pickOrderDoc` (`MobDocPickOrder`) — dữ liệu đơn hàng; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getProdJournalTable` — đọc/tra cứu dữ liệu<br>`getHeaderRecords` — đọc/tạo dữ liệu header<br>`getBackendID` — đọc/tra cứu dữ liệu<br>`post` — thực hiện bước post; xác minh validation/transaction trong body<br>… 11 method khác |
| 5 | Quan hệ | Kế thừa `MobPickOrderType`; Field type/composition candidate: `MobDocPickOrder`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocPickOrder`, `MobHelper`, `MobPickOrderType`, `MobPostHelper` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobPickOrderTypeProd x = new MobPickOrderTypeProd(); x.getProdJournalTable(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobPickOrderTypeReturn`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobPickOrderTypeReturn` |
| 2 | Mục đích | XML summary gốc (English): The MobPickOrderTypeReturn class handles the RMA Purchase Order data and posting logic. |
| 3 | Fields quan trọng | `orderSet` (`Set`) — tập hợp order; tập hợp giá trị không trùng (suy luận từ tên/kiểu)<br>`packingSlipJour` (`VendPackingSlipJour`) — packing slip/journal; buffer journal (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getBackendID` — đọc/tra cứu dữ liệu<br>`parameterMap` — xem body/call site để xác định hành vi<br>`getHeaderRecords` — đọc/tạo dữ liệu header<br>`getPurchaseOrders` — đọc/tra cứu dữ liệu<br>… 11 method khác |
| 5 | Quan hệ | Kế thừa `MobPickOrderType`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocPickOrder`, `MobDocReceiveOrder`, `MobHelper`, `MobPickOrderType` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobPickOrderTypeReturn x = new MobPickOrderTypeReturn(); x.getBackendID(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobPickOrderTypeSales`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobPickOrderTypeSales` |
| 2 | Mục đích | XML summary gốc (English): The MobPickOrderTypeSales class handles the Sales Order data and posting logic. |
| 3 | Fields quan trọng | `packingSlipJour` (`CustPackingSlipJour`) — packing slip/journal; buffer journal (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getPackingSlipJour` — đọc/tra cứu dữ liệu<br>`getHeaderRecords` — đọc/tạo dữ liệu header<br>`getBackendID` — đọc/tra cứu dữ liệu<br>`lineTableId` — xem body/call site để xác định hành vi<br>… 6 method khác |
| 5 | Quan hệ | Kế thừa `MobPickOrderType`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocPickOrder`, `MobHelper`, `MobPickOrderType` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobPickOrderTypeSales x = new MobPickOrderTypeSales(); x.getPackingSlipJour(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobPickOrderTypeTransfer`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobPickOrderTypeTransfer` |
| 2 | Mục đích | XML summary gốc (English): The MobPickOrderTypeTransfer class handles the Pick Transfer Order data and posting logic. |
| 3 | Fields quan trọng | `transferTable` (`InventTransferTable`) — state `transferTable`; buffer bản ghi bảng (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getHeaderRecords` — đọc/tạo dữ liệu header<br>`post` — thực hiện bước post; xác minh validation/transaction trong body<br>`postRequest` — thực hiện bước post; xác minh validation/transaction trong body<br>`getInventTransferTable` — đọc/tra cứu dữ liệu<br>… 5 method khác |
| 5 | Quan hệ | Kế thừa `MobPickOrderType`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocPickOrder`, `MobHelper`, `MobPickOrderType` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobPickOrderTypeTransfer x = new MobPickOrderTypeTransfer(); x.getHeaderRecords(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobPlannedMoveType`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobPlannedMoveType` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | `InventJournalTable` (`InventJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu)<br>`recIdReplace` (`Map`) — state `recIdReplace`; map key/value (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getHeaderRecords` — đọc/tạo dữ liệu header<br>`getInventJournalTable` — đọc/tra cứu dữ liệu<br>`getLineRecords` — đọc/tạo dữ liệu line<br>`getJournalId` — đọc/tra cứu dữ liệu<br>… 5 method khác |
| 5 | Quan hệ | Kế thừa `MobCountOrderType`; Source references (không tự khẳng định runtime call): `MobCountOrderType`, `MobHelper` |
| 6 | Luồng thực tế | Input: tham số/state của `getHeaderRecords` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobPlannedMoveType x = new MobPlannedMoveType(); x.getHeaderRecords(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobPostHelper`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobPostHelper` |
| 2 | Mục đích | Suy luận: helper/provider/generator/constants. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `inventJournalTransfer` — xem body/call site để xác định hành vi<br>`inventJournalTransferHeaderCreate` — xem body/call site để xác định hành vi<br>`inventJournalTransferLineCreate` — xem body/call site để xác định hành vi<br>`postInventJournalTransfer` — thực hiện bước post; xác minh validation/transaction trong body<br>… 9 method khác |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: tham số/state của `inventJournalTransfer` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobPostHelper::inventJournalTransfer(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobReceiveOrderType`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobReceiveOrderType` |
| 2 | Mục đích | XML summary gốc (English): The parent class of all the classes to provide data for the receive order page. |
| 3 | Fields quan trọng | `itemInventDim` (`InventDim`) — dimension tồn kho (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `OrderType` — xác định loại order<br>`generateResponse` — tạo response mobile<br>`processScannedValue` — xử lý giá trị scan |
| 5 | Quan hệ | Kế thừa `MobOrder`; implements `TFMOrderTypeInterface`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobOrder` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | Dùng concrete subtype; không khởi tạo abstract class trực tiếp. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobReceiveOrderTypeArrival`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobReceiveOrderTypeArrival` |
| 2 | Mục đích | XML summary có dấu hiệu sai/copy: nêu `MobPickOrderTypeTransfer`, không phải class hiện tại; mục đích chưa xác minh, suy luận từ tên/base/methods. |
| 3 | Fields quan trọng | `orderSet` (`Set`) — tập hợp order; tập hợp giá trị không trùng (suy luận từ tên/kiểu)<br>`JournalTable` (`WMSJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getBackendID` — đọc/tra cứu dữ liệu<br>`getHeaderRecords` — đọc/tạo dữ liệu header<br>`getWMSJournalId` — đọc/tra cứu dữ liệu<br>`getPostPromptCollectors` — lấy collector cho prompt sau bước post<br>… 6 method khác |
| 5 | Quan hệ | Kế thừa `MobReceiveOrderType`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocReceiveOrder`, `MobHelper`, `MobPickOrderTypeTransfer`, `MobReceiveOrderType` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobReceiveOrderTypeArrival x = new MobReceiveOrderTypeArrival(); x.getBackendID(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobReceiveOrderTypeLandedCostOrder`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobReceiveOrderTypeLandedCostOrder` |
| 2 | Mục đích | XML summary gốc (English): The MobReceiveOrderTypeLandedCostOrder class handles the Receive Landing Cost Order data and posting logic. |
| 3 | Fields quan trọng | `orderSet` (`Set`) — tập hợp order; tập hợp giá trị không trùng (suy luận từ tên/kiểu)<br>`purchTableForPost` (`PurchTable`) — buffer/state dùng trong bước post; buffer đơn mua hàng (suy luận từ tên/kiểu)<br>`packingSlipJour` (`VendPackingSlipJour`) — packing slip/journal; buffer journal (suy luận từ tên/kiểu)<br>`usePackingSlip` (`boolean`) — cờ/điều kiện `usePackingSlip`; giá trị cờ bật/tắt (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getBackendID` — đọc/tra cứu dữ liệu<br>`getItmId` — đọc/tra cứu dữ liệu<br>`getPostPromptCollectors` — lấy collector cho prompt sau bước post<br>`getHeaderRecords` — đọc/tạo dữ liệu header<br>… 12 method khác |
| 5 | Quan hệ | Kế thừa `MobReceiveOrderType`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocReceiveOrder`, `MobHelper`, `MobReceiveOrderType`, `MobReceiveOrderTypePurchOrder` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobReceiveOrderTypeLandedCostOrder x = new MobReceiveOrderTypeLandedCostOrder(); x.getBackendID(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobReceiveOrderTypeProdInput`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobReceiveOrderTypeProdInput` |
| 2 | Mục đích | XML summary gốc (English): The MobReceiveOrderTypeProdInput class handles the Production Input Order data and posting logic. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `getwmsJournalTable` — đọc/tra cứu dữ liệu<br>`getBackendID` — đọc/tra cứu dữ liệu<br>`getHeaderRecords` — đọc/tạo dữ liệu header<br>`getProductionInputJournals` — đọc/tra cứu dữ liệu |
| 5 | Quan hệ | Kế thừa `MobReceiveOrderTypeArrival`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocReceiveOrder`, `MobHelper`, `MobReceiveOrderTypeArrival` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobReceiveOrderTypeProdInput x = new MobReceiveOrderTypeProdInput(); x.getwmsJournalTable(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobReceiveOrderTypePurchOrder`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobReceiveOrderTypePurchOrder` |
| 2 | Mục đích | XML summary gốc (English): The MobReceiveOrderTypePurchOrder class handles the REceive Purchase Order data and posting logic. |
| 3 | Fields quan trọng | `orderSet` (`Set`) — tập hợp order; tập hợp giá trị không trùng (suy luận từ tên/kiểu)<br>`packingSlipJour` (`VendPackingSlipJour`) — packing slip/journal; buffer journal (suy luận từ tên/kiểu)<br>`purchTableForPost` (`PurchTable`) — buffer/state dùng trong bước post; buffer đơn mua hàng (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getBackendID` — đọc/tra cứu dữ liệu<br>`getHeaderRecords` — đọc/tạo dữ liệu header<br>`getPurchId` — đọc/tra cứu dữ liệu<br>`getPostPromptCollectors` — lấy collector cho prompt sau bước post<br>… 12 method khác |
| 5 | Quan hệ | Kế thừa `MobReceiveOrderType`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocReceiveOrder`, `MobHelper`, `MobReceiveOrderType` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobReceiveOrderTypePurchOrder x = new MobReceiveOrderTypePurchOrder(); x.getBackendID(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobReceiveOrderTypeReturn`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobReceiveOrderTypeReturn` |
| 2 | Mục đích | XML summary gốc (English): The MobReceiveOrderTypeReturn class handles the Receive Arrival Order data and posting logic. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `getwmsJournalTable` — đọc/tra cứu dữ liệu<br>`getBackendID` — đọc/tra cứu dữ liệu<br>`getHeaderRecords` — đọc/tạo dữ liệu header<br>`getReturnOrders` — đọc/tra cứu dữ liệu |
| 5 | Quan hệ | Kế thừa `MobReceiveOrderTypeArrival`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocReceiveOrder`, `MobHelper`, `MobReceiveOrderTypeArrival` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobReceiveOrderTypeReturn x = new MobReceiveOrderTypeReturn(); x.getwmsJournalTable(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobReceiveOrderTypeTransfer`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobReceiveOrderTypeTransfer` |
| 2 | Mục đích | XML summary gốc (English): The MobReceiveOrderTypeTransfer class handles the Receive Transfer Order data and posting logic. |
| 3 | Fields quan trọng | `orderSet` (`Set`) — tập hợp order; tập hợp giá trị không trùng (suy luận từ tên/kiểu)<br>`transferTable` (`InventTransferTable`) — state `transferTable`; buffer bản ghi bảng (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `getBackendID` — đọc/tra cứu dữ liệu<br>`getHeaderRecords` — đọc/tạo dữ liệu header<br>`getTransferId` — đọc/tra cứu dữ liệu<br>`getLineRecords` — đọc/tạo dữ liệu line<br>… 5 method khác |
| 5 | Quan hệ | Kế thừa `MobReceiveOrderType`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocReceiveOrder`, `MobHelper`, `MobReceiveOrderType` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `MobReceiveOrderTypeTransfer x = new MobReceiveOrderTypeTransfer(); x.getBackendID(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobRequestApplication`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobRequestApplication` |
| 2 | Mục đích | Suy luận: contract/request/response trao đổi dữ liệu. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | Không khai báo method trực tiếp; dùng method kế thừa/runtime framework. |
| 5 | Quan hệ | Kế thừa `TFMRequestApplication` (ngoài model) |
| 6 | Luồng thực tế | Input: values từ caller/serializer → xử lý: contract fields và parm/DataMember → output: object serialize/deserialize; direction cụ thể phụ thuộc caller. |
| 7 | Ví dụ | Gọi qua base/framework/provider hiện hữu; không có method trực tiếp để minh họa. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobRequestFiltersElement_Extension`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobRequestFiltersElement_Extension` |
| 2 | Mục đích | Suy luận: contract/request/response trao đổi dữ liệu. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `new` — xem body/call site để xác định hành vi<br>… 1 method khác |
| 5 | Quan hệ | Target theo attribute: `ExtensionOf: TFMRequestFiltersElement` |
| 6 | Luồng thực tế | Input: event/CoC/platform call → xử lý: hook/handler trong class → output: thay đổi state/side effect của platform; chi tiết theo method body/attribute. |
| 7 | Ví dụ | Framework/event dispatch gọi class; không khởi tạo trực tiếp. |
| 8 | Lưu ý/rủi ro | Runtime hook: không instantiate; xác nhận event/target, thứ tự, điều kiện gọi và base/next behavior. |

### `MobRequestMoveMultiLicensePlate`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobRequestMoveMultiLicensePlate` |
| 2 | Mục đích | Suy luận: contract/request/response trao đổi dữ liệu. |
| 3 | Fields quan trọng | `LP` (`WHSLicensePlateId`) — state `LP`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `parmWHSLicensePlateId` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMRequestBasicElement` (ngoài model) |
| 6 | Luồng thực tế | Input: values từ caller/serializer → xử lý: contract fields và parm/DataMember → output: object serialize/deserialize; direction cụ thể phụ thuộc caller. |
| 7 | Ví dụ | `MobRequestMoveMultiLicensePlate x = new MobRequestMoveMultiLicensePlate(); x.parmWHSLicensePlateId(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobRequestValidationElement`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobRequestValidationElement` |
| 2 | Mục đích | Suy luận: contract/request/response trao đổi dữ liệu. |
| 3 | Fields quan trọng | `wmsLocationId` (`str`) — mã/định danh; giá trị văn bản (suy luận từ tên/kiểu)<br>`bin` (`str`) — state `bin`; giá trị văn bản (suy luận từ tên/kiểu)<br>`lineNumber` (`str`) — state `lineNumber`; giá trị văn bản (suy luận từ tên/kiểu)<br>`BackendID` (`TFMBackendId`) — mã/định danh; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`orderType` (`str`) — dữ liệu đơn hàng; giá trị văn bản (suy luận từ tên/kiểu)<br>`inventlocationid` (`InventLocationId`) — mã/định danh; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`containerType` (`WHSContainerTypeCode`) — state `containerType`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `parmWHSContainerTypeCode` — ghi/cập nhật state hoặc dữ liệu<br>`parmBackendID` — ghi/cập nhật state hoặc dữ liệu<br>`parmOrderType` — ghi/cập nhật state hoặc dữ liệu<br>`parmOrderBackendID` — ghi/cập nhật state hoặc dữ liệu<br>… 4 method khác |
| 5 | Quan hệ | Kế thừa `TFMRequestRegistrationElement` (ngoài model); Source references (không tự khẳng định runtime call): `MobOnlineValidator` |
| 6 | Luồng thực tế | Input: values từ caller/serializer → xử lý: contract fields và parm/DataMember → output: object serialize/deserialize; direction cụ thể phụ thuộc caller. |
| 7 | Ví dụ | `MobRequestValidationElement x = new MobRequestValidationElement(); x.parmWHSContainerTypeCode(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobToteShipping`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobToteShipping` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `Main` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: tham số/state của `Main` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobToteShipping::Main(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobVersion`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobVersion` |
| 2 | Mục đích | XML summary gốc (English): Class created to return version information from the model. |
| 3 | Fields quan trọng | `versionStr` (`str`) — state `versionStr`; giá trị văn bản (suy luận từ tên/kiểu)<br>`Publisher` (`str`) — state `Publisher`; giá trị văn bản (suy luận từ tên/kiểu)<br>`versionName` (`str`) — state `versionName`; giá trị văn bản (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `Construct` — tạo/định dạng output<br>`new` — xem body/call site để xác định hành vi<br>`modelForClass` — xem body/call site để xác định hành vi<br>`populateGroupWithExtensions` — xem body/call site để xác định hành vi<br>… 4 method khác |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: tham số/state của `Construct` → xử lý: method chính → output: kiểu return/side effect theo signature; semantics không có summary được xem là suy luận. |
| 7 | Ví dụ | `MobVersion::Construct(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Nếu không có XML summary, mục đích/flow là suy luận; kiểm tra caller, constructor, access, null handling và side effect trong body. |

### `MobWorkflowDefinitionCount`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobWorkflowDefinitionCount` |
| 2 | Mục đích | Suy luận: workflow mobile. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `makeWorkflow` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Kế thừa `TFMWorkflowDefinition` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants` |
| 6 | Luồng thực tế | Input: workflow configuration/state → xử lý: method workflow/step → output: definition/steps hoặc validation; suy luận nếu không có summary. |
| 7 | Ví dụ | `MobWorkflowDefinitionCount x = new MobWorkflowDefinitionCount(); x.makeWorkflow(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobWorkflowDefinitionReceive`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobWorkflowDefinitionReceive` |
| 2 | Mục đích | Suy luận: workflow mobile. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `makeWorkflow` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Kế thừa `TFMWorkflowDefinition` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants` |
| 6 | Luồng thực tế | Input: workflow configuration/state → xử lý: method workflow/step → output: definition/steps hoặc validation; suy luận nếu không có summary. |
| 7 | Ví dụ | `MobWorkflowDefinitionReceive x = new MobWorkflowDefinitionReceive(); x.makeWorkflow(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `MobWorkflowDefinitionStandard_Extension`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobWorkflowDefinitionStandard_Extension` |
| 2 | Mục đích | Suy luận: workflow mobile. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `makeWorkflow` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Source references (không tự khẳng định runtime call): `MobConstants`, `MobOnlineValidator`; Target theo attribute: `ExtensionOf: TFMWorkflowDefinitionStandard` |
| 6 | Luồng thực tế | Input: event/CoC/platform call → xử lý: hook/handler trong class → output: thay đổi state/side effect của platform; chi tiết theo method body/attribute. |
| 7 | Ví dụ | Framework/event dispatch gọi class; không khởi tạo trực tiếp. |
| 8 | Lưu ý/rủi ro | Runtime hook: không instantiate; xác nhận event/target, thứ tự, điều kiện gọi và base/next behavior. |

### `MobWorkflowValidationOutboundLP`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobWorkflowValidationOutboundLP` |
| 2 | Mục đích | Suy luận: workflow mobile. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `validationType` — xem body/call site để xác định hành vi<br>`label` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Kế thừa `TFMWorkflowValidation` (ngoài model); Source references (không tự khẳng định runtime call): `MobHelper` |
| 6 | Luồng thực tế | Input: workflow configuration/state → xử lý: method workflow/step → output: definition/steps hoặc validation; suy luận nếu không có summary. |
| 7 | Ví dụ | `MobWorkflowValidationOutboundLP x = new MobWorkflowValidationOutboundLP(); x.validationType(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát state/step, caller context, quyền và đồng bộ contract với mobile client. |

### `MobXMLFormatLookupCarts`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatLookupCarts` |
| 2 | Mục đích | Suy luận: định dạng dữ liệu lookup XML. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatLookup` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocUnplannedCartMove`, `MobHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatLookupCarts x = new MobXMLFormatLookupCarts(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatLookupFinishPacking`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatLookupFinishPacking` |
| 2 | Mục đích | Suy luận: định dạng dữ liệu lookup XML. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatLookup` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatLookupFinishPacking x = new MobXMLFormatLookupFinishPacking(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatLookupLicensePlate`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatLookupLicensePlate` |
| 2 | Mục đích | Suy luận: định dạng dữ liệu lookup XML. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatLookup` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatLookupLicensePlate x = new MobXMLFormatLookupLicensePlate(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatLookupLicensePlateInCart`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatLookupLicensePlateInCart` |
| 2 | Mục đích | Suy luận: định dạng dữ liệu lookup XML. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatOrders` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatLookupLicensePlateInCart x = new MobXMLFormatLookupLicensePlateInCart(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatLookupLicensePlateInfo`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatLookupLicensePlateInfo` |
| 2 | Mục đích | Suy luận: định dạng dữ liệu lookup XML. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatLookup` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatLookupLicensePlateInfo x = new MobXMLFormatLookupLicensePlateInfo(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatLookupLocateItem`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatLookupLocateItem` |
| 2 | Mục đích | Suy luận: định dạng dữ liệu lookup XML. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatLookup` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatLookupLocateItem x = new MobXMLFormatLookupLocateItem(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatLookupLocationContent`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatLookupLocationContent` |
| 2 | Mục đích | Suy luận: định dạng dữ liệu lookup XML. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatLookup` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatLookupLocationContent x = new MobXMLFormatLookupLocationContent(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatLookupPackingStations`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatLookupPackingStations` |
| 2 | Mục đích | Suy luận: định dạng dữ liệu lookup XML. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatLookup` (ngoài model); Source references (không tự khẳng định runtime call): `MobDocUnplannedCartMove`, `MobHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatLookupPackingStations x = new MobXMLFormatLookupPackingStations(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatLookupProdOrder`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatLookupProdOrder` |
| 2 | Mục đích | Suy luận: định dạng dữ liệu lookup XML. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatLookup` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatLookupProdOrder x = new MobXMLFormatLookupProdOrder(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatLookupProfitLoss`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatLookupProfitLoss` |
| 2 | Mục đích | Suy luận: định dạng dữ liệu lookup XML. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatLookup` (ngoài model) |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatLookupProfitLoss x = new MobXMLFormatLookupProfitLoss(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatLookupProfitLossLine`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatLookupProfitLossLine` |
| 2 | Mục đích | Suy luận: định dạng dữ liệu lookup XML. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatLookup` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatLookupProfitLossLine x = new MobXMLFormatLookupProfitLossLine(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatLookupQuarantineOrder`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatLookupQuarantineOrder` |
| 2 | Mục đích | Suy luận: định dạng dữ liệu lookup XML. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatLookup` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobExpressionsInventDimStr`, `MobHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatLookupQuarantineOrder x = new MobXMLFormatLookupQuarantineOrder(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatLookupTagCounting`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatLookupTagCounting` |
| 2 | Mục đích | Suy luận: định dạng dữ liệu lookup XML. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatLookup` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatLookupTagCounting x = new MobXMLFormatLookupTagCounting(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatLookupTagCountingLine`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatLookupTagCountingLine` |
| 2 | Mục đích | Suy luận: định dạng dữ liệu lookup XML. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatLookup` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatLookupTagCountingLine x = new MobXMLFormatLookupTagCountingLine(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatLookupTote`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatLookupTote` |
| 2 | Mục đích | Suy luận: định dạng dữ liệu lookup XML. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatLookup` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatLookupTote x = new MobXMLFormatLookupTote(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatLookupToteContent`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatLookupToteContent` |
| 2 | Mục đích | Suy luận: định dạng dữ liệu lookup XML. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatLookup` (ngoài model); Source references (không tự khẳng định runtime call): `MobBarcodeHelper`, `MobConstants`, `MobHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatLookupToteContent x = new MobXMLFormatLookupToteContent(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXmlFormatLookupTransferJournals`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXmlFormatLookupTransferJournals` |
| 2 | Mục đích | Suy luận: định dạng dữ liệu lookup XML. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatLookup` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXmlFormatLookupTransferJournals x = new MobXmlFormatLookupTransferJournals(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrderLines_BatchOrder`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrderLines_BatchOrder` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for receive batch order lines. |
| 3 | Fields quan trọng | `prod` (`ProdTable`) — state `prod`; buffer lệnh sản xuất (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrderLines_Receive`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobOrder`, `MobXMLFormatOrderLines_Receive` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrderLines_BatchOrder x = new MobXMLFormatOrderLines_BatchOrder(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrderLines_CoBy`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrderLines_CoBy` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for Co/By Product lines. |
| 3 | Fields quan trọng | `coBy` (`PmfProdCoBy`) — state `coBy`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatOrderLines` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobOrder` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrderLines_CoBy x = new MobXMLFormatOrderLines_CoBy(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrderLines_Invent`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrderLines_Invent` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter super class for general inventory lines. |
| 3 | Fields quan trọng | `JournalID` (`InventJournalId`) — journal; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setInventDim` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatOrderLines` (ngoài model) |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrderLines_Invent x = new MobXMLFormatOrderLines_Invent(); x.setInventDim(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrderLines_InventCount`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrderLines_InventCount` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for Counting lines. |
| 3 | Fields quan trọng | `inventJournalTrans` (`InventJournalTrans`) — journal; buffer transaction (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrderLines_Invent`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobOrder`, `MobXMLFormatOrderLines_Invent` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrderLines_InventCount x = new MobXMLFormatOrderLines_InventCount(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrderLines_InventCountTag`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrderLines_InventCountTag` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for Tag counting lines. |
| 3 | Fields quan trọng | `inventJournalTrans_Tag` (`InventJournalTrans_Tag`) — journal; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrderLines_Invent`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobOrder`, `MobXMLFormatOrderLines_Invent` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrderLines_InventCountTag x = new MobXMLFormatOrderLines_InventCountTag(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrderLines_Pick`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrderLines_Pick` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter super class for general picking order lines. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatOrderLines` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrderLines_Pick x = new MobXMLFormatOrderLines_Pick(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrderLines_PickProd`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrderLines_PickProd` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for picking production order lines. |
| 3 | Fields quan trọng | `prodJournalBom` (`ProdJournalBom`) — journal; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrderLines_Pick`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobOrder`, `MobXMLFormatOrderLines_Pick` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrderLines_PickProd x = new MobXMLFormatOrderLines_PickProd(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrderLines_PickSales`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrderLines_PickSales` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for picking Sales order lines. |
| 3 | Fields quan trọng | `salesLine` (`SalesLine`) — state `salesLine`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrderLines_Pick`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobOrder`, `MobXMLFormatOrderLines_Pick` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrderLines_PickSales x = new MobXMLFormatOrderLines_PickSales(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrderLines_PickTransfer`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrderLines_PickTransfer` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for picking Transfer order lines. |
| 3 | Fields quan trọng | `inventTransferLine` (`InventTransferLine`) — state `inventTransferLine`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrderLines_Pick`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobOrder`, `MobXMLFormatOrderLines_Pick` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrderLines_PickTransfer x = new MobXMLFormatOrderLines_PickTransfer(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrderLines_PickWMS`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrderLines_PickWMS` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for picking WMS order lines. |
| 3 | Fields quan trọng | `orderTrans` (`WMSOrderTrans`) — dữ liệu đơn hàng; buffer transaction (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setInventDim` — ghi/cập nhật state hoặc dữ liệu<br>`setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrderLines_Pick`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocPackingItems`, `MobDocPickOrder`, `MobHelper`, `MobOrder` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrderLines_PickWMS x = new MobXMLFormatOrderLines_PickWMS(); x.setInventDim(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrderLines_PlannedMove`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrderLines_PlannedMove` |
| 2 | Mục đích | Suy luận: định dạng XML cho các dòng order. |
| 3 | Fields quan trọng | `inventJournalTrans` (`InventJournalTrans`) — journal; buffer transaction (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrderLines_Pick`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobOrder`, `MobXMLFormatOrderLines_Pick` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrderLines_PlannedMove x = new MobXMLFormatOrderLines_PlannedMove(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrderLines_Receive`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrderLines_Receive` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter super class for general receive order lines. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setInventDim` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatOrderLines` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrderLines_Receive x = new MobXMLFormatOrderLines_Receive(); x.setInventDim(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrderLines_ReceiveArrival`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrderLines_ReceiveArrival` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for receive Item Arrival order lines. |
| 3 | Fields quan trọng | `wMSJournalTrans` (`WMSJournalTrans`) — journal; buffer transaction (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrderLines_Receive`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobOrder`, `MobXMLFormatOrderLines_Receive` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrderLines_ReceiveArrival x = new MobXMLFormatOrderLines_ReceiveArrival(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrderLines_ReceiveLandedCost`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrderLines_ReceiveLandedCost` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for receive Landed Cost order lines. |
| 3 | Fields quan trọng | `itmLine` (`ITMLine`) — state `itmLine`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `findInventTransId` — đọc/tra cứu dữ liệu<br>`setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrderLines_Receive`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocReceiveOrder`, `MobHelper`, `MobOrder`, `MobReceiveOrderTypeLandedCostOrder` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrderLines_ReceiveLandedCost::findInventTransId(<args>)`; thay placeholder theo signature. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrderLines_ReceivePurch`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrderLines_ReceivePurch` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for receive Purchase order lines. |
| 3 | Fields quan trọng | `purchLine` (`PurchLine`) — state `purchLine`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrderLines_Receive`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocPickOrder`, `MobDocReceiveOrder`, `MobHelper`, `MobOrder` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrderLines_ReceivePurch x = new MobXMLFormatOrderLines_ReceivePurch(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrderLines_ReceiveTransfer`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrderLines_ReceiveTransfer` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for receive Transfer order lines. |
| 3 | Fields quan trọng | `inventTransferLine` (`InventTransferLine`) — state `inventTransferLine`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrderLines_Receive`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobOrder`, `MobXMLFormatOrderLines_Receive` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrderLines_ReceiveTransfer x = new MobXMLFormatOrderLines_ReceiveTransfer(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_BatchOrders`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_BatchOrders` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for purchase orders. |
| 3 | Fields quan trọng | `prodTable` (`ProdTable`) — state `prodTable`; buffer lệnh sản xuất (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatOrders` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrders_BatchOrders x = new MobXMLFormatOrders_BatchOrders(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_Cart`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_Cart` |
| 2 | Mục đích | Suy luận: định dạng XML cho order. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatOrders` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobHelper`, `MobInventDimHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrders_Cart x = new MobXMLFormatOrders_Cart(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_Extension`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_Extension` |
| 2 | Mục đích | Suy luận: định dạng XML cho order. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `convertFieldsToMap` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Source references (không tự khẳng định runtime call): `MobOrder`; Target theo attribute: `ExtensionOf: TFMXMLFormatOrders` |
| 6 | Luồng thực tế | Input: event/CoC/platform call → xử lý: hook/handler trong class → output: thay đổi state/side effect của platform; chi tiết theo method body/attribute. |
| 7 | Ví dụ | Framework/event dispatch gọi class; không khởi tạo trực tiếp. |
| 8 | Lưu ý/rủi ro | Runtime hook: không instantiate; xác nhận event/target, thứ tự, điều kiện gọi và base/next behavior. |

### `MobXMLFormatOrders_Invent`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_Invent` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter super class for Inventory orders. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | Không khai báo method trực tiếp; dùng method kế thừa/runtime framework. |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatOrders` (ngoài model) |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | Gọi qua base/framework/provider hiện hữu; không có method trực tiếp để minh họa. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_InventCount`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_InventCount` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for inventory counting. |
| 3 | Fields quan trọng | `inventJournalTable` (`InventJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrders_Invent`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobXMLFormatOrders_Invent` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrders_InventCount x = new MobXMLFormatOrders_InventCount(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_InventCountTag`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_InventCountTag` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for Tag counting. |
| 3 | Fields quan trọng | `inventJournalTable` (`InventJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrders_Invent`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobXMLFormatOrders_Invent` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrders_InventCountTag x = new MobXMLFormatOrders_InventCountTag(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_ItemRequirement`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_ItemRequirement` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for picking sales orders. |
| 3 | Fields quan trọng | `salesTable` (`SalesTable`) — state `salesTable`; buffer bản ghi bảng (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrders_Pick`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobXMLFormatOrders_Pick` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrders_ItemRequirement x = new MobXMLFormatOrders_ItemRequirement(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_PackWMS`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_PackWMS` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for pick WMS orders. |
| 3 | Fields quan trọng | `wMSPickingRoute` (`WMSPickingRoute`) — route/đường xử lý; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrders_Pick`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobOrder`, `MobXMLFormatOrders_Pick` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrders_PackWMS x = new MobXMLFormatOrders_PackWMS(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_Pick`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_Pick` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter super class for picking orders. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | Không khai báo method trực tiếp; dùng method kế thừa/runtime framework. |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatOrders` (ngoài model) |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | Gọi qua base/framework/provider hiện hữu; không có method trực tiếp để minh họa. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_PickProd`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_PickProd` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for picking production orders. |
| 3 | Fields quan trọng | `prodJournalTable` (`ProdJournalTable`) — journal; buffer bản ghi bảng (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrders_Pick`; Source references (không tự khẳng định runtime call): `MobXMLFormatOrders_Pick` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrders_PickProd x = new MobXMLFormatOrders_PickProd(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_PickProdInCart`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_PickProdInCart` |
| 2 | Mục đích | Suy luận: định dạng XML cho order. |
| 3 | Fields quan trọng | `line` (`ProdJournalBOM`) — state `line`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`journal` (`ProdJournalTable`) — journal; buffer bản ghi bảng (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatOrders` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocUnplannedCartMove`, `MobHelper`, `MobInventDimHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrders_PickProdInCart x = new MobXMLFormatOrders_PickProdInCart(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_PickSales`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_PickSales` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for picking sales orders. |
| 3 | Fields quan trọng | `salesTable` (`SalesTable`) — state `salesTable`; buffer bản ghi bảng (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrders_Pick`; Source references (không tự khẳng định runtime call): `MobXMLFormatOrders_Pick` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrders_PickSales x = new MobXMLFormatOrders_PickSales(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_PickTransfer`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_PickTransfer` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for picking transfer orders. |
| 3 | Fields quan trọng | `inventTransferTable` (`InventTransferTable`) — state `inventTransferTable`; buffer bản ghi bảng (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrders_Pick`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobXMLFormatOrders_Pick` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrders_PickTransfer x = new MobXMLFormatOrders_PickTransfer(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_PickWMS`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_PickWMS` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for pick WMS orders. |
| 3 | Fields quan trọng | `wMSPickingRoute` (`WMSPickingRoute`) — route/đường xử lý; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrders_Pick`; Source references (không tự khẳng định runtime call): `MobDocPickOrder`, `MobOrder`, `MobXMLFormatOrders_Pick` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrders_PickWMS x = new MobXMLFormatOrders_PickWMS(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_PickWMSInCart`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_PickWMSInCart` |
| 2 | Mục đích | Suy luận: định dạng XML cho order. |
| 3 | Fields quan trọng | `orderTrans` (`WMSOrderTrans`) — dữ liệu đơn hàng; buffer transaction (suy luận từ tên/kiểu)<br>`wMSPickingRoute` (`WMSPickingRoute`) — route/đường xử lý; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`cartID` (`MobCartID`) — cart; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatOrders` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants`, `MobDocUnplannedCartMove`, `MobHelper`, `MobInventDimHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrders_PickWMSInCart x = new MobXMLFormatOrders_PickWMSInCart(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_PlannedMove`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_PlannedMove` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for inventory counting. |
| 3 | Fields quan trọng | `inventJournalTable` (`InventJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatOrders` (ngoài model) |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrders_PlannedMove x = new MobXMLFormatOrders_PlannedMove(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_Receive`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_Receive` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter super class for receive orders. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | Không khai báo method trực tiếp; dùng method kế thừa/runtime framework. |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatOrders` (ngoài model) |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | Gọi qua base/framework/provider hiện hữu; không có method trực tiếp để minh họa. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_ReceiveArrival`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_ReceiveArrival` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for item Arrival orders. |
| 3 | Fields quan trọng | `wMSJournalTable` (`WMSJournalTable`) — journal; buffer header journal (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrders_Receive`; Source references (không tự khẳng định runtime call): `MobXMLFormatOrders_Receive` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrders_ReceiveArrival x = new MobXMLFormatOrders_ReceiveArrival(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_ReceiveLandedCost`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_ReceiveLandedCost` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for landed cost voyages orders. |
| 3 | Fields quan trọng | `itmTable` (`ITMTable`) — state `itmTable`; buffer bản ghi bảng (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrders_Receive`; Source references (không tự khẳng định runtime call): `MobOrder`, `MobXMLFormatOrders_Receive` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrders_ReceiveLandedCost x = new MobXMLFormatOrders_ReceiveLandedCost(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_ReceivePurch`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_ReceivePurch` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for purchase orders. |
| 3 | Fields quan trọng | `purchTable` (`PurchTable`) — buffer đơn mua hàng; buffer đơn mua hàng (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrders_Receive`; Source references (không tự khẳng định runtime call): `MobXMLFormatOrders_Receive` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrders_ReceivePurch x = new MobXMLFormatOrders_ReceivePurch(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_ReceiveTransfer`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_ReceiveTransfer` |
| 2 | Mục đích | XML summary gốc (English): XML Formatter class for Receive Transfer orders. |
| 3 | Fields quan trọng | `inventTransferTable` (`InventTransferTable`) — state `inventTransferTable`; buffer bản ghi bảng (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `MobXMLFormatOrders_Receive`; Source references (không tự khẳng định runtime call): `MobConstants`, `MobXMLFormatOrders_Receive` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrders_ReceiveTransfer x = new MobXMLFormatOrders_ReceiveTransfer(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatOrders_Totes`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatOrders_Totes` |
| 2 | Mục đích | Suy luận: định dạng XML cho order. |
| 3 | Fields quan trọng | `table` (`MobToteTable`) — state `table`; buffer bản ghi bảng (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `setValues` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Kế thừa `TFMXMLFormatOrders` (ngoài model); Source references (không tự khẳng định runtime call): `MobHelper` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatOrders_Totes x = new MobXMLFormatOrders_Totes(); x.setValues(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `MobXMLFormatSearch`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `MobXMLFormatSearch` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `appendToXML` — xem body/call site để xác định hành vi<br>`setValues` — ghi/cập nhật state hoặc dữ liệu<br>`setXML` — ghi/cập nhật state hoặc dữ liệu<br>`convertFieldsToMap` — xem body/call site để xác định hành vi<br>… 2 method khác |
| 5 | Quan hệ | Kế thừa `TFMXmlFormat` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants` |
| 6 | Luồng thực tế | Input: request/record/context theo signature → xử lý: method format/generate → output: XML hoặc dữ liệu tra cứu; luồng này suy luận từ tên/signature. |
| 7 | Ví dụ | `MobXMLFormatSearch x = new MobXMLFormatSearch(); x.appendToXML(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát schema/version, null/encoding, dữ liệu nhạy cảm và lỗi tích hợp; xác nhận serialization/API contract. |

### `TFMDataSourceBlockOrderLineItemSetupMob_extension`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `TFMDataSourceBlockOrderLineItemSetupMob_extension` |
| 2 | Mục đích | Suy luận: extension/event handler. |
| 3 | Fields quan trọng | `useFEFOParameter` (`boolean`) — cờ/điều kiện `useFEFOParameter`; giá trị cờ bật/tắt (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `AddFields` — ghi/cập nhật state hoặc dữ liệu<br>… 1 method khác |
| 5 | Quan hệ | Target theo attribute: `ExtensionOf: TFMDataSourceBlockOrderLineItemSetup` |
| 6 | Luồng thực tế | Input: event/CoC/platform call → xử lý: hook/handler trong class → output: thay đổi state/side effect của platform; chi tiết theo method body/attribute. |
| 7 | Ví dụ | Framework/event dispatch gọi class; không khởi tạo trực tiếp. |
| 8 | Lưu ý/rủi ro | Runtime hook: không instantiate; xác nhận event/target, thứ tự, điều kiện gọi và base/next behavior. |

### `TFMDataSourceBlockValuesOverride_batchorderLines`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `TFMDataSourceBlockValuesOverride_batchorderLines` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `hasModifications` — xem body/call site để xác định hành vi<br>`getClassName` — đọc/tra cứu dữ liệu<br>`modifyValuesBeforeDelta` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Kế thừa `TFMDataSourceBlockValuesOverride` (ngoài model) |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `TFMDataSourceBlockValuesOverride_batchorderLines x = new TFMDataSourceBlockValuesOverride_batchorderLines(); x.hasModifications(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `TFMDataSourceBlockValuesOverride_pickLines`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `TFMDataSourceBlockValuesOverride_pickLines` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `hasModifications` — xem body/call site để xác định hành vi<br>`getClassName` — đọc/tra cứu dữ liệu<br>`modifyValuesBeforeDelta` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Kế thừa `TFMDataSourceBlockValuesOverride` (ngoài model) |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `TFMDataSourceBlockValuesOverride_pickLines x = new TFMDataSourceBlockValuesOverride_pickLines(); x.hasModifications(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `TFMDataSourceBlockValuesOverride_receiveLines`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `TFMDataSourceBlockValuesOverride_receiveLines` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `hasModifications` — xem body/call site để xác định hành vi<br>`getClassName` — đọc/tra cứu dữ liệu<br>`modifyValuesBeforeDelta` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Kế thừa `TFMDataSourceBlockValuesOverride` (ngoài model); Source references (không tự khẳng định runtime call): `MobConstants` |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `TFMDataSourceBlockValuesOverride_receiveLines x = new TFMDataSourceBlockValuesOverride_receiveLines(); x.hasModifications(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `TFMDataSourceBlockValuesOverride_UnplannedCartMove`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `TFMDataSourceBlockValuesOverride_UnplannedCartMove` |
| 2 | Mục đích | Suy luận từ tên/base/methods; xác nhận qua caller/body. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `hasModifications` — xem body/call site để xác định hành vi<br>`getClassName` — đọc/tra cứu dữ liệu<br>`modifyValuesBeforeDelta` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Kế thừa `TFMDataSourceBlockValuesOverride` (ngoài model) |
| 6 | Luồng thực tế | Input: order/request/scanned value theo signature → xử lý: method của subtype/helper → output: records, response hoặc posting side effect; xác nhận theo từng caller. |
| 7 | Ví dụ | `TFMDataSourceBlockValuesOverride_UnplannedCartMove x = new TFMDataSourceBlockValuesOverride_UnplannedCartMove(); x.hasModifications(<args>)`; sơ đồ, kiểm tra constructor/access trước khi dùng. |
| 8 | Lưu ý/rủi ro | Rà soát inventory dimensions, reservation, transaction boundary, warehouse state và retry/idempotency. |

### `TFMDocumentHandler_mob_extension`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `TFMDocumentHandler_mob_extension` |
| 2 | Mục đích | Suy luận: extension/event handler. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `process` — xem body/call site để xác định hành vi<br>`getCollectorMap` — đọc/tra cứu dữ liệu<br>`addToCollectors` — ghi/cập nhật state hoặc dữ liệu |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: event/CoC/platform call → xử lý: hook/handler trong class → output: thay đổi state/side effect của platform; chi tiết theo method body/attribute. |
| 7 | Ví dụ | Framework/event dispatch gọi class; không khởi tạo trực tiếp. |
| 8 | Lưu ý/rủi ro | Runtime hook: không instantiate; xác nhận event/target, thứ tự, điều kiện gọi và base/next behavior. |

### `TFMParameters_TFMobile_Extension`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `TFMParameters_TFMobile_Extension` |
| 2 | Mục đích | XML summary gốc (English): /// |
| 3 | Fields quan trọng | `ret` (`int`) — state `ret`; giá trị số nguyên (suy luận từ tên/kiểu)<br>`ret` (`return`) — state `ret`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`inventLocationQueryBuilder` (`QueryBuildDataSource`) — query; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | Không khai báo method trực tiếp; dùng method kế thừa/runtime framework. |
| 5 | Quan hệ | Target theo attribute: `ExtensionOf: TFMParameters` |
| 6 | Luồng thực tế | Input: event/CoC/platform call → xử lý: hook/handler trong class → output: thay đổi state/side effect của platform; chi tiết theo method body/attribute. |
| 7 | Ví dụ | Framework/event dispatch gọi class; không khởi tạo trực tiếp. |
| 8 | Lưu ý/rủi ro | Runtime hook: không instantiate; xác nhận event/target, thứ tự, điều kiện gọi và base/next behavior. |

### `TFMPostAdhocRegistration_mob_extension`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `TFMPostAdhocRegistration_mob_extension` |
| 2 | Mục đích | Suy luận: extension/event handler. |
| 3 | Fields quan trọng | `method` (`DictMethod`) — state `method`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu)<br>`docTypeAttribute` (`TFMDocumentTypeAttribute`) — state `docTypeAttribute`; giá trị/buffer theo EDT hoặc class type (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | Không khai báo method trực tiếp; dùng method kế thừa/runtime framework. |
| 5 | Quan hệ | Không thấy kế thừa/composition/reference trực tiếp tới class khác trong model. |
| 6 | Luồng thực tế | Input: event/CoC/platform call → xử lý: hook/handler trong class → output: thay đổi state/side effect của platform; chi tiết theo method body/attribute. |
| 7 | Ví dụ | Framework/event dispatch gọi class; không khởi tạo trực tiếp. |
| 8 | Lưu ý/rủi ro | Runtime hook: không instantiate; xác nhận event/target, thứ tự, điều kiện gọi và base/next behavior. |

### `WMSLocation_Mob_Extension`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `WMSLocation_Mob_Extension` |
| 2 | Mục đích | Suy luận: extension/event handler. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `whsLocationIsLPControlled` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Source references (không tự khẳng định runtime call): `MobDocLicensePlateOverview`; Target theo attribute: `ExtensionOf: WMSLocation` |
| 6 | Luồng thực tế | Input: event/CoC/platform call → xử lý: hook/handler trong class → output: thay đổi state/side effect của platform; chi tiết theo method body/attribute. |
| 7 | Ví dụ | Framework/event dispatch gọi class; không khởi tạo trực tiếp. |
| 8 | Lưu ý/rủi ro | Runtime hook: không instantiate; xác nhận event/target, thứ tự, điều kiện gọi và base/next behavior. |

### `WmsOrderTransType_Mob_Class_Extension`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `WmsOrderTransType_Mob_Class_Extension` |
| 2 | Mục đích | XML summary gốc (English): Extension of the WmsOrderTransType class, in order to utilize protected business logic in the class. |
| 3 | Fields quan trọng | Không có field instance trực tiếp; field kế thừa không liệt kê. |
| 4 | Methods chính/khi dùng | `MobCheckFinishPickingLine` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Target theo attribute: `ExtensionOf: WmsOrderTransType` |
| 6 | Luồng thực tế | Input: event/CoC/platform call → xử lý: hook/handler trong class → output: thay đổi state/side effect của platform; chi tiết theo method body/attribute. |
| 7 | Ví dụ | Framework/event dispatch gọi class; không khởi tạo trực tiếp. |
| 8 | Lưu ý/rủi ro | Runtime hook: không instantiate; xác nhận event/target, thứ tự, điều kiện gọi và base/next behavior. |

### `WmsOrderTransType_Output_OrderPick_MobClass_Extension`

| # | Hạng mục | Phân tích |
|---:|---|---|
| 1 | Tên class | `WmsOrderTransType_Output_OrderPick_MobClass_Extension` |
| 2 | Mục đích | XML summary gốc (English): Extension of the WmsOrderTransType_Output_OrderPick class, in order to utilize protected business logic in the class. |
| 3 | Fields quan trọng | `extraWmsOrderTrans` (`WMSOrderTrans`) — dữ liệu đơn hàng; buffer transaction (suy luận từ tên/kiểu) |
| 4 | Methods chính/khi dùng | `MobCheckFinishPickingLine` — xem body/call site để xác định hành vi<br>`getExtraSplittedLine` — đọc/tra cứu dữ liệu<br>`splitWmsOrderTrans` — xem body/call site để xác định hành vi |
| 5 | Quan hệ | Target theo attribute: `ExtensionOf: WmsOrderTransType_Output_OrderPick` |
| 6 | Luồng thực tế | Input: event/CoC/platform call → xử lý: hook/handler trong class → output: thay đổi state/side effect của platform; chi tiết theo method body/attribute. |
| 7 | Ví dụ | Framework/event dispatch gọi class; không khởi tạo trực tiếp. |
| 8 | Lưu ý/rủi ro | Runtime hook: không instantiate; xác nhận event/target, thứ tự, điều kiện gọi và base/next behavior. |
