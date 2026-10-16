# API kết nối Mobile và Dynamics 365 F&O

## Phạm vi và cách đọc

Tài liệu này tổng hợp các **hợp đồng và điểm xử lý logic** giữa Mobile WMS và F&O được nhận diện trong ba tài liệu nguồn. Tên class/method là API ở tầng ứng dụng X++/Tasklet; chúng không mặc nhiên là URL REST công khai.

Các tài liệu nguồn mô tả luồng XML/request/response và class xử lý phía server, nhưng **không xác định URL/HTTP verb, cấu hình authentication, header, schema XML đầy đủ hoặc chữ ký tham số của mọi method**. Do đó, ví dụ ghi là “sơ đồ” chỉ minh họa luồng; phải kiểm tra signature và cấu hình runtime trước khi gọi thật. Phần field tập trung vào field được nguồn liệt kê và giải thích ý nghĩa theo vai trò/tên.

Luồng tổng quát:

```text
Mobile gửi request/XML
  → TFMDocumentConnector
  → TFMXMLDeserializer tạo request có kiểu
  → TFMInputHandler / TFMProcessHandler dispatch
  → TFMProcess và logic block MobileWMS/TF Mobile xử lý nghiệp vụ F&O
  → TFMResponseElement / XML formatter tạo response
  → Mobile nhận XML/response
```

## 1. Tiếp nhận document/request — `TFMDocumentConnector`

1. **Tên class:** `TFMDocumentConnector` (TaskletPlatform).
2. **Tên API:** `submit` là điểm gửi/xử lý document được liệt kê; các method hỗ trợ gồm `cleanEmptyXmlTags`, `removeLabelTags`, `createReturnXml`, `Add2ReturnXml`, `logDocumentQueue`, `updateSessionLink`.
3. **Mục đích/chức năng chính:** Điểm kết nối/điều phối document ở phía Tasklet. Các dependency cho thấy class làm việc với request, XML deserializer, input handler, process handler và document type provider. Nguồn không mô tả đây là HTTP controller hay cung cấp URL public.
4. **Thuộc tính quan trọng:** Không có field instance trực tiếp được liệt kê trong tài liệu nguồn. Request/XML được chuyển tiếp qua các component phụ thuộc.
5. **Method chính và khi nào dùng:**
   - `submit` — dùng ở luồng gửi document từ client vào xử lý server; signature và return type cần kiểm tra trong source/runtime.
   - `cleanEmptyXmlTags`, `removeLabelTags` — chuẩn hóa/biến đổi XML trong pipeline khi được gọi.
   - `createReturnXml`, `Add2ReturnXml` — hỗ trợ dựng XML trả về.
   - `logDocumentQueue`, `updateSessionLink` — log/cập nhật thông tin queue hoặc session theo luồng tương ứng.
6. **Luồng sử dụng thực tế (input → xử lý → output):** XML/request từ Mobile → connector tiếp nhận, làm sạch hoặc bổ sung XML, chuyển đến parser/handler phù hợp → kết quả document/response XML gửi về client; chi tiết điều phối phụ thuộc implementation.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không đảm bảo compile-ready: `connector.submit(<mobileRequestOrXml>)` → nhận/ghi XML trả về theo contract của caller. Không tự khởi tạo connector từ Mobile nếu chưa xác định runtime entry point.
8. **Lưu ý/rủi ro thường gặp:** Không suy diễn URL hoặc authentication từ tên class. Giữ nguyên XML contract, message/session context và encoding; xác minh cách xử lý retry/duplicate trước khi gửi lại request.

## 2. Chuyển XML thành request có kiểu — `TFMXMLDeserializer`

1. **Tên class:** `TFMXMLDeserializer` (TaskletPlatform).
2. **Tên API:** `DeserializeRequestString`, `DeserializeRequest`, `getXmlDocument`, `convertRequestClass`, `convertRequestClassDirect`.
3. **Mục đích/chức năng chính:** Đọc XML/request từ Mobile và chuyển thành `TFMRequestElement` hoặc subtype phù hợp để phần dispatch xử lý.
4. **Thuộc tính quan trọng:** Không có field instance trực tiếp được liệt kê.
5. **Method chính và khi nào dùng:**
   - `DeserializeRequestString` — dùng khi đầu vào là request dạng chuỗi.
   - `DeserializeRequest` — dùng khi đầu vào đã ở dạng XML/request object theo signature thực tế.
   - `getXmlDocument` — lấy/chuẩn bị XML document.
   - `convertRequestClass` / `convertRequestClassDirect` — chuyển request sang class/type tương ứng trong pipeline.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Request XML/string → parse và xác định document/request type → tạo typed request object → `TFMInputHandler` hoặc dispatcher tiếp tục xử lý.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ: `TFMXMLDeserializer` → `DeserializeRequestString(<xml>)` → `TFMRequestElement` subtype. Tài liệu nguồn không cung cấp constructor/đầy đủ tham số, nên cần tra signature trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** XML sai cấu trúc, namespace, encoding, escaping, node optional hoặc version không tương thích có thể làm parse/dispatch thất bại. Không tự đổi tên node/field mà không đồng bộ client.

## 3. Hợp đồng request gốc — `TFMRequestElement`, `TFMRequestApplication`, `MobRequestApplication`

1. **Tên class:** `TFMRequestElement` (TaskletPlatform); `TFMRequestApplication` (TaskletPlatform); `MobRequestApplication` (TFMobile).
2. **Tên API:** Hợp đồng request dùng trong quá trình deserialize/dispatch. `TFMRequestApplication` kế thừa request base; `MobRequestApplication` kế thừa `TFMRequestApplication`. Hai application class không khai báo method riêng theo tài liệu nguồn.
3. **Mục đích/chức năng chính:** `TFMRequestElement` là DTO request abstract dùng làm hợp đồng chung. Application subtype đánh dấu/đại diện request của application Mobile trong pipeline, không phải một API độc lập có method gọi trực tiếp.
4. **Thuộc tính quan trọng (ý nghĩa từng field):** `TFMRequestElement` liệt kê `documentType` (loại thao tác/document để dispatch), `contentType` (loại nội dung), `fields` (các field request), `subNodes` (node con), `deviceId` (thiết bị gửi), `messageId` (mã message), `inventDim` (dimension tồn kho), `itemId` (mặt hàng), `logicContext` (ngữ cảnh logic), `origXML` (XML gốc). Các class application không có field trực tiếp được liệt kê.
5. **Method chính và khi nào dùng:** `getSubRequest`, `getFieldValue`, `addField`, `convertToOtherRequestType`, `makeLogEntry` trên request base dùng để đọc/cập nhật nội dung, truy cập sub-request/field, đổi subtype hoặc tạo log entry. Không có method riêng được liệt kê trên `TFMRequestApplication`/`MobRequestApplication`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** XML được deserialize → tạo subtype request với `documentType`, `deviceId`, `messageId` và dữ liệu nghiệp vụ → handler/process đọc field và context → response tương ứng. `origXML` cho phép giữ tham chiếu đến request gốc theo contract.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ: `MobRequestApplication` được tạo/dispatch bởi framework từ XML; không `new` trực tiếp để gọi API. Với request cụ thể, dùng subtype đã đăng ký và truy cập field qua method `parm...`/API phù hợp.
8. **Lưu ý/rủi ro thường gặp:** `TFMRequestElement` là abstract, không khởi tạo trực tiếp. `MobRequestApplication` không phải bằng chứng về endpoint network. Phải giữ đúng `documentType`, message/device context, subtype và schema client-server.

## 4. Thực thi request — `TFMInputHandler`

1. **Tên class:** `TFMInputHandler` (TaskletPlatform).
2. **Tên API:** `setRequest`, `setRequestXml`, `parmMessageId`, `preProcess`, `run`, `getResponseElement`, `getResultTable`.
3. **Mục đích/chức năng chính:** Base pipeline xử lý đầu vào: nhận request object/XML, chạy bước chuẩn bị/xử lý, rồi cung cấp response/result cho caller. Các handler chuyên biệt kế thừa hoặc được chọn bởi framework.
4. **Thuộc tính quan trọng (ý nghĩa từng field):** `request` (typed request), `requestXml` (XML đầu vào), `messageId` (mã message), `responseElement` (response), `resultXml` (XML kết quả).
5. **Method chính và khi nào dùng:** `setRequest`/`setRequestXml` — gán đầu vào; `parmMessageId` — gắn/lấy message ID; `preProcess` — chạy bước trước xử lý; `run` — thực thi handler; `getResponseElement` — lấy kết quả response; `getResultTable` — lấy bảng kết quả khi handler hỗ trợ.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Typed request/XML + message ID → handler preprocess và `run()` → response element, result XML hoặc result table → connector/dispatcher trả kết quả.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo framework: tạo implementation handler phù hợp → set request/XML và message ID → `run()` → `getResponseElement()`. Không khởi tạo base/abstract handler trực tiếp.
8. **Lưu ý/rủi ro thường gặp:** Không giữ state instance qua các request nếu lifecycle tạo handler theo từng lượt. Xác nhận handler cụ thể, transaction boundary, exception path và đảm bảo response gắn đúng message/request.

## 5. Dispatch process nghiệp vụ — `TFMProcessHandler` và `TFMProcess`

1. **Tên class:** `TFMProcessHandler`, `TFMProcess` (TaskletPlatform); các process chuyên biệt như `MwmsProcessAddCountLine`, `MwmsProcessCancelPickLine`, `MwmsProcessCreateQuarantineOrder` (MobileWMS).
2. **Tên API:** `TFMProcessHandler.run`; `TFMProcess.runProcess`, `getPrePostRegistrationCollectors`, `getRegistrationConfigurationResponse`. Mỗi process MobileWMS được chọn theo process name/cấu hình runtime.
3. **Mục đích/chức năng chính:** Dispatch request tới process nghiệp vụ; process điều phối các logic block, collector, bước tiếp theo, cấu hình nhập liệu hoặc post dữ liệu vào F&O.
4. **Thuộc tính quan trọng (ý nghĩa từng field):** `TFMProcess`: `processName` (định danh process), `version` (phiên bản), `blockCollection` (các logic block/luồng), `combinedFields` (cấu hình field ghép), `autoSave` (cờ autosave), `cancelBehaviour` (hành vi hủy), `isInitialized`/`isLocked` (trạng thái). `TFMProcessHandler` không có field trực tiếp được liệt kê.
5. **Method chính và khi nào dùng:** `TFMProcessHandler.run()` dispatch/thực thi process; `TFMProcess.runProcess(request)` chạy theo request/document type; `getPrePostRegistrationCollectors()` và `getRegistrationConfigurationResponse()` lấy collector/cấu hình cần cho màn hình/step. Constructor/process-specific setup nối logic block.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Request chứa document type và dữ liệu nhập → chọn process → logic block kiểm tra/tra cứu và chuẩn bị record/dimension → process trả cấu hình/next-step hoặc post → response/result nghiệp vụ. Ví dụ MobileWMS: item/count → counting-line block → counting journal line; request hủy pick → cancel block → trạng thái/response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Theo pattern được tài liệu nguồn minh họa: `TFMProcess p = TFMProcess::Construct(processName); TFMResponseElement r = p.runProcess(request);`. Trong hệ thống thực tế process nên được framework/provider khởi tạo theo registration/cấu hình; ví dụ không thay thế wiring runtime.
8. **Lưu ý/rủi ro thường gặp:** Document type/process name phải khớp registration; kiểm tra version, validation, company/warehouse/dimensions và transaction. Retry hoặc gửi lặp có thể tạo tác động nghiệp vụ lặp nếu process không bảo vệ idempotency.

## 6. Response về Mobile — `TFMResponseElement` và `TFMPostResponseData`

1. **Tên class:** `TFMResponseElement`, `TFMPostResponseData` (TaskletPlatform).
2. **Tên API:** `getXML`, `appendToXML`, `addCommandResponse`, `parmInnerXML`, `parmOriginalRequest`; trên `TFMPostResponseData` có `Construct`, `addCollector`, `getCollectors`, `addPrintOutput`, `mergePrintOutput`.
3. **Mục đích/chức năng chính:** Đóng gói kết quả handler/process thành response XML cho thiết bị; `TFMPostResponseData` bổ sung collectors/print output sau bước post.
4. **Thuộc tính quan trọng (ý nghĩa từng field):** `TFMResponseElement`: `responseText` (text hiển thị), `innerXML` (nội dung response), `originalRequest` (request nguồn), `deviceId` (thiết bị), `pageId` (page), `commands` (command responses). `TFMPostResponseData`: `printOutput` (dữ liệu in), `regCols` (registration collectors), `fields` (dữ liệu field bổ sung).
5. **Method chính và khi nào dùng:** `appendToXML`/`getXML` serialize response; `addCommandResponse` gắn command; `parmInnerXML`/`parmOriginalRequest` giữ nội dung và ngữ cảnh request. `addCollector`/`getCollectors` đưa collector vào/ra post response; `addPrintOutput`/`mergePrintOutput` quản lý dữ liệu in.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Kết quả xử lý/post + collector/print data → populate response và command → serialize XML → trả về đúng device/page/request.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ: `TFMPostResponseData::Construct(<args>)` → thêm collector/print output → framework gắn vào `TFMResponseElement` → `getXML()` trả XML. Kiểm tra signature factory thực tế.
8. **Lưu ý/rủi ro thường gặp:** Phải giữ device/page/message/original-request context và đúng XML schema của client. Đừng xem response trả về là bằng chứng post đã thành công nếu flow có lỗi/rollback; kiểm tra status và exception path.

## 7. Order nghiệp vụ TF Mobile — `MobOrder` và order type

1. **Tên class:** `MobOrder` (abstract) cùng subtype order cụ thể trong TFMobile, ví dụ `MobReceiveOrderType`, `MobReceiveOrderTypeTransfer`.
2. **Tên API:** `constructFromBackendID(backendId)`, `constructFromTableName(tableName, orderType)` để chọn order handler; các method tiêu biểu trên order gồm `getHeaderRecords`, `getLineRecords`, `postRequest`, `enrichResponseXML`. `MobReceiveOrderType` có `OrderType`, `generateResponse`, `processScannedValue`.
3. **Mục đích/chức năng chính:** Tạo dữ liệu danh sách/header/line và xử lý thao tác order Mobile theo loại nghiệp vụ (nhận hàng, pick, transfer, inventory/count và các biến thể). `MobOrder` là abstract parent; nghiệp vụ thật nằm ở subtype.
4. **Thuộc tính quan trọng (ý nghĩa từng field):** `messageID` (mã message), `resultXML` (XML kết quả), `responseData` (dữ liệu post response), `tblName` (bảng/backend record), `orderId` (mã order), `orderType` (loại order), `skipRouteActivation` (cờ bỏ qua route activation). Subtype có thể giữ buffer order/table và order set riêng.
5. **Method chính và khi nào dùng:** Factory `constructFromBackendID`/`constructFromTableName` chọn subtype; `getHeaderRecords`/`getLineRecords` dựng dữ liệu hiển thị; `processScannedValue` xử lý scan; `postRequest` thực hiện bước post order; `generateResponse`/`enrichResponseXML` tạo hoặc bổ sung response theo subtype.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Backend ID/table + order type hoặc request/scan → factory chọn subtype → đọc header/lines, xử lý scan và kiểm tra theo nghiệp vụ → post qua flow tương ứng → XML/response hoặc side effect trong F&O.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Theo pattern quick-start trong tài liệu: `MobOrder order = MobOrder::constructFromBackendID(backendId);` rồi gọi method trên subtype phù hợp, ví dụ `getHeaderRecords(...)`. `MobOrder` abstract nên không `new` trực tiếp; placeholder cần thay theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Chọn đúng backend ID, table và order type; kiểm tra reservation, warehouse/inventory dimensions, trạng thái document và tính lặp an toàn trước khi post. Method/caller có thể khác theo subtype.

## 8. XML danh sách order/line — `MobXMLFormatOrders_*` và `MobXMLFormatOrderLines_*`

1. **Tên class:** Họ formatter `MobXMLFormatOrders_*` và `MobXMLFormatOrderLines_*` trong TFMobile; kế thừa base formatter Tasklet (`TFMXMLFormatOrders`/`TFMXMLFormatOrderLines`).
2. **Tên API:** `setValues` trên formatter cụ thể; một số subtype expose method bổ sung như `setInventDim`. Các class tiêu biểu gồm `MobXMLFormatOrders_Invent`, `MobXMLFormatOrders_Pick`, `MobXMLFormatOrders_Receive`, `MobXMLFormatOrders_ReceiveTransfer`, `MobXMLFormatOrderLines_Invent`, `MobXMLFormatOrderLines_InventCount`, `MobXMLFormatOrderLines_Pick`, `MobXMLFormatOrderLines_ReceiveTransfer`.
3. **Mục đích/chức năng chính:** Chuyển record/order/line F&O thành XML phù hợp để hiển thị trên Mobile. Mỗi subtype formatter ánh xạ loại order hoặc line cụ thể; nhóm inventory, pick, receive, count, transfer, production có formatter riêng.
4. **Thuộc tính quan trọng (ý nghĩa từng field):** Khác nhau theo subtype; ví dụ `MobXMLFormatOrders_BatchOrders` giữ `prodTable` (buffer lệnh sản xuất), `MobXMLFormatOrderLines_Invent` giữ `JournalID`, `MobXMLFormatOrderLines_InventCount` giữ `inventJournalTrans`, `MobXMLFormatOrderLines_ReceiveTransfer` giữ `inventTransferLine`. Field cụ thể bổ sung dữ liệu nguồn để format; field kế thừa có thể không hiện trong inventory.
5. **Method chính và khi nào dùng:** `setValues` cung cấp record/context đầu vào formatter; dùng formatter đúng loại order/line khi tạo response XML. Dùng method inherited để lấy/generate XML theo pipeline, nhưng tên/signature cụ thể cần xem base class/runtime.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Record F&O hoặc order/line subtype → `setValues`/formatter chuyên biệt → chuyển field/dimension sang cấu trúc XML Mobile → danh sách/header/line trong response.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ từ nguồn: `MobXMLFormatOrderLines_InventCount x = new MobXMLFormatOrderLines_InventCount(); x.setValues(<record/context>)` → formatter tạo dữ liệu XML trong pipeline. Tham số trong ngoặc là placeholder, không đảm bảo signature compile-ready.
8. **Lưu ý/rủi ro thường gặp:** Không dùng nhầm formatter giữa order type; duy trì tương thích schema/client version, XML encoding và các inventory dimension được hiển thị. Không kết luận formatter nào được gọi chỉ từ tên/reference; cần kiểm tra caller.

## 9. Cung cấp XML/workflow cho order-list page — `TFMService` / `TFMServiceProvider`

1. **Tên class:** `TFMService`, `TFMServiceProvider` (TaskletPlatform).
2. **Tên API:** `TFMService::Construct(orderListPage)`, `getXML`, `getWorkflow`; provider có `getServices`, `getAllServicesXML`.
3. **Mục đích/chức năng chính:** Adapter tạo XML/workflow từ page order list và provider tổng hợp các service/page tương ứng. Đây là cấu phần cấu hình/response XML của Tasklet, không phải bằng chứng về custom REST/SOAP service endpoint.
4. **Thuộc tính quan trọng (ý nghĩa từng field):** `TFMService.orderlistPage` (ngữ cảnh page order list). `TFMServiceProvider` không có field trực tiếp được liệt kê.
5. **Method chính và khi nào dùng:** `Construct` tạo adapter từ page; `getXML` lấy XML; `getWorkflow` lấy workflow của page. `getServices`/`getAllServicesXML` dùng để lấy/tổng hợp service XML từ provider.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Order-list page/configuration → `TFMService`/provider → XML và workflow → được dùng bởi pipeline/page Tasklet.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Theo pattern nguồn: `TFMService s = TFMService::Construct(orderListPage); Xml xml = s.getXML();`.
8. **Lưu ý/rủi ro thường gặp:** Page phải tương thích với `TFMPageOrderListConfiguration`. Không nhầm tên class `TFMService` với network service hoặc route public.

## 10. Ghi/post nghiệp vụ Mobile — `MobPostHelper`

1. **Tên class:** `MobPostHelper` (TFMobile).
2. **Tên API:** Các method được liệt kê gồm `inventJournalTransfer`, `inventJournalTransferHeaderCreate`, `inventJournalTransferLineCreate`, `postInventJournalTransfer` và các helper posting khác trong class.
3. **Mục đích/chức năng chính:** Cung cấp thao tác helper liên quan tạo/ghi journal và inventory từ luồng Mobile. Đây là API nghiệp vụ nội bộ X++ được handler/order/process gọi, không phải API network để Mobile gọi trực tiếp.
4. **Thuộc tính quan trọng:** Không có field instance trực tiếp được liệt kê.
5. **Method chính và khi nào dùng:** `inventJournalTransfer` điều phối thao tác transfer journal; `inventJournalTransferHeaderCreate`/`inventJournalTransferLineCreate` tạo header/line; `postInventJournalTransfer` thực hiện post journal. Chỉ dùng khi flow nghiệp vụ xác định đúng loại journal và validation.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Mobile gửi dữ liệu transfer → order/process kiểm tra và chuẩn hóa → helper tạo header/line journal → post journal → handler tạo response hoặc báo lỗi.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Pattern trong tài liệu nguồn: `MobPostHelper::inventJournalTransfer(<args>)`. `<args>` là placeholder; cần xem đúng overload, validation và caller trước khi tích hợp. Không gọi helper trực tiếp từ Mobile.
8. **Lưu ý/rủi ro thường gặp:** Xác minh transaction boundary, journal status, company/warehouse, inventory dimensions, reservation và retry/idempotency. Tránh bỏ qua validation/orchestration của order handler; không post trực tiếp chỉ dựa trên dữ liệu scan.

## Những điểm cần xác minh trước khi tích hợp

- URL/HTTP verb, authentication/OAuth, headers và cách publish endpoint: **không được xác định trong ba tài liệu nguồn**.
- XML schema đầy đủ, bắt buộc/tùy chọn của từng field, namespace và version tương thích: kiểm tra contract phía client/server trước khi thay đổi.
- Signature/visibility/return type đầy đủ của method: xem source AOT/caller/runtime configuration; các ví dụ có placeholder không phải bảo đảm compile-ready.
- Registration/configuration của document type, process name, order type, handler và formatter: phải khớp môi trường triển khai.
- Posting nghiệp vụ: xác minh validate, transaction, trạng thái record, company/warehouse context và xử lý request gửi lại.

## Tài liệu nguồn

- [MobileWMS.md](MobileWMS.md) — tổng quan process/logic block MobileWMS và các ví dụ `MwmsProcess*`.
- [TaskletPlatform.md](TaskletPlatform.md) — request, deserializer, handler, process, response và service/page XML.
- [TFMobile.md](TFMobile.md) — `MobRequestApplication`, `MobOrder`, XML formatter và `MobPostHelper`.
