# TaskletPlatform — tài liệu từng class

Phạm vi: đúng 504 class XML trong `Metadata/TaskletPlatform/TaskletPlatform/AxClass`. Fields, method names, kế thừa và references được trích từ source. Ý nghĩa fields được diễn giải theo tên; mục đích/flow/risk không được source/documentation chứng minh được đánh dấu là suy luận. Ví dụ dùng placeholder là sơ đồ, cần thay bằng đối số đúng signature.

Luồng chung: XML/device input → deserialize thành typed request → page/process/search/provider → collectors/logic blocks → response/XML hoặc posting. `TFMProcess.runProcess()` xử lý nhánh next-step, configuration hoặc post tùy document type.

### `Docuview_TFM_Extension`
1. **Tên class:** `Docuview_TFM_Extension`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (tfm_extension); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `DocuRef_OnWritten` — khi cần xem method body để xác định hành vi; `DocuRef_OnActivated` — khi cần xem method body để xác định hành vi; `setImage` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMMediaProvider`, `TFMHtmlViewerCtrl`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua DocuRef_OnWritten, DocuRef_OnActivated, setImage → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `Docuview_TFM_Extension instance = new Docuview_TFM_Extension(<args>);` rồi `instance.DocuRef_OnWritten(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `InfoTFM_Extension`
1. **Tên class:** `InfoTFM_Extension`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (extension); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `add` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua add → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `InfoTFM_Extension instance = new InfoTFM_Extension(<args>);` rồi `instance.add(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `SysListPanel_Extension`
1. **Tên class:** `SysListPanel_Extension`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (sys list panel_extension); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `build` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua build → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `SysListPanel_Extension instance = new SysListPanel_Extension(<args>);` rồi `instance.build(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `SysListPanelRelationTableCallback_Extension`
1. **Tên class:** `SysListPanelRelationTableCallback_Extension`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (sys list panel relation table callback_extension); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getUpdatedPositions` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua getUpdatedPositions → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `SysListPanelRelationTableCallback_Extension instance = new SysListPanelRelationTableCallback_Extension(<args>);` rồi `instance.getUpdatedPositions(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFM2DBarcodeGenerator`
1. **Tên class:** `TFM2DBarcodeGenerator`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (2 d barcode generator); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getQRCode` — khi cần lấy hoặc tra cứu; `showLoginUserNameBarcode` — khi cần xem method body để xác định hành vi; `showEndPointBarcode` — khi cần xem method body để xác định hành vi; `getEndPointJson` — khi cần lấy hoặc tra cứu; `getImage` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMImageHelper`, `TFMHtmlViewerCtrl`, `TFMGraphicsHelper`, `TFMService`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua getQRCode, showLoginUserNameBarcode, showEndPointBarcode → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFM2DBarcodeGenerator instance = new TFM2DBarcodeGenerator(<args>);` rồi `instance.getQRCode(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAbstractListRender`
1. **Tên class:** `TFMAbstractListRender`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (abstract list render); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `render` — khi cần xem method body để xác định hành vi; `renderList` — khi cần xem method body để xác định hành vi; `renderRows` — khi cần xem method body để xác định hành vi; `renderRow` — khi cần xem method body để xác định hành vi; `renderColumns` — khi cần xem method body để xác định hành vi; `renderColumn` — khi cần xem method body để xác định hành vi; `renderElements` — khi cần xem method body để xác định hành vi; `renderText` — khi cần xem method body để xác định hành vi; … còn 4 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMListVisualizationInterface`, `TFMListBase`, `TFMListConfiguration`, `TFMListRows`, `TFMListRow`, `TFMListColumns`, `TFMListColumn`, `TFMListElements`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua render, renderList, renderRows → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAbstractListRender instance = new TFMAbstractListRender(<args>);` rồi `instance.render(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAIResultChoicesContract`
1. **Tên class:** `TFMAIResultChoicesContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (ai result choices contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `message` (TFMAIResultMessageContract) — message
4. **Method chính và khi nào dùng:** `parmMessage` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMAIResultMessageContract`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmMessage → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAIResultChoicesContract instance = new TFMAIResultChoicesContract(<args>);` rồi `instance.parmMessage(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAIResultContract`
1. **Tên class:** `TFMAIResultContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (ai result contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `choices` (List) — choices
4. **Method chính và khi nào dùng:** `parmChoices` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMAIResultChoicesContract`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmChoices → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAIResultContract instance = new TFMAIResultContract(<args>);` rồi `instance.parmChoices(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAIResultMessageContract`
1. **Tên class:** `TFMAIResultMessageContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (ai result message contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `content` (TFMRegularExpression) — content
4. **Method chính và khi nào dùng:** `parmContent` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmContent → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAIResultMessageContract instance = new TFMAIResultMessageContract(<args>);` rồi `instance.parmContent(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsCompanyNameProperty`
1. **Tên class:** `TFMAppInsightsCompanyNameProperty`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (app insights company name property); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `newFromValue` — khi cần khởi tạo/xây dựng; `initialize` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysApplicationInsightsProperty`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua newFromValue, initialize → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsCompanyNameProperty instance = new TFMAppInsightsCompanyNameProperty(<args>);` rồi `instance.newFromValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsCompleteMSCountProperty`
1. **Tên class:** `TFMAppInsightsCompleteMSCountProperty`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (app insights complete ms count property); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `newFromValue` — khi cần khởi tạo/xây dựng; `initialize` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysApplicationInsightsProperty`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua newFromValue, initialize → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsCompleteMSCountProperty instance = new TFMAppInsightsCompleteMSCountProperty(<args>);` rồi `instance.newFromValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsContentSubjectProperty`
1. **Tên class:** `TFMAppInsightsContentSubjectProperty`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (app insights content subject property); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `newFromValue` — khi cần khởi tạo/xây dựng; `initialize` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysApplicationInsightsProperty`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua newFromValue, initialize → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsContentSubjectProperty instance = new TFMAppInsightsContentSubjectProperty(<args>);` rồi `instance.newFromValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsDeviceAppVersionProperty`
1. **Tên class:** `TFMAppInsightsDeviceAppVersionProperty`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (app insights device app version property); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `newFromValue` — khi cần khởi tạo/xây dựng; `initialize` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysApplicationInsightsProperty`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua newFromValue, initialize → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsDeviceAppVersionProperty instance = new TFMAppInsightsDeviceAppVersionProperty(<args>);` rồi `instance.newFromValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsDeviceIdProperty`
1. **Tên class:** `TFMAppInsightsDeviceIdProperty`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (app insights device id property); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `newFromValue` — khi cần khởi tạo/xây dựng; `initialize` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysApplicationInsightsProperty`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua newFromValue, initialize → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsDeviceIdProperty instance = new TFMAppInsightsDeviceIdProperty(<args>);` rồi `instance.newFromValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsDevicePlatformVersionProperty`
1. **Tên class:** `TFMAppInsightsDevicePlatformVersionProperty`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Form/UI (app insights device platform version property); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `newFromValue` — khi cần khởi tạo/xây dựng; `initialize` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysApplicationInsightsProperty`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input Args, record và control state (tham số của method public hoặc state của instance) → xử lý form/helper xử lý UI hoặc cấu hình qua newFromValue, initialize → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsDevicePlatformVersionProperty instance = new TFMAppInsightsDevicePlatformVersionProperty(<args>);` rồi `instance.newFromValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: caller context, form lifecycle, permissions và null buffers; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsDocQueueTelemetry`
1. **Tên class:** `TFMAppInsightsDocQueueTelemetry`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (app insights doc queue telemetry); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `DataContracts` (using) — dữ liệu contracts; `TraceTelemetry` (using) — trace telemetry; `EnvironmentFactory` (using) — environment factory; `traceTelemetry` (TraceTelemetry) — trace telemetry
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `newFromDocumentQueue` — khi cần khởi tạo/xây dựng; `addProperty` — khi cần ghi/cập nhật state; `traceTelemetryContract` — khi cần xem method body để xác định hành vi; `setMessage` — khi cần ghi/cập nhật state; `setSeverityLevel` — khi cần ghi/cập nhật state; `getSupportPropertiesObject` — khi cần lấy hoặc tra cứu; `addPropertyProductVersion` — khi cần ghi/cập nhật state; … còn 15 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysApplicationInsightsTelemetryContractBase`. Dependency trong source: `TFMHelper`, `TFMConstants`, `TFMAppInsightsProductVersionProperty`, `TFMAppInsightsPlatformVersionProperty`, `TFMAppInsightsMessageIdProperty`, `TFMAppInsightsDeviceIdProperty`, `TFMAppInsightsDocumentTypeIdProperty`, `TFMAppInsightsProcessMSCountProperty`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, newFromDocumentQueue, addProperty → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsDocQueueTelemetry instance = new TFMAppInsightsDocQueueTelemetry(<args>);` rồi `instance.newFromDocumentQueue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsDocumentSizeProperty`
1. **Tên class:** `TFMAppInsightsDocumentSizeProperty`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (app insights document size property); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `newFromValue` — khi cần khởi tạo/xây dựng; `initialize` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysApplicationInsightsProperty`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua newFromValue, initialize → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsDocumentSizeProperty instance = new TFMAppInsightsDocumentSizeProperty(<args>);` rồi `instance.newFromValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsDocumentTypeIdProperty`
1. **Tên class:** `TFMAppInsightsDocumentTypeIdProperty`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (app insights document type id property); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `newFromValue` — khi cần khởi tạo/xây dựng; `initialize` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysApplicationInsightsProperty`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua newFromValue, initialize → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsDocumentTypeIdProperty instance = new TFMAppInsightsDocumentTypeIdProperty(<args>);` rồi `instance.newFromValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsFeatureNameProperty`
1. **Tên class:** `TFMAppInsightsFeatureNameProperty`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (app insights feature name property); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `newFromValue` — khi cần khởi tạo/xây dựng; `initialize` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysApplicationInsightsProperty`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua newFromValue, initialize → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsFeatureNameProperty instance = new TFMAppInsightsFeatureNameProperty(<args>);` rồi `instance.newFromValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsGeneralProperty`
1. **Tên class:** `TFMAppInsightsGeneralProperty`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (app insights general property); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `newFromValue` — khi cần khởi tạo/xây dựng; `initialize` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysApplicationInsightsProperty`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua newFromValue, initialize → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsGeneralProperty instance = new TFMAppInsightsGeneralProperty(<args>);` rồi `instance.newFromValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsMessageIdProperty`
1. **Tên class:** `TFMAppInsightsMessageIdProperty`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (app insights message id property); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `newFromValue` — khi cần khởi tạo/xây dựng; `initialize` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysApplicationInsightsProperty`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua newFromValue, initialize → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsMessageIdProperty instance = new TFMAppInsightsMessageIdProperty(<args>);` rồi `instance.newFromValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsPlatformVersionProperty`
1. **Tên class:** `TFMAppInsightsPlatformVersionProperty`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Form/UI (app insights platform version property); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `newFromValue` — khi cần khởi tạo/xây dựng; `initialize` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysApplicationInsightsProperty`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input Args, record và control state (tham số của method public hoặc state của instance) → xử lý form/helper xử lý UI hoặc cấu hình qua newFromValue, initialize → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsPlatformVersionProperty instance = new TFMAppInsightsPlatformVersionProperty(<args>);` rồi `instance.newFromValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: caller context, form lifecycle, permissions và null buffers; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsProcessMSCountProperty`
1. **Tên class:** `TFMAppInsightsProcessMSCountProperty`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (app insights process ms count property); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `newFromValue` — khi cần khởi tạo/xây dựng; `initialize` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysApplicationInsightsProperty`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua newFromValue, initialize → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsProcessMSCountProperty instance = new TFMAppInsightsProcessMSCountProperty(<args>);` rồi `instance.newFromValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsProductVersionProperty`
1. **Tên class:** `TFMAppInsightsProductVersionProperty`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (app insights product version property); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `newFromValue` — khi cần khởi tạo/xây dựng; `initialize` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysApplicationInsightsProperty`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua newFromValue, initialize → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsProductVersionProperty instance = new TFMAppInsightsProductVersionProperty(<args>);` rồi `instance.newFromValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsTelemetryEventHandlers`
1. **Tên class:** `TFMAppInsightsTelemetryEventHandlers`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (app insights telemetry event handlers); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `Global_Pre_error` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMDocumentConnector`, `TFMAppInsightsFeatureNameProperty`, `TFMAppInsightsTelemetryLogger`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua Global_Pre_error → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsTelemetryEventHandlers instance = new TFMAppInsightsTelemetryEventHandlers(<args>);` rồi `instance.Global_Pre_error(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsTelemetryLogger`
1. **Tên class:** `TFMAppInsightsTelemetryLogger`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (app insights telemetry logger); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `instance` (TFMAppInsightsTelemetryLogger) — instance; `telemetryClient` (TelemetryClient) — telemetry client; `enabled` (boolean) — trạng thái bật; `baseUrl` (str) — base url; `testEnvironment` (boolean) — test environment; `instrumentationKey` (str) — instrumentation key; `ingestionEndpoint` (str) — ingestion endpoint; `liveEndpoint` (str) — live endpoint; `applicationId` (str) — application mã định danh
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `setConnectionValues` — khi cần ghi/cập nhật state; `typenew` — khi cần xem method body để xác định hành vi; `instance` — khi cần xem method body để xác định hành vi; `flushClient` — khi cần xem method body để xác định hành vi; `trackException` — khi cần xem method body để xác định hành vi; `trackDocQueue` — khi cần xem method body để xác định hành vi; `trackPageView` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMAppInsightsTelemetryLogger`. Dependency trong source: `TFMAppInsightsDocQueueTelemetry`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, setConnectionValues, typenew → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsTelemetryLogger instance = new TFMAppInsightsTelemetryLogger(<args>);` rồi `instance.setConnectionValues(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsTFMVersionProperty`
1. **Tên class:** `TFMAppInsightsTFMVersionProperty`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (app insights tfm version property); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `addPropertyVersion` — khi cần ghi/cập nhật state; `initialize` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysApplicationInsightsProperty`. Dependency trong source: `TFMVersion`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua addPropertyVersion, initialize → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsTFMVersionProperty instance = new TFMAppInsightsTFMVersionProperty(<args>);` rồi `instance.addPropertyVersion(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAppInsightsXMLRequestProperty`
1. **Tên class:** `TFMAppInsightsXMLRequestProperty`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (app insights xml request property); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `newFromValue` — khi cần khởi tạo/xây dựng; `initialize` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysApplicationInsightsProperty`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua newFromValue, initialize → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAppInsightsXMLRequestProperty instance = new TFMAppInsightsXMLRequestProperty(<args>);` rồi `instance.newFromValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMApplicationImporter`
1. **Tên class:** `TFMApplicationImporter`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (application importer); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getChangesFromApplicationConfigurationFile` — khi cần lấy hoặc tra cứu; `createSelectedMenuItems` — khi cần khởi tạo/xây dựng; `createSelectedPages` — khi cần khởi tạo/xây dựng; `createOrUpdateTFMQueryPage` — khi cần khởi tạo/xây dựng; `getUnknownPages` — khi cần lấy hoặc tra cứu; `getMenuAndConfigurationChangesForPages` — khi cần lấy hoặc tra cứu; `getMenuItemChanges` — khi cần lấy hoặc tra cứu; `getNextActionElement` — khi cần lấy hoặc tra cứu; … còn 10 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMPages`, `TFMPagesProvider`, `TFMMenuItemStateConfiguration`, `TFMPageMenuItemsAdditionalProperties`, `TFMPage`, `TFMPageConfiguration`, `TFMPageConfigurationAttributeAttribute`, `TFMPageActionAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua getChangesFromApplicationConfigurationFile, createSelectedMenuItems, createSelectedPages → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMApplicationImporter instance = new TFMApplicationImporter(<args>);` rồi `instance.getChangesFromApplicationConfigurationFile(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMAttributeHandler`
1. **Tên class:** `TFMAttributeHandler`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (attribute handler); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getMethodNamesFromSysAttribute` — khi cần lấy hoặc tra cứu; `getClassesUsingAttribute` — khi cần lấy hoặc tra cứu; `getAttributesFromClasses` — khi cần lấy hoặc tra cứu; `updateAttributeFromClass` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMFormLookupHelper`, `TFMDocumentHandler`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua getMethodNamesFromSysAttribute, getClassesUsingAttribute, getAttributesFromClasses → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMAttributeHandler instance = new TFMAttributeHandler(<args>);` rồi `instance.getMethodNamesFromSysAttribute(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMBackendIDInstance`
1. **Tên class:** `TFMBackendIDInstance`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (backend id instance); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `tblName` (TableName) — tbl tên/định danh; `fldName` (FieldName) — fld tên/định danh; `types` (TFMOrderTypes) — types; `fieldValue` (str) — field/trường giá trị
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `new` — khi cần khởi tạo/xây dựng; `parmTableName` — khi cần đọc/ghi tham số; `parmFieldName` — khi cần đọc/ghi tham số; `parmType` — khi cần đọc/ghi tham số; `parmFieldValue` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua Construct, new, parmTableName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMBackendIDInstance instance = TFMBackendIDInstance::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMBackendIDInterface`
1. **Tên class:** `TFMBackendIDInterface`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (backend id interface); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getBackendID` — khi cần lấy hoặc tra cứu; `lineTableId` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua getBackendID, lineTableId → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMBarcodeHelper`
1. **Tên class:** `TFMBarcodeHelper`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (barcode helper); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getItemBarcode` — khi cần lấy hoặc tra cứu; `getItemBarcodeQuantity` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua getItemBarcode, getItemBarcodeQuantity → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMBarcodeHelper instance = new TFMBarcodeHelper(<args>);` rồi `instance.getItemBarcode(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMBlockConnectionNode`
1. **Tên class:** `TFMBlockConnectionNode`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (block connection node); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `connectionNames` (Map) — connection names; `connectName2Block` (Map) — connect name2 block; `data` (str) — dữ liệu; `block` (TFMLogicBlock) — block; `firstBlockID` (int) — first block mã định danh
4. **Method chính và khi nào dùng:** `parmData` — khi cần đọc/ghi tham số; `parmBlock` — khi cần đọc/ghi tham số; `getToLinks` — khi cần lấy hoặc tra cứu; `addToConnectionName` — khi cần ghi/cập nhật state; `getConnectionName` — khi cần lấy hoặc tra cứu; `getBlockIdFromConnectionName` — khi cần lấy hoặc tra cứu; `addToLink` — khi cần ghi/cập nhật state; `getFromLinks` — khi cần lấy hoặc tra cứu; … còn 4 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMLogicBlock`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua parmData, parmBlock, getToLinks → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMBlockConnectionNode instance = new TFMBlockConnectionNode(<args>);` rồi `instance.parmData(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMCachedProvider`
1. **Tên class:** `TFMCachedProvider`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Service/Provider (cached provider); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `scope` (GlobalObjectCacheScope) — scope; `sgoc` (SysGlobalObjectCache) — sgoc
4. **Method chính và khi nào dùng:** `invalidateProvider` — khi cần xem method body để xác định hành vi; `constructEntityImpl` — khi cần khởi tạo/xây dựng; `getEntityImpl` — khi cần lấy hoặc tra cứu; `getEntity` — khi cần lấy hoặc tra cứu; `setEntity` — khi cần ghi/cập nhật state; `getProviderInstance` — khi cần lấy hoặc tra cứu; `cacheScope` — khi cần xem method body để xác định hành vi; `notifyOtherAOSsToInvalidateProvider` — khi cần xem method body để xác định hành vi; … còn 2 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMProvider`. Dependency trong source: `TFMVersionProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/process/request context (tham số của method public hoặc state của instance) → xử lý chọn handler/service hoặc serialize output qua invalidateProvider, constructEntityImpl, getEntityImpl → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: dùng đúng factory, cache và runtime context; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMCategoryAttribute`
1. **Tên class:** `TFMCategoryAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (category attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `category` (TFMCategoryName) — category; `helpText` (HelpTxt) — help text
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmCacheKey` — khi cần đọc/ghi tham số; `parmCategory` — khi cần đọc/ghi tham số; `parmHelpText` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua new, parmCacheKey, parmCategory → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMCategoryAttribute instance = new TFMCategoryAttribute(<args>);` rồi `instance.parmCacheKey(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMCollectorConfigurationAdditionalAttribute`
1. **Tên class:** `TFMCollectorConfigurationAdditionalAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (collector configuration additional attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `attributeName` (str) — attribute tên/định danh; `value` (str) — giá trị
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmAttributeName` — khi cần đọc/ghi tham số; `parmValue` — khi cần đọc/ghi tham số; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua new, parmAttributeName, parmValue → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMCollectorConfigurationAdditionalAttribute instance = new TFMCollectorConfigurationAdditionalAttribute(<args>);` rồi `instance.parmAttributeName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMCollectorMapAttribute`
1. **Tên class:** `TFMCollectorMapAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (collector map attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `documentType` (TFMDocumentTypeId) — document loại; `contentType` (TFMDocumentContentSubject) — content loại
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmContentType` — khi cần đọc/ghi tham số; `parmDocumentType` — khi cần đọc/ghi tham số; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`. Dependency trong source: `TFMGetRegistrationConfiguration`, `TFMPostAdhocRegistration`, `TFMLookup`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua new, parmContentType, parmDocumentType → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMCollectorMapAttribute instance = new TFMCollectorMapAttribute(<args>);` rồi `instance.parmContentType(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMCommandResponse`
1. **Tên class:** `TFMCommandResponse`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (command response); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `appendToXML` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua appendToXML → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMCommandResponseFilter`
1. **Tên class:** `TFMCommandResponseFilter`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (command response filter); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `filterName` (str) — bộ lọc tên/định danh; `filterValue` (str) — bộ lọc giá trị
4. **Method chính và khi nào dùng:** `appendToXML` — khi cần ghi/cập nhật state; `parmFilterName` — khi cần đọc/ghi tham số; `parmFilterValue` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMCommandResponse`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua appendToXML, parmFilterName, parmFilterValue → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMCommandResponseFilter instance = new TFMCommandResponseFilter(<args>);` rồi `instance.appendToXML(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMCommandResponseNotify`
1. **Tên class:** `TFMCommandResponseNotify`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (command response notify); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `notificationId` (str) — notification mã định danh; `header` (str) — header; `message` (str) — message; `backgroundColor` (str) — background color; `icon` (str) — icon; `duration` (int) — duration
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `appendToXML` — khi cần ghi/cập nhật state; `parmNotificationId` — khi cần đọc/ghi tham số; `parmHeader` — khi cần đọc/ghi tham số; `parmMessage` — khi cần đọc/ghi tham số; `parmBackgroundColor` — khi cần đọc/ghi tham số; `parmIcon` — khi cần đọc/ghi tham số; `parmDuration` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMCommandResponse`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua Construct, appendToXML, parmNotificationId → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMCommandResponseNotify instance = TFMCommandResponseNotify::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMCommandResponsePin`
1. **Tên class:** `TFMCommandResponsePin`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (command response pin); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `appendToXML` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMCommandResponse`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua appendToXML → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMCommandResponsePin instance = new TFMCommandResponsePin(<args>);` rồi `instance.appendToXML(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMCommandResponseRegister`
1. **Tên class:** `TFMCommandResponseRegister`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (command response register); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `appendToXML` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMCommandResponse`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua appendToXML → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMCommandResponseRegister instance = new TFMCommandResponseRegister(<args>);` rồi `instance.appendToXML(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMCommandResponses`
1. **Tên class:** `TFMCommandResponses`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (command responses); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `commandResponses` (List) — command responses
4. **Method chính và khi nào dùng:** `addCommandResponse` — khi cần ghi/cập nhật state; `getCommandResponses` — khi cần lấy hoặc tra cứu; `Construct` — khi cần khởi tạo/xây dựng; `appendToXML` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMCommandResponse`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua addCommandResponse, getCommandResponses, Construct → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMCommandResponses instance = TFMCommandResponses::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMCondition`
1. **Tên class:** `TFMCondition`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (condition); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `expression` (TFMExpression) — expression; `containedClass` (Object) — contained class; `children` (Set) — children; `dataContract` (TFMLogicContextDataContract) — dữ liệu contract
4. **Method chính và khi nào dùng:** `parmDataContract` — khi cần đọc/ghi tham số; `new` — khi cần khởi tạo/xây dựng; `nodeDisplay` — khi cần xem method body để xác định hành vi; `addChild` — khi cần ghi/cập nhật state; `Construct` — khi cần khởi tạo/xây dựng; `ConstructOperator` — khi cần khởi tạo/xây dựng; `ConstructFromDelta` — khi cần khởi tạo/xây dựng; `evaluate` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMLogicContextDataContract`. Dependency trong source: `TFMLogicContextFunctionsDataContract`, `TFMLogicContextOperatorDataContract`, `TFMLogicContext`, `TFMLogicContextObject`, `TFMExpressions`, `TFMLogicContextTools`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmDataContract, new, nodeDisplay → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMCondition instance = TFMCondition::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMConditionConnectionNode`
1. **Tên class:** `TFMConditionConnectionNode`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (condition connection node); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `data` (str) — dữ liệu
4. **Method chính và khi nào dùng:** `parmData` — khi cần đọc/ghi tham số; `getToLinks` — khi cần lấy hoặc tra cứu; `addToLink` — khi cần ghi/cập nhật state; `getFromLinks` — khi cần lấy hoặc tra cứu; `addFromLink` — khi cần ghi/cập nhật state; `findStartingNodes` — khi cần lấy hoặc tra cứu; `hasCycle` — khi cần kiểm tra điều kiện; `dfs` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMBlockConnectionNode`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmData, getToLinks, addToLink → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMConditionConnectionNode instance = new TFMConditionConnectionNode(<args>);` rồi `instance.parmData(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMConditionEditorFormClass`
1. **Tên class:** `TFMConditionEditorFormClass`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Form/UI (condition editor form class); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `formRun` (FormRun) — form run; `caller` (TFMRegistrationCollector) — caller; `fgc` (FormGroupControl) — fgc; `contextGroup` (FormGroupControl) — ngữ cảnh group; `conditions` (TFMConditions) — conditions; `flowControl` (TFMDrawFlowControl) — flow control; `flowInteraction` (TFMDrawFlowControlInteractionStepConditions) — flow interaction; `fieldOutputType` (TFMLogicContextTypes) — field/trường output loại; `deleteConditionButton` (FormButtonControl) — delete condition button
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `parmFormRun` — khi cần đọc/ghi tham số; `validateConditions` — khi cần kiểm tra điều kiện; `setContextGroup` — khi cần ghi/cập nhật state; `init` — khi cần khởi tạo/xây dựng; `setEditmode` — khi cần ghi/cập nhật state; `types2ContextType` — khi cần xem method body để xác định hành vi; `ConditionsGuiBuild` — khi cần xem method body để xác định hành vi; … còn 8 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMRegistrationCollector`, `TFMConditions`, `TFMDrawFlowControl`, `TFMDrawFlowControlInteractionStepConditions`. Dependency trong source: `TFMCondition`, `TFMLogicContextFunctionsDataContract`, `TFMLogicContextObject`, `TFMDescriptionAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input Args, record và control state (tham số của method public hoặc state của instance) → xử lý form/helper xử lý UI hoặc cấu hình qua Construct, parmFormRun, validateConditions → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMConditionEditorFormClass instance = TFMConditionEditorFormClass::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: caller context, form lifecycle, permissions và null buffers; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMConditions`
1. **Tên class:** `TFMConditions`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (conditions); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `conditions` (Map) — conditions; `tempContext` (TFMLogicContext) — temp ngữ cảnh
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `updateFromConditionsTable` — khi cần ghi/cập nhật state; `parmContext` — khi cần đọc/ghi tham số; `new` — khi cần khởi tạo/xây dựng; `addCondition` — khi cần ghi/cập nhật state; `saveConditionToData` — khi cần xem method body để xác định hành vi; `validateEndNodesNumber` — khi cần kiểm tra điều kiện; `validateFunctionsInCondition` — khi cần kiểm tra điều kiện; … còn 16 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMLogicContext`. Dependency trong source: `TFMCondition`, `TFMConnectedConditions`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua Construct, updateFromConditionsTable, parmContext → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMConditions instance = TFMConditions::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMConfluencePageBodyContract`
1. **Tên class:** `TFMConfluencePageBodyContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (confluence page body contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `viewContract` (TFMConfluencePageViewContract) — view contract
4. **Method chính và khi nào dùng:** `view` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMConfluencePageViewContract`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua view → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMConfluencePageBodyContract instance = new TFMConfluencePageBodyContract(<args>);` rồi `instance.view(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMConfluencePageContract`
1. **Tên class:** `TFMConfluencePageContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (confluence page contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `id` (str) — mã định danh; `bodyContract` (TFMConfluencePageBodyContract) — body contract
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `body` — khi cần xem method body để xác định hành vi; `id` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMConfluencePageBodyContract`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua new, body, id → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMConfluencePageContract instance = new TFMConfluencePageContract(<args>);` rồi `instance.body(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMConfluencePageViewContract`
1. **Tên class:** `TFMConfluencePageViewContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (confluence page view contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `value` (str) — giá trị
4. **Method chính và khi nào dùng:** `value` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua value → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMConfluencePageViewContract instance = new TFMConfluencePageViewContract(<args>);` rồi `instance.value(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMConnectedConditions`
1. **Tên class:** `TFMConnectedConditions`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (connected conditions); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `conditions` (Map) — conditions; `connections` (Map) — connections; `conditionsResults` (Map) — conditions results; `keyOverrideMap` (Map) — key override map; `reverseKeyOverrideMap` (Map) — reverse key override map; `resultNodeId` (int) — result node mã định danh
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `saveToDelta` — khi cần xem method body để xác định hành vi; `noOfEndNodes` — khi cần xem method body để xác định hành vi; `checkForLoop` — khi cần xem method body để xác định hành vi; `checkForTypeCompatibility` — khi cần xem method body để xác định hành vi; `functionConditionPresent` — khi cần xem method body để xác định hành vi; `getReturnType` — khi cần lấy hoặc tra cứu; `addCondition` — khi cần ghi/cập nhật state; … còn 18 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMCondition`, `TFMFormLookupHelper`, `TFMLogicContextFunctionsDataContract`, `TFMLogicContext`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, saveToDelta, noOfEndNodes → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMConnectedConditions instance = new TFMConnectedConditions(<args>);` rồi `instance.saveToDelta(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMConnectionPoint`
1. **Tên class:** `TFMConnectionPoint`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (connection point); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `connectedClass` (Object) — connected class; `connectedMethod` (SysDictMethod) — connected method
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMConnectionPoint instance = new TFMConnectionPoint(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMConnectionPointInterface`
1. **Tên class:** `TFMConnectionPointInterface`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (connection point interface); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMConnectionWizard`
1. **Tên class:** `TFMConnectionWizard`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (connection wizard); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `formname` — khi cần xem method body để xác định hành vi; `run` — khi cần thực thi xử lý; `setupNavigation` — khi cần ghi/cập nhật state; `validate` — khi cần kiểm tra điều kiện; `description` — khi cần xem method body để xác định hành vi; `main` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysWizard`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua formname, run, setupNavigation → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMConnectionWizard instance = new TFMConnectionWizard(<args>);` rồi `instance.formname(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMConstants`
1. **Tên class:** `TFMConstants`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (constants); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `GetReceiveOrders` (str) — get receive orders; `GetRegistrationConfiguration` (str) — get registration cấu hình
4. **Method chính và khi nào dùng:** `GetReceiveOrders` — khi cần lấy hoặc tra cứu; `GetRegistrationConfiguration` — khi cần lấy hoặc tra cứu; `pageIcon` — khi cần xem method body để xác định hành vi; `TFMRequestApplicationConfiguration` — khi cần xem method body để xác định hành vi; `TFMRequestConfiguration` — khi cần xem method body để xác định hành vi; `getNextStepsInProcess` — khi cần lấy hoặc tra cứu; `applicationSchemaPath` — khi cần xem method body để xác định hành vi; `RequestDocumentNamespace` — khi cần xem method body để xác định hành vi; … còn 275 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMCrypt`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua GetReceiveOrders, GetRegistrationConfiguration, pageIcon → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMConstants instance = new TFMConstants(<args>);` rồi `instance.GetReceiveOrders(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMContentTypeAttribute`
1. **Tên class:** `TFMContentTypeAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (content type attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `contentType` (TFMDocumentContentSubject) — content loại
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmContentType` — khi cần đọc/ghi tham số; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua new, parmContentType, parmCacheKey → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMContentTypeAttribute instance = new TFMContentTypeAttribute(<args>);` rồi `instance.parmContentType(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMContractClassAttribute`
1. **Tên class:** `TFMContractClassAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (contract class attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `className` (ClassName) — class tên/định danh
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmClassName` — khi cần đọc/ghi tham số; `getClassId` — khi cần lấy hoặc tra cứu; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua new, parmClassName, getClassId → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMContractClassAttribute instance = new TFMContractClassAttribute(<args>);` rồi `instance.parmClassName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMCreateMenuSettings`
1. **Tên class:** `TFMCreateMenuSettings`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (create menu settings); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `main` — khi cần xem method body để xác định hành vi; `getMenuFromDocuments` — khi cần lấy hoặc tra cứu; `oneClickSetupMenu` — khi cần xem method body để xác định hành vi; `addMenu` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMConstants`, `TFMDocumentHandler`, `TFMMenuAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua main, getMenuFromDocuments, oneClickSetupMenu → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMCreateMenuSettings instance = new TFMCreateMenuSettings(<args>);` rồi `instance.main(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMCrypt`
1. **Tên class:** `TFMCrypt`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (crypt); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Construct` — khi cần khởi tạo/xây dựng; `init` — khi cần khởi tạo/xây dựng; `encrypt` — khi cần xem method body để xác định hành vi; `doEncrypt` — khi cần xem method body để xác định hành vi; `decrypt` — khi cần xem method body để xác định hành vi; `doDecrypt` — khi cần xem method body để xác định hành vi; `computeMD5Hash` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, Construct, init → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMCrypt instance = TFMCrypt::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDataCacheProvider`
1. **Tên class:** `TFMDataCacheProvider`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Service/Provider (data cache provider); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `dataCache` (Map) — dữ liệu cache
4. **Method chính và khi nào dùng:** `instance` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `addRecord` — khi cần ghi/cập nhật state; `removeRecord` — khi cần ghi/cập nhật state; `getRecord` — khi cần lấy hoặc tra cứu; `removeDomain` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/process/request context (tham số của method public hoặc state của instance) → xử lý chọn handler/service hoặc serialize output qua instance, new, addRecord → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDataCacheProvider instance = new TFMDataCacheProvider(<args>);` rồi `instance.instance(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: dùng đúng factory, cache và runtime context; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDataInputEnabledInterface`
1. **Tên class:** `TFMDataInputEnabledInterface`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (data input enabled interface); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `parmInputData` — khi cần đọc/ghi tham số; `getData` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMRequestElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua parmInputData, getData → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDataSourceBlock`
1. **Tên class:** `TFMDataSourceBlock`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (data source block); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `ds` (TFMPageDatasources) — ds; `deviceId` (TFMDocumentDeviceId) — thiết bị mã định danh; `overrideFieldsMap` (Map) — override fields map
4. **Method chính và khi nào dùng:** `parmDeviceId` — khi cần đọc/ghi tham số; `setDataSource` — khi cần ghi/cập nhật state; `getDataSource` — khi cần lấy hoặc tra cứu; `getOverrideFieldsMap` — khi cần lấy hoặc tra cứu; `AddFields` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua parmDeviceId, setDataSource, getDataSource → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDataSourceBlockLockOrderList`
1. **Tên class:** `TFMDataSourceBlockLockOrderList`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (data source block lock order list); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `useOrderLocking` (NoYes) — use đơn hàng locking; `backendId` (TFMBackendId) — backend mã định danh; `lockingLevel` (TFMLockingLevel) — locking level
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmLockingLevel` — khi cần đọc/ghi tham số; `parmUseOrderLocking` — khi cần đọc/ghi tham số; `AddFields` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDataSourceBlock`. Dependency trong source: `TFMHelper`, `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua new, parmLockingLevel, parmUseOrderLocking → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDataSourceBlockLockOrderList instance = new TFMDataSourceBlockLockOrderList(<args>);` rồi `instance.parmLockingLevel(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDataSourceBlockLookupDefault`
1. **Tên class:** `TFMDataSourceBlockLookupDefault`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (data source block lookup default); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `barcodeField` (TFMTableNameAndField) — barcode field/trường
4. **Method chính và khi nào dùng:** `parmBarcodeField` — khi cần đọc/ghi tham số; `AddFields` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDataSourceBlock`. Dependency trong source: `TFMInventDimSetup`, `TFMConstants`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua parmBarcodeField, AddFields → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDataSourceBlockLookupDefault instance = new TFMDataSourceBlockLookupDefault(<args>);` rồi `instance.parmBarcodeField(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDataSourceBlockOrderLineItemSetup`
1. **Tên class:** `TFMDataSourceBlockOrderLineItemSetup`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (data source block order line item setup); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `allowLocationChange` (boolean) — allow location change; `qtyByScan` (boolean) — qty by scan; `qtyBarcode` (boolean) — qty barcode; `registerExpirationDate` (boolean) — register expiration ngày; `actionType` (TFMActionTypes) — action loại; `fromLocationField` (TFMTableNameAndField) — from location field/trường; `toLocationField` (TFMTableNameAndField) — to location field/trường; `barcodeFormat` (Description255) — barcode format; `overrideInventTransId` (InventTransId) — override invent trans mã định danh; `overrideInventDimId` (InventDimId) — override invent dim mã định danh
4. **Method chính và khi nào dùng:** `setOverrideInventTransId` — khi cần ghi/cập nhật state; `setOverrideInventDimId` — khi cần ghi/cập nhật state; `parmregisterExpirationDate` — khi cần đọc/ghi tham số; `parmAllowLocationChange` — khi cần đọc/ghi tham số; `parmQtyByScan` — khi cần đọc/ghi tham số; `parmQtyBarcode` — khi cần đọc/ghi tham số; `parmActionType` — khi cần đọc/ghi tham số; `parmBarcodeFormat` — khi cần đọc/ghi tham số; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDataSourceBlock`. Dependency trong source: `TFMInventDimSetup`, `TFMConstants`, `TFMBarcodeHelper`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua setOverrideInventTransId, setOverrideInventDimId, parmregisterExpirationDate → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDataSourceBlockOrderLineItemSetup instance = new TFMDataSourceBlockOrderLineItemSetup(<args>);` rồi `instance.setOverrideInventTransId(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDataSourceBlockValuesOverride`
1. **Tên class:** `TFMDataSourceBlockValuesOverride`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (data source block values override); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `hasModifications` — khi cần kiểm tra điều kiện; `getClassName` — khi cần lấy hoặc tra cứu; `modifyValuesBeforeDelta` — khi cần xem method body để xác định hành vi; `FindOverridesForDataSourceBlock` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMDataSourceBlock`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua hasModifications, getClassName, modifyValuesBeforeDelta → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDataSourceParameterAttribute`
1. **Tên class:** `TFMDataSourceParameterAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (data source parameter attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `GroupString` (str) — group string; `LabelString` (LabelString) — nhãn string; `defaultValue` (anytype) — mặc định giá trị; `helpText` (HelpTxt) — help text
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmDefaultValue` — khi cần đọc/ghi tham số; `parmGroupString` — khi cần đọc/ghi tham số; `parmLabelString` — khi cần đọc/ghi tham số; `parmHelpText` — khi cần đọc/ghi tham số; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua new, parmDefaultValue, parmGroupString → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDataSourceParameterAttribute instance = new TFMDataSourceParameterAttribute(<args>);` rồi `instance.parmDefaultValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDatasourceParametersEdit`
1. **Tên class:** `TFMDatasourceParametersEdit`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (datasource parameters edit); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `ds` (TFMPageDatasources) — ds
4. **Method chính và khi nào dùng:** `parmDataSource` — khi cần đọc/ghi tham số; `control_modified` — khi cần xem method body để xác định hành vi; `control_EnumModified` — khi cần xem method body để xác định hành vi; `getValue` — khi cần lấy hoặc tra cứu; `valueExists` — khi cần xem method body để xác định hành vi; `type2FormControl` — khi cần xem method body để xác định hành vi; `control_lookup` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentParametersEdit`. Dependency trong source: `TFMDocCustomFunctionFlow`, `TFMFormLookupHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmDataSource, control_modified, control_EnumModified → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDatasourceParametersEdit instance = new TFMDatasourceParametersEdit(<args>);` rồi `instance.parmDataSource(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDataSourceRecordQuery`
1. **Tên class:** `TFMDataSourceRecordQuery`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (data source record query); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `queryRun` (QueryRun) — query run; `dfType` (DialogField) — df loại; `dfName` (DialogField) — df tên/định danh; `dg` (dialogGroup) — dg; `dgp` (dialogGroup) — dgp; `pds` (TFMPageDatasources) — pds
4. **Method chính và khi nào dùng:** `showQueryValues` — khi cần xem method body để xác định hành vi; `showQuerySelectButton` — khi cần xem method body để xác định hành vi; `lastValueElementName` — khi cần xem method body để xác định hành vi; `canRunInNewSession` — khi cần kiểm tra điều kiện; `initParmDefault` — khi cần khởi tạo/xây dựng; `queryRun` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `Main` — khi cần xem method body để xác định hành vi; … còn 2 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `RunBase`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua showQueryValues, showQuerySelectButton, lastValueElementName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDataSourceRecordQuery instance = new TFMDataSourceRecordQuery(<args>);` rồi `instance.showQueryValues(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDataSourceTypeDefinition`
1. **Tên class:** `TFMDataSourceTypeDefinition`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (data source type definition); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `typeName` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua typeName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDataSourceTypeDefinitionClassic`
1. **Tên class:** `TFMDataSourceTypeDefinitionClassic`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (data source type definition classic); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `typeName` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDataSourceTypeDefinition`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua typeName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDataSourceTypeDefinitionClassic instance = new TFMDataSourceTypeDefinitionClassic(<args>);` rồi `instance.typeName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDataSourceTypeDefinitionEntity`
1. **Tên class:** `TFMDataSourceTypeDefinitionEntity`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (data source type definition entity); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `typeName` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDataSourceTypeDefinition`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua typeName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDataSourceTypeDefinitionEntity instance = new TFMDataSourceTypeDefinitionEntity(<args>);` rồi `instance.typeName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDataSourceTypeDefinitionQuery`
1. **Tên class:** `TFMDataSourceTypeDefinitionQuery`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (data source type definition query); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `typeName` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDataSourceTypeDefinition`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua typeName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDataSourceTypeDefinitionQuery instance = new TFMDataSourceTypeDefinitionQuery(<args>);` rồi `instance.typeName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDataSourceTypeDefinitionRDP`
1. **Tên class:** `TFMDataSourceTypeDefinitionRDP`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (data source type definition rdp); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `typeName` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDataSourceTypeDefinition`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua typeName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDataSourceTypeDefinitionRDP instance = new TFMDataSourceTypeDefinitionRDP(<args>);` rồi `instance.typeName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDataTableInterface`
1. **Tên class:** `TFMDataTableInterface`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (data table interface); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `parmDataTable` — khi cần đọc/ghi tham số; `parmDataKeyColumn` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua parmDataTable, parmDataKeyColumn → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDescriptionAttribute`
1. **Tên class:** `TFMDescriptionAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (description attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `description` (Description255) — mô tả
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmCacheKey` — khi cần đọc/ghi tham số; `parmDescription` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua new, parmCacheKey, parmDescription → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDescriptionAttribute instance = new TFMDescriptionAttribute(<args>);` rồi `instance.parmCacheKey(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDeviceConnectionGuideFormClass`
1. **Tên class:** `TFMDeviceConnectionGuideFormClass`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Form/UI (device connection guide form class); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `baseUrl` (str) — base url
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `CreateNewClientID` — khi cần khởi tạo/xây dựng; `setConfluencePageContentOnHtmlViewer` — khi cần ghi/cập nhật state; `GetJsonBodyValueFrom` — khi cần lấy hoặc tra cứu; `updateBarcode` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `Object`. Dependency trong source: `TFMConstants`, `TFMHtmlViewerCtrl`, `TFMService`, `TFMConfluencePageContract`, `TFM2DBarcodeGenerator`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input Args, record và control state (tham số của method public hoặc state của instance) → xử lý form/helper xử lý UI hoặc cấu hình qua new, CreateNewClientID, setConfluencePageContentOnHtmlViewer → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDeviceConnectionGuideFormClass instance = new TFMDeviceConnectionGuideFormClass(<args>);` rồi `instance.CreateNewClientID(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: caller context, form lifecycle, permissions và null buffers; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDevicePage`
1. **Tên class:** `TFMDevicePage`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (device page); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `pages` (TFMPages) — pages
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMPages`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDevicePage instance = new TFMDevicePage(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDevicePagePick`
1. **Tên class:** `TFMDevicePagePick`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (device page pick); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDevicePage`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDevicePagePick instance = new TFMDevicePagePick(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDeviceVisualization`
1. **Tên class:** `TFMDeviceVisualization`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (device visualization); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `DrawPage` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMPage`, `TFMHtmlViewerCtrl`, `TFMPageTypeAttribute`, `TFMDrawPage`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua DrawPage → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDeviceVisualization instance = new TFMDeviceVisualization(<args>);` rồi `instance.DrawPage(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocApplicationConfiguration`
1. **Tên class:** `TFMDocApplicationConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (doc application configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `requestApplicationConfiguration` (NoYes) — request application cấu hình; `nameOfCfg` (str) — tên/định danh of cfg
4. **Method chính và khi nào dùng:** `parmEnableRequestApplicationConfiguration` — khi cần đọc/ghi tham số; `description` — khi cần xem method body để xác định hành vi; `pages` — khi cần xem method body để xác định hành vi; `GetApplicationConfiguration` — khi cần lấy hoặc tra cứu; `getApplicationConfigurationContent` — khi cần lấy hoặc tra cứu; `getApplicationConfigurationMainContent` — khi cần lấy hoặc tra cứu; `applicationConfiguration` — khi cần xem method body để xác định hành vi; `GetApplicationConfigurationStrForReferenceData` — khi cần lấy hoặc tra cứu; … còn 2 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentHandler`. Dependency trong source: `TFMPages`, `TFMPage`, `TFMPageRegistrations`, `TFMPagePendingRegistrations`, `TFMConstants`, `TFMPageSearch`, `TFMPageScanInfo`, `TFMPageSettings`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmEnableRequestApplicationConfiguration, description, pages → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDocApplicationConfiguration instance = new TFMDocApplicationConfiguration(<args>);` rồi `instance.parmEnableRequestApplicationConfiguration(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocAttachments`
1. **Tên class:** `TFMDocAttachments`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (doc attachments); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getDocumentTypes` — khi cần lấy hoặc tra cứu; `pages` — khi cần xem method body để xác định hành vi; `addTranslations` — khi cần ghi/cập nhật state; `registerImage` — khi cần xem method body để xác định hành vi; `getResult` — khi cần lấy hoặc tra cứu; `findAttachments` — khi cần lấy hoặc tra cứu; `description` — khi cần xem method body để xác định hành vi; `AttachmentCfgHeader` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentHandler`. Dependency trong source: `TFMLookup`, `TFMPages`, `TFMPageLookup`, `TFMPageLookupConfiguration`, `TFMMenuItemStateConfiguration`, `TFMListAttachments`, `TFMConstants`, `TFMPageActionAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua getDocumentTypes, pages, addTranslations → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDocAttachments instance = new TFMDocAttachments(<args>);` rồi `instance.getDocumentTypes(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocCustomFunctionFlow`
1. **Tên class:** `TFMDocCustomFunctionFlow`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (doc custom function flow); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `description` — khi cần xem method body để xác định hành vi; `makeConfig` — khi cần xem method body để xác định hành vi; `makeMenuConfig` — khi cần xem method body để xác định hành vi; `process` — khi cần thực thi xử lý; `lookupFlow` — khi cần lấy hoặc tra cứu; `Add2Lookup` — khi cần ghi/cập nhật state; `postFlow` — khi cần thực thi xử lý; `callMethodMap` — khi cần xem method body để xác định hành vi; … còn 13 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentHandler`. Dependency trong source: `TFMConstants`, `TFMHelper`, `TFMRegistrationCollector`, `TFMDocumentNodes`, `TFMDocumentNode`, `TFMRegistrationCollectorInformation`, `TFMGetReferenceData`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua description, makeConfig, makeMenuConfig → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDocCustomFunctionFlow instance = new TFMDocCustomFunctionFlow(<args>);` rồi `instance.description(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocGetItemImages`
1. **Tên class:** `TFMDocGetItemImages`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (doc get item images); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `dimLocked` (boolean) — dim trạng thái khóa; `inventTable` (InventTable) — invent table; `inventDim` (InventDim) — invent dim; `common` (Common) — common
4. **Method chính và khi nào dùng:** `getCommon` — khi cần lấy hoặc tra cứu; `description` — khi cần xem method body để xác định hành vi; `addTranslations` — khi cần ghi/cập nhật state; `RegisterItemImageHeader` — khi cần xem method body để xác định hành vi; `RegisterItemImageCollectors` — khi cần xem method body để xác định hành vi; `GetItemRegistrationCollectors` — khi cần lấy hoặc tra cứu; `postItemImage` — khi cần thực thi xử lý; `getRecord` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentHandler`. Dependency trong source: `TFMGetRegistrationConfiguration`, `TFMPostAdhocRegistration`, `TFMReferenceDataConfiguration`, `TFMGetReferenceData`, `TFMInventDimHelper`, `TFMInventDimSetup`, `TFMRegistrationCollectorImageCapture`, `TFMRequestItemAndDimensionElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua getCommon, description, addTranslations → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDocGetItemImages instance = new TFMDocGetItemImages(<args>);` rồi `instance.getCommon(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocGetMedia`
1. **Tên class:** `TFMDocGetMedia`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (doc get media); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `iconRequested` (TFMDocumentContentSubject) — icon requested
4. **Method chính và khi nào dùng:** `getDocumentContentSubject` — khi cần lấy hoặc tra cứu; `description` — khi cần xem method body để xác định hành vi; `getDocumentTypes` — khi cần lấy hoặc tra cứu; `dopackItems2Image` — khi cần xem method body để xác định hành vi; `totalRect` — khi cần xem method body để xác định hành vi; `intersectionTest` — khi cần xem method body để xác định hành vi; `GetMedia` — khi cần lấy hoặc tra cứu; `registerImage` — khi cần xem method body để xác định hành vi; … còn 7 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentHandler`. Dependency trong source: `TFMHelper`, `TFMImageHelper`, `TFMConstants`, `TFMRequestElement`, `TFMMediaProvider`, `TFMImageHandler`, `TFMDocumentHandlers`, `TFMMediaItem`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua getDocumentContentSubject, description, getDocumentTypes → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDocGetMedia instance = new TFMDocGetMedia(<args>);` rồi `instance.getDocumentContentSubject(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocLocalization`
1. **Tên class:** `TFMDocLocalization`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (doc localization); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `description` — khi cần xem method body để xác định hành vi; `addTranslationToXml` — khi cần ghi/cập nhật state; `process` — khi cần thực thi xử lý; `getDocumentTypes` — khi cần lấy hoặc tra cứu; `GetLocalizationData` — khi cần lấy hoặc tra cứu; `getReferenceDataMethods` — khi cần lấy hoặc tra cứu; `UserLanguageCustomizationVersion` — khi cần xem method body để xác định hành vi; `getUserLanguage` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentHandler`. Dependency trong source: `TFMDocumentNodes`, `TFMDocumentNode`, `TFMTranslationProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua description, addTranslationToXml, process → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDocLocalization instance = new TFMDocLocalization(<args>);` rồi `instance.description(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocPostMedia`
1. **Tên class:** `TFMDocPostMedia`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (doc post media); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `description` — khi cần xem method body để xác định hành vi; `getDocumentTypes` — khi cần lấy hoặc tra cứu; `PostMedia` — khi cần thực thi xử lý; `getReferenceDataMethods` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentHandler`. Dependency trong source: `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua description, getDocumentTypes, PostMedia → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDocPostMedia instance = new TFMDocPostMedia(<args>);` rồi `instance.description(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocRegisterGenericImage`
1. **Tên class:** `TFMDocRegisterGenericImage`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (doc register generic image); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `record` (Common) — record
4. **Method chính và khi nào dùng:** `getRecord` — khi cần lấy hoặc tra cứu; `pages` — khi cần xem method body để xác định hành vi; `addTranslations` — khi cần ghi/cập nhật state; `description` — khi cần xem method body để xác định hành vi; `ReferenceHeader_attachImage` — khi cần xem method body để xác định hành vi; `AttachImageRegistrationCollectors` — khi cần xem method body để xác định hành vi; `postRecordImage` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentHandler`. Dependency trong source: `TFMGetRegistrationConfiguration`, `TFMPostAdhocRegistration`, `TFMOrderPostDataSetAttribute`, `TFMPages`, `TFMPageUnplannedItemRegistrationConfiguration`, `TFMPage`, `TFMConstants`, `TFMReferenceDataConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua getRecord, pages, addTranslations → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDocRegisterGenericImage instance = new TFMDocRegisterGenericImage(<args>);` rồi `instance.getRecord(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocumentConnector`
1. **Tên class:** `TFMDocumentConnector`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (document connector); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `logDocumentQueue` — khi cần xem method body để xác định hành vi; `cleanEmptyXmlTags` — khi cần parse/serialize XML; `removeLabelTags` — khi cần ghi/cập nhật state; `submit` — khi cần xem method body để xác định hành vi; `updateSessionLink` — khi cần ghi/cập nhật state; `Add2ReturnXml` — khi cần ghi/cập nhật state; `FindandReplaceTextBetweenBraces` — khi cần lấy hoặc tra cứu; `createReturnXml` — khi cần khởi tạo/xây dựng; … còn 8 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMInputHandler`, `TFMRequestElement`, `TFMHelper`, `TFMXmlDeserializer`, `TFMConstants`, `TFMProcessProvider`, `TFMProcessHandler`, `TFMDocumentTypeProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua logDocumentQueue, cleanEmptyXmlTags, removeLabelTags → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDocumentConnector instance = new TFMDocumentConnector(<args>);` rồi `instance.logDocumentQueue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocumentHandler`
1. **Tên class:** `TFMDocumentHandler`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (document handler); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `resultStr` (TFMDocumentXML) — result str; `TFMXMLFormat` (TFMXMLFormat) — tfmxml format; `sorting` (int) — sorting; `resultTable` (Common) — result table; `MethodUsed` (DictMethod) — method used
4. **Method chính và khi nào dùng:** `canBeEnqueued` — khi cần kiểm tra điều kiện; `subHandler` — khi cần xem method body để xác định hành vi; `parmMethod` — khi cần đọc/ghi tham số; `parmResultXML` — khi cần đọc/ghi tham số; `getTTSHandlingRequired` — khi cần lấy hoặc tra cứu; `getIcon` — khi cần lấy hoặc tra cứu; `documenthandler` — khi cần xem method body để xác định hành vi; `getResultTable` — khi cần lấy hoặc tra cứu; … còn 28 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMInputHandler`. Composition/member fields: `TFMXMLFormat`. Dependency trong source: `TFMTranslationDeclarantInterface`, `TFMMenuAttribute`, `TFMOrderPostDataSetAttribute`, `TFMAttributeHandler`, `TFMPages`, `TFMPageHelper`, `TFMResponseElement`, `TFMFormLookupHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua canBeEnqueued, subHandler, parmMethod → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocumentHandlers`
1. **Tên class:** `TFMDocumentHandlers`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (document handlers); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `handlers` (Set) — handlers
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `addDocHandler` — khi cần ghi/cập nhật state; `getDocHandlersSet` — khi cần lấy hoặc tra cứu; `setDocHandlersSet` — khi cần ghi/cập nhật state; `getDocHandlersEnumerator` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMDocumentHandler`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, addDocHandler, getDocHandlersSet → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDocumentHandlers instance = new TFMDocumentHandlers(<args>);` rồi `instance.addDocHandler(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocumentHandlersProvider`
1. **Tên class:** `TFMDocumentHandlersProvider`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Service/Provider (document handlers provider); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getDocumentHandlers` — khi cần lấy hoặc tra cứu; `visitDocumentHandlers` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMDocumentHandlers`, `TFMDocumentHandler`, `TFMIDocumentHandlerVisitor`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/process/request context (tham số của method public hoặc state của instance) → xử lý chọn handler/service hoặc serialize output qua getDocumentHandlers, visitDocumentHandlers → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDocumentHandlersProvider instance = new TFMDocumentHandlersProvider(<args>);` rồi `instance.getDocumentHandlers(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: dùng đúng factory, cache và runtime context; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocumentNode`
1. **Tên class:** `TFMDocumentNode`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (document node); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `children` (Map) — children; `parentID` (int64) — parent mã định danh; `attributes` (Map) — attributes; `name` (str) — tên/định danh; `value` (str) — giá trị; `cData` (TFMDocumentNodes) — c dữ liệu; `cDataXML` (XML) — c dữ liệu XML; `childNameCount` (Map) — child tên/định danh số lượng; `nodeID` (int64) — node mã định danh; `owner` (TFMDocumentNodes) — owner
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Construct` — khi cần khởi tạo/xây dựng; `owner` — khi cần xem method body để xác định hành vi; `addAttribute` — khi cần ghi/cập nhật state; `addChild` — khi cần ghi/cập nhật state; `addToMap` — khi cần ghi/cập nhật state; `parmAttributes` — khi cần đọc/ghi tham số; `getChildren` — khi cần lấy hoặc tra cứu; … còn 7 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMDocumentNodes`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, Construct, owner → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMDocumentNode instance = TFMDocumentNode::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocumentNodes`
1. **Tên class:** `TFMDocumentNodes`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (document nodes); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `nodes` (Map) — nodes; `rootLevelNodes` (Set) — root level nodes
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `new` — khi cần khởi tạo/xây dựng; `getRoot` — khi cần lấy hoặc tra cứu; `makeRootSibling` — khi cần xem method body để xác định hành vi; `makeChild` — khi cần xem method body để xác định hành vi; `appendToXML` — khi cần ghi/cập nhật state; `makeXml` — khi cần parse/serialize XML; `makeNode` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMDocumentNode`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua Construct, new, getRoot → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMDocumentNodes instance = TFMDocumentNodes::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocumentParametersEdit`
1. **Tên class:** `TFMDocumentParametersEdit`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (document parameters edit); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `currentClass` (ClassName) — current class; `parmsGroup` (FormGroupControl) — parms group; `prevsender` (FormWindowControl) — prevsender; `controlName2ClassName` (Map) — control name2 class tên/định danh; `controlName2Class` (Map) — control name2 class
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `populateGroupWithDocParms` — khi cần xem method body để xác định hành vi; `getValue` — khi cần lấy hoặc tra cứu; `valueExists` — khi cần xem method body để xác định hành vi; `type2FormControl` — khi cần xem method body để xác định hành vi; `control_modified` — khi cần xem method body để xác định hành vi; `control_EnumModified` — khi cần xem method body để xác định hành vi; `showDocumentParametersTiles` — khi cần xem method body để xác định hành vi; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMParameterAttribute`, `TFMFormLookupHelper`, `TFMDocCustomFunctionFlow`, `TFMPagesProvider`, `TFMDocumentHandler`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua new, populateGroupWithDocParms, getValue → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDocumentParametersEdit instance = new TFMDocumentParametersEdit(<args>);` rồi `instance.populateGroupWithDocParms(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocumentQueueCleanup`
1. **Tên class:** `TFMDocumentQueueCleanup`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (document queue cleanup); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `fieldChoice` (DialogField) — field/trường choice; `queryRun` (QueryRun) — query run; `historyLimit` (int) — history limit; `dialogHistoryLimit` (DialogField) — dialog history limit
4. **Method chính và khi nào dùng:** `canGoBatch` — khi cần kiểm tra điều kiện; `dialog` — khi cần xem method body để xác định hành vi; `canRunInNewSession` — khi cần kiểm tra điều kiện; `getFromDialog` — khi cần lấy hoặc tra cứu; `initParmDefault` — khi cần khởi tạo/xây dựng; `Construct` — khi cần khởi tạo/xây dựng; `new` — khi cần khởi tạo/xây dựng; `pack` — khi cần xem method body để xác định hành vi; … còn 6 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `RunBaseBatch`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua canGoBatch, dialog, canRunInNewSession → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMDocumentQueueCleanup instance = TFMDocumentQueueCleanup::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocumentQueueProcessor`
1. **Tên class:** `TFMDocumentQueueProcessor`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (document queue processor); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `queryRun` (QueryRun) — query run
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `pack` — khi cần xem method body để xác định hành vi; `canRunInNewSession` — khi cần kiểm tra điều kiện; `queryRun` — khi cần xem method body để xác định hành vi; `resetQuery` — khi cần xem method body để xác định hành vi; `run` — khi cần thực thi xử lý; `showQueryValues` — khi cần xem method body để xác định hành vi; `unpack` — khi cần xem method body để xác định hành vi; … còn 5 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `RunBaseBatch`. Dependency trong source: `TFMInputHandler`, `TFMRequestElement`, `TFMXmlDeserializer`, `TFMDocumentTypeProvider`, `TFMDocumentConnector`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua new, pack, canRunInNewSession → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMDocumentQueueProcessor instance = TFMDocumentQueueProcessor::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocumentTreeBuilder`
1. **Tên class:** `TFMDocumentTreeBuilder`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (document tree builder); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `tree` (FormTreeControl) — tree; `expMap` (Map) — exp map; `id2idx` (Map) — id2idx; `idx2id` (Map) — idx2id; `contextId2Name` (Map) — ngữ cảnh id2 tên/định danh; `contextId2Record` (Map) — ngữ cảnh id2 record; `idCounter` (int) — mã định danh counter; `onlyParms` (boolean) — only parms; `onlyFilters` (boolean) — only filters; `fgc` (FormGroupControl) — fgc; `currentClass` (ClassName) — current class; `parmEditMethod` (TFMDocumentParametersEdit) — parm edit method
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Construct` — khi cần khởi tạo/xây dựng; `setOnlyParms` — khi cần ghi/cập nhật state; `setOnlyFilters` — khi cần ghi/cập nhật state; `buildTree` — khi cần khởi tạo/xây dựng; `addTreeItemId` — khi cần ghi/cập nhật state; `selectionChanged` — khi cần xem method body để xác định hành vi; `getContextMenuOptions` — khi cần lấy hoặc tra cứu; … còn 3 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMDocumentParametersEdit`. Dependency trong source: `TFMDocumentHandler`, `TFMReferenceDataMethodAttribute`, `TFMParameterAttribute`, `TFMFormLookupHelper`, `TFMReferenceDataConfiguration`, `TFMRegistrationCollector`, `TFMHelper`, `TFMAttributeHandler`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, Construct, setOnlyParms → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMDocumentTreeBuilder instance = TFMDocumentTreeBuilder::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocumentTypeAttribute`
1. **Tên class:** `TFMDocumentTypeAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (document type attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `documentType` (TFMDocumentTypeId) — document loại; `contentType` (TFMDocumentContentSubject) — content loại; `methodName` (MethodName) — method tên/định danh
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmContentType` — khi cần đọc/ghi tham số; `parmDocumentType` — khi cần đọc/ghi tham số; `getMethodName` — khi cần lấy hoặc tra cứu; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`. Dependency trong source: `TFMGetRegistrationConfiguration`, `TFMPostAdhocRegistration`, `TFMLookup`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua new, parmContentType, parmDocumentType → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDocumentTypeAttribute instance = new TFMDocumentTypeAttribute(<args>);` rồi `instance.parmContentType(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocumentTypeProvider`
1. **Tên class:** `TFMDocumentTypeProvider`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Service/Provider (document type provider); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `cachedHandlerIds` (Map) — cached handler ids
4. **Method chính và khi nào dùng:** `instance` — khi cần xem method body để xác định hành vi; `handler` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `getHandler` — khi cần lấy hoặc tra cứu; `getHandlerId` — khi cần lấy hoặc tra cứu; `getTypes` — khi cần lấy hoặc tra cứu; `updateMap` — khi cần ghi/cập nhật state; `invalidateProvider` — khi cần xem method body để xác định hành vi; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMProvider`. Dependency trong source: `TFMInputHandler`, `TFMDocumentHandler`, `TFMOrderListGetOrdersDocumentTypeAttribute`, `TFMOrderListGetOrderLinesDocumentTypeAttribute`, `TFMOrderListPostOrderDocumentTypeAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/process/request context (tham số của method public hoặc state của instance) → xử lý chọn handler/service hoặc serialize output qua instance, handler, new → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDocumentTypeProvider instance = new TFMDocumentTypeProvider(<args>);` rồi `instance.instance(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: dùng đúng factory, cache và runtime context; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDocWorkLog`
1. **Tên class:** `TFMDocWorkLog`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (doc work log); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `description` — khi cần xem method body để xác định hành vi; `addTranslations` — khi cần ghi/cập nhật state; `pages` — khi cần xem method body để xác định hành vi; `workLogLookup` — khi cần xem method body để xác định hành vi; `lookup2Registration` — khi cần lấy hoặc tra cứu; `UpdateNameMap` — khi cần ghi/cập nhật state; `getLabelsFromDocuments` — khi cần lấy hoặc tra cứu; `WorkLogCfgHeader` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentHandler`. Dependency trong source: `TFMLookup`, `TFMimageHandlerCombinedImages`, `TFMPages`, `TFMPageLookup`, `TFMPageLookupConfiguration`, `TFMListWorkLogList`, `TFMLookupResponseElement`, `TFMRequestElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua description, addTranslations, pages → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDocWorkLog instance = new TFMDocWorkLog(<args>);` rồi `instance.description(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowBlockStyle`
1. **Tên class:** `TFMDrawFlowBlockStyle`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (draw flow block style); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `styleProvidedForThisClass` — khi cần xem method body để xác định hành vi; `htmlForClass` — khi cần xem method body để xác định hành vi; `findStyleClass` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMDocGetMedia`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua styleProvidedForThisClass, htmlForClass, findStyleClass → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawFlowBlockStyle instance = new TFMDrawFlowBlockStyle(<args>);` rồi `instance.styleProvidedForThisClass(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowBlockStyleBlock`
1. **Tên class:** `TFMDrawFlowBlockStyleBlock`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (draw flow block style block); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `styleProvidedForThisClass` — khi cần xem method body để xác định hành vi; `htmlForClass` — khi cần xem method body để xác định hành vi; `addOutputLabels` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDrawFlowBlockStyle`. Dependency trong source: `TFMLogicBlock`, `TFMDocGetMedia`, `TFMLogicBlockDataCollectionInterface`, `TFMLogicBlockPostAdhocRegistrationInterface`, `TFMLogicStepOperatorInterface`, `TFMLogicInputOutputContainer`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua styleProvidedForThisClass, htmlForClass, addOutputLabels → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawFlowBlockStyleBlock instance = new TFMDrawFlowBlockStyleBlock(<args>);` rồi `instance.styleProvidedForThisClass(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowBlockStyleCondition`
1. **Tên class:** `TFMDrawFlowBlockStyleCondition`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (draw flow block style condition); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `styleProvidedForThisClass` — khi cần xem method body để xác định hành vi; `htmlForClass` — khi cần xem method body để xác định hành vi; `addOutputLabels` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDrawFlowBlockStyle`. Dependency trong source: `TFMCondition`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua styleProvidedForThisClass, htmlForClass, addOutputLabels → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawFlowBlockStyleCondition instance = new TFMDrawFlowBlockStyleCondition(<args>);` rồi `instance.styleProvidedForThisClass(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowBlockStyleRegistrationCollector`
1. **Tên class:** `TFMDrawFlowBlockStyleRegistrationCollector`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (draw flow block style registration collector); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `styleProvidedForThisClass` — khi cần xem method body để xác định hành vi; `htmlForClass` — khi cần xem method body để xác định hành vi; `getInputHtmlForType` — khi cần lấy hoặc tra cứu; `findResourceForCollector` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDrawFlowBlockStyle`. Dependency trong source: `TFMRegistrationCollector`, `TFMDrawFlowControlInteraction`, `TFMProcess`, `TFMLogicBlockCollection`, `TFMLogicBlock`, `TFMDocGetMedia`, `TFMListVisualization`, `TFMRegistrationCollectorDate`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua styleProvidedForThisClass, htmlForClass, getInputHtmlForType → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawFlowBlockStyleRegistrationCollector instance = new TFMDrawFlowBlockStyleRegistrationCollector(<args>);` rồi `instance.styleProvidedForThisClass(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowConnectionContract`
1. **Tên class:** `TFMDrawFlowConnectionContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (draw flow connection contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `outputId` (int) — output mã định danh; `outputClass` (str) — output class; `inputClass` (str) — input class; `inputId` (int) — input mã định danh
4. **Method chính và khi nào dùng:** `parmOutputId` — khi cần đọc/ghi tham số; `parmInputId` — khi cần đọc/ghi tham số; `parmOutputClass` — khi cần đọc/ghi tham số; `parmInputClass` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmOutputId, parmInputId, parmOutputClass → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawFlowConnectionContract instance = new TFMDrawFlowConnectionContract(<args>);` rồi `instance.parmOutputId(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowContract`
1. **Tên class:** `TFMDrawFlowContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (draw flow contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `moduleContract` (TFMDrawFlowModuleContract) — module contract
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Construct` — khi cần khởi tạo/xây dựng; `parmModuleContract` — khi cần đọc/ghi tham số; `addBlockContract` — khi cần ghi/cập nhật state; `getBlocks` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMDrawFlowModuleContract`. Dependency trong source: `TFMDrawFlowLogicBlockContract`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, Construct, parmModuleContract → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMDrawFlowContract instance = TFMDrawFlowContract::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowControl`
1. **Tên class:** `TFMDrawFlowControl`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Form/UI (draw flow control); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `keyId` (str) — key mã định danh; `updateViewProperty` (FormProperty) — update view property; `updateBlocksProperty` (FormProperty) — update blocks property; `updateEditorModeProperty` (FormProperty) — update editor mode property; `deleteConnection` (FormProperty) — delete connection; `className` (FormProperty) — class tên/định danh; `sendUpdatingToJavascriptProperty` (FormProperty) — send updating to javascript property; `sendNotUpdatingToJavascriptProperty` (FormProperty) — send not updating to javascript property; `sendNodeSelectedToJavascriptProperty` (FormProperty) — send node selected to javascript property; `updateSingleNodeProperty` (FormProperty) — update single node property; `jsonMediator` (TFMDrawFlowJsonCreator) — json mediator; `interactionClass` (TFMDrawFlowControlInteraction) — interaction class; … còn 3 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `applyBuild` — khi cần xem method body để xác định hành vi; `sendUpdatingToControl` — khi cần xem method body để xác định hành vi; `sendNotUpdatingToControl` — khi cần xem method body để xác định hành vi; `GetLogicBlocks` — khi cần lấy hoặc tra cứu; `updateHtmlForNode` — khi cần ghi/cập nhật state; `saveBlocks` — khi cần xem method body để xác định hành vi; `nodeSelected` — khi cần xem method body để xác định hành vi; … còn 19 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `FormTemplateContainerControl`. Composition/member fields: `TFMDrawFlowJsonCreator`, `TFMDrawFlowControlInteraction`. Dependency trong source: `TFMDrawFlowControlBuild`, `TFMDrawFlowLogicBlockContract`, `TFMDrawFlowLogicBlockDataContract`, `TFMDrawFlowContract`, `TFMJsonSerializer`, `TFMDrawFlowConnectionContract`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input Args, record và control state (tham số của method public hoặc state của instance) → xử lý form/helper xử lý UI hoặc cấu hình qua new, applyBuild, sendUpdatingToControl → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawFlowControl instance = new TFMDrawFlowControl(<args>);` rồi `instance.applyBuild(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: caller context, form lifecycle, permissions và null buffers; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowControlBuild`
1. **Tên class:** `TFMDrawFlowControlBuild`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Form/UI (draw flow control build); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `className` (ClassName) — class tên/định danh
4. **Method chính và khi nào dùng:** `parmClassName` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `FormBuildContainerControl`. Dependency trong source: `TFMDrawFlowControl`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input Args, record và control state (tham số của method public hoặc state của instance) → xử lý form/helper xử lý UI hoặc cấu hình qua parmClassName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawFlowControlBuild instance = new TFMDrawFlowControlBuild(<args>);` rồi `instance.parmClassName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: caller context, form lifecycle, permissions và null buffers; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowControlInteraction`
1. **Tên class:** `TFMDrawFlowControlInteraction`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Form/UI (draw flow control interaction); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `jsonMediator` (TFMDrawFlowJsonCreator) — json mediator; `keyId` (str) — key mã định danh; `fgc` (FormGroupControl) — fgc; `flowControl` (TFMDrawFlowControl) — flow control
4. **Method chính và khi nào dùng:** `blockList` — khi cần xem method body để xác định hành vi; `saveData` — khi cần xem method body để xác định hành vi; `nodeCreated` — khi cần xem method body để xác định hành vi; `nodeDeleted` — khi cần xem method body để xác định hành vi; `allowConnection` — khi cần xem method body để xác định hành vi; `connectionDeleted` — khi cần xem method body để xác định hành vi; `getData` — khi cần lấy hoặc tra cứu; `setFlowControl` — khi cần ghi/cập nhật state; … còn 5 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMDrawFlowJsonCreator`, `TFMDrawFlowControl`. Dependency trong source: `TFMLogicBlocksContract`, `TFMDrawFlowLogicBlockContract`, `TFMDrawFlowConnectionContract`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input Args, record và control state (tham số của method public hoặc state của instance) → xử lý form/helper xử lý UI hoặc cấu hình qua blockList, saveData, nodeCreated → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: caller context, form lifecycle, permissions và null buffers; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFLowControlInteractionBlockSteps`
1. **Tên class:** `TFMDrawFLowControlInteractionBlockSteps`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (draw f low control interaction block steps); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `collectors` (TFMRegistrationCollectors) — collectors; `dummyRequest` (TFMRequestElement) — dummy request; `contextObject` (TFMLogicContext) — ngữ cảnh object; `nodeIDs2Collector` (Map) — node i ds2 collector; `collector` (TFMRegistrationCollector) — collector; `blockBuffer` (TFMCustomBlocks) — block buffer; `nodeId2Name` (Map) — node id2 tên/định danh; `latestId` (int) — latest mã định danh
4. **Method chính và khi nào dùng:** `blockList` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `saveData` — khi cần xem method body để xác định hành vi; `SetCustomBlock` — khi cần ghi/cập nhật state; `nodeCreated` — khi cần xem method body để xác định hành vi; `nodeDeleted` — khi cần xem method body để xác định hành vi; `allowEdit` — khi cần xem method body để xác định hành vi; `getData` — khi cần lấy hoặc tra cứu; … còn 3 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDrawFlowControlInteraction`. Composition/member fields: `TFMRegistrationCollectors`, `TFMRequestElement`, `TFMLogicContext`, `TFMRegistrationCollector`. Dependency trong source: `TFMLogicBlocksContract`, `TFMDocGetMedia`, `TFMDrawFlowContract`, `TFMJsonSerializer`, `TFMDrawFlowLogicBlockContract`, `TFMDrawFlowJsonCreatorRegistrationCollectors`, `TFMProcess`, `TFMLogicBlockCollection`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua blockList, new, saveData → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawFLowControlInteractionBlockSteps instance = new TFMDrawFLowControlInteractionBlockSteps(<args>);` rồi `instance.blockList(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowControlInteractionLogicBlocks`
1. **Tên class:** `TFMDrawFlowControlInteractionLogicBlocks`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (draw flow control interaction logic blocks); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `latestId` (int) — latest mã định danh; `process` (TFMProcess) — process
4. **Method chính và khi nào dùng:** `SetProcess` — khi cần ghi/cập nhật state; `blockList` — khi cần xem method body để xác định hành vi; `saveData` — khi cần xem method body để xác định hành vi; `validateBeforeSaving` — khi cần kiểm tra điều kiện; `nodeCreated` — khi cần xem method body để xác định hành vi; `nodeDeleted` — khi cần xem method body để xác định hành vi; `getData` — khi cần lấy hoặc tra cứu; `clearContextPane` — khi cần ghi/cập nhật state; … còn 5 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDrawFlowControlInteraction`. Composition/member fields: `TFMProcess`. Dependency trong source: `TFMLogicBlock`, `TFMLogicBlocksContract`, `TFMLogicBlockDataCollectionInterface`, `TFMLogicStepOperatorInterface`, `TFMLogicBlockPostAdhocRegistrationInterface`, `TFMDocGetMedia`, `TFMDrawFlowContract`, `TFMJsonSerializer`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua SetProcess, blockList, saveData → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawFlowControlInteractionLogicBlocks instance = new TFMDrawFlowControlInteractionLogicBlocks(<args>);` rồi `instance.SetProcess(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowControlInteractionStepConditions`
1. **Tên class:** `TFMDrawFlowControlInteractionStepConditions`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (draw flow control interaction step conditions); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `dummyRequest` (TFMRequestElement) — dummy request; `contextObject` (TFMLogicContext) — ngữ cảnh object; `conditions` (TFMConditions) — conditions; `activeCondition` (TFMCondition) — trạng thái hoạt động condition; `methodName` (MethodName) — method tên/định danh; `lookupOptions` (Map) — lookup options; `returnType` (TFMLogicContextTypes) — return loại; `domain` (str) — domain; `processId` (TFMProcessID) — process mã định danh; `version` (Version) — phiên bản; `process` (TFMProcess) — process; `stepName` (str) — step tên/định danh; … còn 6 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `blockList` — khi cần xem method body để xác định hành vi; `parmConditions` — khi cần đọc/ghi tham số; `parmBlockName` — khi cần đọc/ghi tham số; `parmMethodName` — khi cần đọc/ghi tham số; `getProcessId` — khi cần lấy hoặc tra cứu; `getDomain` — khi cần lấy hoặc tra cứu; `getVersion` — khi cần lấy hoặc tra cứu; `setDomainAndProcess` — khi cần ghi/cập nhật state; … còn 24 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDrawFlowControlInteraction`. Composition/member fields: `TFMRequestElement`, `TFMLogicContext`, `TFMConditions`, `TFMCondition`, `TFMProcess`, `TFMHtmlViewerCtrl`. Dependency trong source: `TFMLogicBlocksContract`, `TFMLogicContextObject`, `TFMDocGetMedia`, `TFMProcessProvider`, `TFMDrawFlowConnectionContract`, `TFMConnectedConditions`, `TFMDrawFlowLogicBlockContract`, `TFMLogicContextTools`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua blockList, parmConditions, parmBlockName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawFlowControlInteractionStepConditions instance = new TFMDrawFlowControlInteractionStepConditions(<args>);` rồi `instance.blockList(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowControlInteractionSteps`
1. **Tên class:** `TFMDrawFlowControlInteractionSteps`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (draw flow control interaction steps); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `collectors` (TFMRegistrationCollectors) — collectors; `dummyRequest` (TFMRequestElement) — dummy request; `contextObject` (TFMLogicContext) — ngữ cảnh object; `nodeIDs2Collector` (Map) — node i ds2 collector; `collector` (TFMRegistrationCollector) — collector; `process` (TFMProcess) — process
4. **Method chính và khi nào dùng:** `blockList` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `SetProcess` — khi cần ghi/cập nhật state; `saveData` — khi cần xem method body để xác định hành vi; `nodeCreated` — khi cần xem method body để xác định hành vi; `nodeDeleted` — khi cần xem method body để xác định hành vi; `allowEdit` — khi cần xem method body để xác định hành vi; `getCollectors` — khi cần lấy hoặc tra cứu; … còn 8 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDrawFlowControlInteraction`. Composition/member fields: `TFMRegistrationCollectors`, `TFMRequestElement`, `TFMLogicContext`, `TFMRegistrationCollector`, `TFMProcess`. Dependency trong source: `TFMRequestBasicElement`, `TFMDrawFlowLogicBlockContract`, `TFMDrawFlowJsonCreator`, `TFMLogicBlockCollection`, `TFMDrawFlowJsonCreatorRegistrationCollectors`, `TFMDrawFlowJsonCreatorWorkLog`, `TFMDrawFlowBlockStyleRegistrationCollector`, `TFMDrawFlowBlockStyle`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua blockList, new, SetProcess → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawFlowControlInteractionSteps instance = new TFMDrawFlowControlInteractionSteps(<args>);` rồi `instance.blockList(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowControlInteractionWorkLog`
1. **Tên class:** `TFMDrawFlowControlInteractionWorkLog`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Form/UI (draw flow control interaction work log); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `workLogForm` (TFMWorkLogForm) — work log form
4. **Method chính và khi nào dùng:** `blockList` — khi cần xem method body để xác định hành vi; `saveData` — khi cần xem method body để xác định hành vi; `nodeCreated` — khi cần xem method body để xác định hành vi; `nodeDeleted` — khi cần xem method body để xác định hành vi; `allowEdit` — khi cần xem method body để xác định hành vi; `setWorkLogFormClass` — khi cần ghi/cập nhật state; `getData` — khi cần lấy hoặc tra cứu; `nodeSelected` — khi cần xem method body để xác định hành vi; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDrawFlowControlInteraction`. Composition/member fields: `TFMWorkLogForm`. Dependency trong source: `TFMDrawFlowLogicBlockContract`, `TFMDrawFlowJsonCreator`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input Args, record và control state (tham số của method public hoặc state của instance) → xử lý form/helper xử lý UI hoặc cấu hình qua blockList, saveData, nodeCreated → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawFlowControlInteractionWorkLog instance = new TFMDrawFlowControlInteractionWorkLog(<args>);` rồi `instance.blockList(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: caller context, form lifecycle, permissions và null buffers; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowDataContract`
1. **Tên class:** `TFMDrawFlowDataContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (draw flow data contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `data` (Map) — dữ liệu
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Construct` — khi cần khởi tạo/xây dựng; `parmData` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMDrawFlowLogicBlockContract`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, Construct, parmData → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMDrawFlowDataContract instance = TFMDrawFlowDataContract::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowJsonCreator`
1. **Tên class:** `TFMDrawFlowJsonCreator`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (draw flow json creator); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `ConstructAndGetJson` — khi cần khởi tạo/xây dựng; `Construct` — khi cần khởi tạo/xây dựng; `classHandled` — khi cần xem method body để xác định hành vi; `jSon` — khi cần xem method body để xác định hành vi; `instanceFromJson` — khi cần xem method body để xác định hành vi; `saveJson2Data` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua ConstructAndGetJson, Construct, classHandled → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowJsonCreatorConditionEditor`
1. **Tên class:** `TFMDrawFlowJsonCreatorConditionEditor`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (draw flow json creator condition editor); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `depthBreadth` (Map) — depth breadth; `returnType` (TFMLogicContextTypes) — return loại; `stepName` (str) — step tên/định danh; `methodName` (MethodName) — method tên/định danh; `horizontalBlockSpace` (int) — horizontal block space; `verticalBlockSpace` (int) — vertical block space
4. **Method chính và khi nào dùng:** `classHandled` — khi cần xem method body để xác định hành vi; `parmReturnType` — khi cần đọc/ghi tham số; `parmStepName` — khi cần đọc/ghi tham số; `jSon` — khi cần xem method body để xác định hành vi; `updateContractDepthWise` — khi cần ghi/cập nhật state; `instanceFromJson` — khi cần xem method body để xác định hành vi; `saveJson2Data` — khi cần xem method body để xác định hành vi; `createContractEntry` — khi cần khởi tạo/xây dựng; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDrawFlowJsonCreator`. Dependency trong source: `TFMConditions`, `TFMCondition`, `TFMConnectedConditions`, `TFMDrawFlowContract`, `TFMDrawFlowLogicBlockContract`, `TFMJsonSerializer`, `TFMDrawFlowBlockStyle`, `TFMLogicContextFunctionsDataContract`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua classHandled, parmReturnType, parmStepName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawFlowJsonCreatorConditionEditor instance = new TFMDrawFlowJsonCreatorConditionEditor(<args>);` rồi `instance.classHandled(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowJsonCreatorLogicBlockCollection`
1. **Tên class:** `TFMDrawFlowJsonCreatorLogicBlockCollection`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (draw flow json creator logic block collection); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `blockname2Id` (Map) — blockname2 mã định danh; `blockContracts` (Map) — block contracts; `depthBreadth` (Map) — depth breadth
4. **Method chính và khi nào dùng:** `classHandled` — khi cần xem method body để xác định hành vi; `jSon` — khi cần xem method body để xác định hành vi; `instanceFromJson` — khi cần xem method body để xác định hành vi; `saveJson2Data` — khi cần xem method body để xác định hành vi; `buildBlockNodeGraph` — khi cần khởi tạo/xây dựng; `createTreeNode` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDrawFlowJsonCreator`. Dependency trong source: `TFMProcess`, `TFMLogicBlockCollection`, `TFMLogicBlock`, `TFMBlockConnectionNode`, `TFMDrawFlowContract`, `TFMJsonSerializer`, `TFMDrawFlowLogicBlockContract`, `TFMDrawFlowLogicBlockInputsOutputs`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua classHandled, jSon, instanceFromJson → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawFlowJsonCreatorLogicBlockCollection instance = new TFMDrawFlowJsonCreatorLogicBlockCollection(<args>);` rồi `instance.classHandled(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowJsonCreatorRegistrationCollectors`
1. **Tên class:** `TFMDrawFlowJsonCreatorRegistrationCollectors`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (draw flow json creator registration collectors); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `blockContracts` (Map) — block contracts; `depthMap` (Map) — depth map; `HeaderCollectors` (Set) — header collectors; `blockname2Id` (Map) — blockname2 mã định danh; `tracks` (Map) — tracks; `trackNodes2update` (Map) — track nodes2update; `trackXs` (Map) — track xs; `nodeId2Collector` (Map) — node id2 collector; `trackStarts` (Map) — track starts; `collection` (TFMLogicBlockCollection) — collection; `sectionContracts` (Map) — section contracts; `interactionClass` (TFMDrawFlowControlInteraction) — interaction class; … còn 1 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `classHandled` — khi cần xem method body để xác định hành vi; `jSon` — khi cần xem method body để xác định hành vi; `connectContracts` — khi cần xem method body để xác định hành vi; `updateNodesPlacement` — khi cần ghi/cập nhật state; `setConnectionsInAllTracks` — khi cần ghi/cập nhật state; `nextNodeForTrack` — khi cần xem method body để xác định hành vi; `incrementTrack` — khi cần xem method body để xác định hành vi; `buildBlockNodeGraph` — khi cần khởi tạo/xây dựng; … còn 6 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDrawFlowJsonCreator`. Composition/member fields: `TFMLogicBlockCollection`, `TFMDrawFlowControlInteraction`. Dependency trong source: `TFMLogicBlock`, `TFMBlockConnectionNode`, `TFMDrawFlowContract`, `TFMRegistrationCollector`, `TFMDrawFlowLogicBlockContract`, `TFMDrawFlowJsonCreatorWorkLog`, `TFMJsonSerializer`, `TFMDrawFlowLogicBlockConnectionContract`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua classHandled, jSon, connectContracts → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawFlowJsonCreatorRegistrationCollectors instance = new TFMDrawFlowJsonCreatorRegistrationCollectors(<args>);` rồi `instance.classHandled(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowJsonCreatorWorkLog`
1. **Tên class:** `TFMDrawFlowJsonCreatorWorkLog`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (draw flow json creator work log); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `collectors` (TFMRegistrationCollectors) — collectors; `headerContractID` (int) — header contract mã định danh
4. **Method chính và khi nào dùng:** `classHandled` — khi cần xem method body để xác định hành vi; `jSon` — khi cần xem method body để xác định hành vi; `resultContract` — khi cần xem method body để xác định hành vi; `headerContract` — khi cần xem method body để xác định hành vi; `instanceFromJson` — khi cần xem method body để xác định hành vi; `saveJson2Data` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDrawFlowJsonCreator`. Composition/member fields: `TFMRegistrationCollectors`. Dependency trong source: `TFMWorkLogForm`, `TFMDrawFlowContract`, `TFMDrawFlowLogicBlockContract`, `TFMRegistrationCollector`, `TFMDrawFlowJsonCreatorRegistrationCollectors`, `TFMJsonSerializer`, `TFMTranslationProvider`, `TFMDrawFlowLogicBlockDataContract`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua classHandled, jSon, resultContract → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawFlowJsonCreatorWorkLog instance = new TFMDrawFlowJsonCreatorWorkLog(<args>);` rồi `instance.classHandled(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowLogicBlockConnectionContract`
1. **Tên class:** `TFMDrawFlowLogicBlockConnectionContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (draw flow logic block connection contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `node` (str) — node; `output` (str) — output; `input` (str) — input
4. **Method chính và khi nào dùng:** `parmNode` — khi cần đọc/ghi tham số; `parmOutput` — khi cần đọc/ghi tham số; `parmInput` — khi cần đọc/ghi tham số; `Construct` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua parmNode, parmOutput, parmInput → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMDrawFlowLogicBlockConnectionContract instance = TFMDrawFlowLogicBlockConnectionContract::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowLogicBlockContract`
1. **Tên class:** `TFMDrawFlowLogicBlockContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (draw flow logic block contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `id` (int) — mã định danh; `name` (Name) — tên/định danh; `data` (TFMDrawFlowLogicBlockDataContract) — dữ liệu; `html` (str) — html; `cssClass` (str) — css class; `posY` (real) — pos y; `posX` (real) — pos x; `inputs` (Map) — inputs; `outputs` (Map) — outputs
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `nextOutput` — khi cần xem method body để xác định hành vi; `parmId` — khi cần đọc/ghi tham số; `parmPosX` — khi cần đọc/ghi tham số; `parmPosY` — khi cần đọc/ghi tham số; `parmName` — khi cần đọc/ghi tham số; `parmData` — khi cần đọc/ghi tham số; `parmInputs` — khi cần đọc/ghi tham số; … còn 4 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMDrawFlowLogicBlockDataContract`. Dependency trong source: `TFMDrawFlowLogicBlockInputsOutputs`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua new, nextOutput, parmId → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawFlowLogicBlockContract instance = new TFMDrawFlowLogicBlockContract(<args>);` rồi `instance.nextOutput(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowLogicBlockDataContract`
1. **Tên class:** `TFMDrawFlowLogicBlockDataContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (draw flow logic block data contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `blockName` (Name) — block tên/định danh; `className` (ClassName) — class tên/định danh; `editorName` (Name) — editor tên/định danh
4. **Method chính và khi nào dùng:** `parmBlockName` — khi cần đọc/ghi tham số; `parmClassName` — khi cần đọc/ghi tham số; `parmEditorName` — khi cần đọc/ghi tham số; `Construct` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua parmBlockName, parmClassName, parmEditorName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMDrawFlowLogicBlockDataContract instance = TFMDrawFlowLogicBlockDataContract::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowLogicBlockInputsOutputs`
1. **Tên class:** `TFMDrawFlowLogicBlockInputsOutputs`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (draw flow logic block inputs outputs); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `connection` (List) — connection
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Construct` — khi cần khởi tạo/xây dựng; `parmConnection` — khi cần đọc/ghi tham số; `updateBlockLinkMap` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMDrawFlowLogicBlockConnectionContract`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua new, Construct, parmConnection → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMDrawFlowLogicBlockInputsOutputs instance = TFMDrawFlowLogicBlockInputsOutputs::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawFlowModuleContract`
1. **Tên class:** `TFMDrawFlowModuleContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (draw flow module contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `dataContract` (TFMDrawFlowDataContract) — dữ liệu contract
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Construct` — khi cần khởi tạo/xây dựng; `parmDataContract` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMDrawFlowDataContract`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, Construct, parmDataContract → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMDrawFlowModuleContract instance = TFMDrawFlowModuleContract::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawPage`
1. **Tên class:** `TFMDrawPage`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (draw page); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `contentWidth` (int) — content width
4. **Method chính và khi nào dùng:** `DrawPage` — khi cần xem method body để xác định hành vi; `getMenuItemButtons` — khi cần lấy hoặc tra cứu; `drawWithDevice` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMPage`, `TFMHtmlViewerCtrl`, `TFMPages`, `TFMMenuItemStateConfiguration`, `TFMPageMenuItemsFormHelper`, `TFMListRow`, `TFMDocGetMedia`, `TFMListVisualization`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua DrawPage, getMenuItemButtons, drawWithDevice → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawPageLists`
1. **Tên class:** `TFMDrawPageLists`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (draw page lists); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `DrawPage` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDrawPage`. Dependency trong source: `TFMPage`, `TFMHtmlViewerCtrl`, `TFMTranslationProvider`, `TFMPages`, `TFMPagesProvider`, `TFMListVisualization`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua DrawPage → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawPageLists instance = new TFMDrawPageLists(<args>);` rồi `instance.DrawPage(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawPageMenu`
1. **Tên class:** `TFMDrawPageMenu`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (draw page menu); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `DrawPage` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDrawPage`. Dependency trong source: `TFMPage`, `TFMHtmlViewerCtrl`, `TFMTranslationProvider`, `TFMPages`, `TFMPagesProvider`, `TFMDocGetMedia`, `TFMListVisualization`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua DrawPage → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawPageMenu instance = new TFMDrawPageMenu(<args>);` rồi `instance.DrawPage(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMDrawPageUnplannedItemRegistration`
1. **Tên class:** `TFMDrawPageUnplannedItemRegistration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (draw page unplanned item registration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `DrawPage` — khi cần xem method body để xác định hành vi; `drawFilter` — khi cần xem method body để xác định hành vi; `findFilterFields` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDrawPage`. Dependency trong source: `TFMPage`, `TFMHtmlViewerCtrl`, `TFMTranslationProvider`, `TFMPages`, `TFMPagesProvider`, `TFMFormLookupHelper`, `TFMListVisualization`, `TFMDocumentHandler`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua DrawPage, drawFilter, findFilterFields → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMDrawPageUnplannedItemRegistration instance = new TFMDrawPageUnplannedItemRegistration(<args>);` rồi `instance.DrawPage(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMExportFonts`
1. **Tên class:** `TFMExportFonts`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (export fonts); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `main` — khi cần xem method body để xác định hành vi; `GetConfigurationXmlForFonts` — khi cần lấy hoặc tra cứu; `sendFileToUser` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua main, GetConfigurationXmlForFonts, sendFileToUser → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMExportFonts instance = new TFMExportFonts(<args>);` rồi `instance.main(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMExportLists`
1. **Tên class:** `TFMExportLists`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (export lists); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `onlySelected` (DialogField) — only selected; `exportOpen` (DialogField) — export open; `args` (Args) — args; `latestList` (str) — latest danh sách
4. **Method chính và khi nào dùng:** `main` — khi cần xem method body để xác định hành vi; `setArgs` — khi cần ghi/cập nhật state; `pack` — khi cần xem method body để xác định hành vi; `unpack` — khi cần xem method body để xác định hành vi; `canRunInNewSession` — khi cần kiểm tra điều kiện; `dialog` — khi cần xem method body để xác định hành vi; `run` — khi cần thực thi xử lý; `GetConfigurationXmlForLists` — khi cần lấy hoặc tra cứu; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `RunBase`. Dependency trong source: `TFMExportFonts`, `TFMList`, `TFMListsProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua main, setArgs, pack → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMExportLists instance = new TFMExportLists(<args>);` rồi `instance.main(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMExportSetup`
1. **Tên class:** `TFMExportSetup`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (export setup); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `checkmarkField` (DialogField) — checkmark field/trường; `fields` (Map) — fields; `dlg` (DialogGroup) — dlg; `printFromBuffer` (Common) — print from buffer; `qty` (int) — qty
4. **Method chính và khi nào dùng:** `dialog` — khi cần xem method body để xác định hành vi; `getTables` — khi cần lấy hoặc tra cứu; `setBuffer` — khi cần ghi/cập nhật state; `prompt` — khi cần xem method body để xác định hành vi; `getFromDialog` — khi cần lấy hoặc tra cứu; `canRunInNewSession` — khi cần kiểm tra điều kiện; `run` — khi cần thực thi xử lý; `sendFileToUser` — khi cần xem method body để xác định hành vi; … còn 5 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `RunBase`. Dependency trong source: `TFMVersion`, `TFMDocumentHandler`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua dialog, getTables, setBuffer → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMExportSetup instance = new TFMExportSetup(<args>);` rồi `instance.dialog(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMExpressionEditorFormClass`
1. **Tên class:** `TFMExpressionEditorFormClass`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Form/UI (expression editor form class); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `parmGroup` (FormGroupControl) — parm group; `primaryParmBox` (FormListBoxControl) — primary parm box; `latestCommand` (str) — latest command; `firstParmText` (FormStringControl) — first parm text; `Currentexpression` (str) — currentexpression; `currentExpStrControl` (FormStringControl) — current exp str control; `htmlHelp` (TFMHtmlViewerCtrl) — html help
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `modifiedStr` — khi cần xem method body để xác định hành vi; `updateParmGroup` — khi cần ghi/cập nhật state; `commandBoxChanged` — khi cần xem method body để xác định hành vi; `parmGroupSelectionChanged` — khi cần đọc/ghi tham số; `updateExpression` — khi cần ghi/cập nhật state; `getAllParameters` — khi cần lấy hoặc tra cứu; `currentExpression` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMHtmlViewerCtrl`. Dependency trong source: `TFMExpressions`, `TFMHelper`, `TFMDescriptionAttribute`, `TFMDocumentConnector`, `TFMFormXMLFormatter`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input Args, record và control state (tham số của method public hoặc state của instance) → xử lý form/helper xử lý UI hoặc cấu hình qua new, modifiedStr, updateParmGroup → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMExpressionEditorFormClass instance = new TFMExpressionEditorFormClass(<args>);` rồi `instance.modifiedStr(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: caller context, form lifecycle, permissions và null buffers; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMExpressions`
1. **Tên class:** `TFMExpressions`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (expressions); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `processExpressionCommon` — khi cần thực thi xử lý; `processExpressionValue` — khi cần thực thi xử lý; `executeExpression` — khi cần thực thi xử lý; `executeRecordFunction` — khi cần thực thi xử lý; `executeStringFunction` — khi cần thực thi xử lý; `evaluateExpression` — khi cần xem method body để xác định hành vi; `getPossibleExpressions` — khi cần lấy hoặc tra cứu; `getDictClassFromName` — khi cần lấy hoặc tra cứu; … còn 2 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMHelper`, `TFMDocCustomFunctionFlow`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua processExpressionCommon, processExpressionValue, executeExpression → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMExpressionsBase64WhiteBack`
1. **Tên class:** `TFMExpressionsBase64WhiteBack`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (expressions base64 white back); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `processExpressionCommon` — khi cần thực thi xử lý; `processExpressionValue` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMExpressions`. Dependency trong source: `TFMImageHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua processExpressionCommon, processExpressionValue → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMExpressionsBase64WhiteBack instance = new TFMExpressionsBase64WhiteBack(<args>);` rồi `instance.processExpressionCommon(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMExpressionsCompanyImage`
1. **Tên class:** `TFMExpressionsCompanyImage`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (expressions company image); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `processExpressionCommon` — khi cần thực thi xử lý; `processExpressionValue` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMExpressions`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua processExpressionCommon, processExpressionValue → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMExpressionsCompanyImage instance = new TFMExpressionsCompanyImage(<args>);` rồi `instance.processExpressionCommon(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMExpressionsGetAttachedNote`
1. **Tên class:** `TFMExpressionsGetAttachedNote`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (expressions get attached note); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `processExpressionCommon` — khi cần thực thi xử lý; `processExpressionValue` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMExpressions`. Dependency trong source: `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua processExpressionCommon, processExpressionValue → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMExpressionsGetAttachedNote instance = new TFMExpressionsGetAttachedNote(<args>);` rồi `instance.processExpressionCommon(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMExpressionsGetAttachedNoteHTML`
1. **Tên class:** `TFMExpressionsGetAttachedNoteHTML`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (expressions get attached note html); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `processExpressionCommon` — khi cần thực thi xử lý; `processExpressionValue` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMExpressions`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua processExpressionCommon, processExpressionValue → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMExpressionsGetAttachedNoteHTML instance = new TFMExpressionsGetAttachedNoteHTML(<args>);` rồi `instance.processExpressionCommon(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMExpressionsGS1Date`
1. **Tên class:** `TFMExpressionsGS1Date`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (expressions gs1 date); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `processExpressionCommon` — khi cần thực thi xử lý; `processExpressionValue` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMExpressions`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua processExpressionCommon, processExpressionValue → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMExpressionsGS1Date instance = new TFMExpressionsGS1Date(<args>);` rồi `instance.processExpressionCommon(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMExpressionsItemImage`
1. **Tên class:** `TFMExpressionsItemImage`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (expressions item image); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `processExpressionCommon` — khi cần thực thi xử lý; `processExpressionValue` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMExpressions`. Dependency trong source: `TFMHelper`, `TFMImageHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua processExpressionCommon, processExpressionValue → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMExpressionsItemImage instance = new TFMExpressionsItemImage(<args>);` rồi `instance.processExpressionCommon(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMExpressionsLabel`
1. **Tên class:** `TFMExpressionsLabel`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (expressions label); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `processExpressionCommon` — khi cần thực thi xử lý; `processExpressionValue` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMExpressions`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua processExpressionCommon, processExpressionValue → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMExpressionsLabel instance = new TFMExpressionsLabel(<args>);` rồi `instance.processExpressionCommon(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMExpressionsPostalAddress`
1. **Tên class:** `TFMExpressionsPostalAddress`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (expressions postal address); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `processExpressionCommon` — khi cần thực thi xử lý; `processExpressionValue` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMExpressions`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua processExpressionCommon, processExpressionValue → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMExpressionsPostalAddress instance = new TFMExpressionsPostalAddress(<args>);` rồi `instance.processExpressionCommon(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMExpressionsProductAttributes`
1. **Tên class:** `TFMExpressionsProductAttributes`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (expressions product attributes); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `processExpressionValue` — khi cần thực thi xử lý; `processExpressionCommon` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMExpressions`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua processExpressionValue, processExpressionCommon → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMExpressionsProductAttributes instance = new TFMExpressionsProductAttributes(<args>);` rồi `instance.processExpressionValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMfieldFromNameCreator`
1. **Tên class:** `TFMfieldFromNameCreator`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (field from name creator); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `exists` — khi cần xem method body để xác định hành vi; `find` — khi cần lấy hoặc tra cứu; `fieldHandled` — khi cần xem method body để xác định hành vi; `handleField` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua exists, find, fieldHandled → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMfieldFromNameCreator instance = new TFMfieldFromNameCreator(<args>);` rồi `instance.exists(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMFieldNameBackendId`
1. **Tên class:** `TFMFieldNameBackendId`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (field name backend id); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `fieldHandled` — khi cần xem method body để xác định hành vi; `handleField` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMfieldFromNameCreator`. Dependency trong source: `TFMConstants`, `TFMBackendIDInstance`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua fieldHandled, handleField → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMFieldNameBackendId instance = new TFMFieldNameBackendId(<args>);` rồi `instance.fieldHandled(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMFieldNameDataSources`
1. **Tên class:** `TFMFieldNameDataSources`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (field name data sources); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMFieldNameDataSources instance = new TFMFieldNameDataSources(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMFieldNameVariables`
1. **Tên class:** `TFMFieldNameVariables`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (field name variables); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `fieldHandled` — khi cần xem method body để xác định hành vi; `handleField` — khi cần xem method body để xác định hành vi; `makeField` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMfieldFromNameCreator`. Dependency trong source: `TFMConstants`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua fieldHandled, handleField, makeField → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMFieldNameVariables instance = new TFMFieldNameVariables(<args>);` rồi `instance.fieldHandled(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMFieldOrigins`
1. **Tên class:** `TFMFieldOrigins`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (field origins); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `tableFields` (Map) — table fields; `extendedDataTypes` (Set) — extended dữ liệu types; `originBlockName` (TFMLogicBlockName) — origin block tên/định danh; `matchedSource` (str) — matched source
4. **Method chính và khi nào dùng:** `parmOriginBlockName` — khi cần đọc/ghi tham số; `new` — khi cần khởi tạo/xây dựng; `getTableFields` — khi cần lấy hoặc tra cứu; `dataTypesEnumerator` — khi cần xem method body để xác định hành vi; `Construct` — khi cần khởi tạo/xây dựng; `hasTable` — khi cần kiểm tra điều kiện; `fieldsFromTable` — khi cần xem method body để xác định hành vi; `setMatchedSource` — khi cần ghi/cập nhật state; … còn 6 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmOriginBlockName, new, getTableFields → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMFieldOrigins instance = TFMFieldOrigins::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMFilterTreeBuilder`
1. **Tên class:** `TFMFilterTreeBuilder`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (filter tree builder); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `tree` (FormTreeControl) — tree; `expMap` (Map) — exp map; `id2idx` (Map) — id2idx; `idx2id` (Map) — idx2id; `contextId2Name` (Map) — ngữ cảnh id2 tên/định danh; `contextId2Record` (Map) — ngữ cảnh id2 record; `idCounter` (int) — mã định danh counter; `idx2parentName` (Map) — idx2parent tên/định danh; `idx2className` (Map) — idx2class tên/định danh; `idx2fieldName` (Map) — idx2field tên/định danh; `idx2parentIdx` (Map) — idx2parent idx; `configFilters` (Map) — cấu hình filters; … còn 13 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `resetMaps` — khi cần xem method body để xác định hành vi; `currentfilterName` — khi cần xem method body để xác định hành vi; `currentClassName` — khi cần xem method body để xác định hành vi; `parmFilterNameDelimitation` — khi cần đọc/ghi tham số; `currentfilterFieldName` — khi cần xem method body để xác định hành vi; `Construct` — khi cần khởi tạo/xây dựng; `setButtons` — khi cần ghi/cập nhật state; … còn 13 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMReferenceDataConfiguration`. Dependency trong source: `TFMHeadersProvider`, `TFMFormLookupHelper`, `TFMDocumentHandler`, `TFMReferenceDataMethodAttribute`, `TFMRegistrationCollector`, `TFMParameterAttribute`, `TFMHelper`, `TFMAttributeHandler`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, resetMaps, currentfilterName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMFilterTreeBuilder instance = TFMFilterTreeBuilder::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMFormHelper`
1. **Tên class:** `TFMFormHelper`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Form/UI (form helper); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `type2FormControl` — khi cần xem method body để xác định hành vi; `getParameterParmMethods` — khi cần lấy hoặc tra cứu; `convertXsdStringTypeToTypes` — khi cần xem method body để xác định hành vi; `getLastPartOfPath` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMHelper`, `TFMParameterAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input Args, record và control state (tham số của method public hoặc state của instance) → xử lý form/helper xử lý UI hoặc cấu hình qua type2FormControl, getParameterParmMethods, convertXsdStringTypeToTypes → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMFormHelper instance = new TFMFormHelper(<args>);` rồi `instance.type2FormControl(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: caller context, form lifecycle, permissions và null buffers; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMFormLookupHelper`
1. **Tên class:** `TFMFormLookupHelper`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Form/UI (form lookup helper); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `lookupClassesExtendingCertainClass` — khi cần lấy hoặc tra cứu; `lookupClasses` — khi cần lấy hoặc tra cứu; `lookupValidationClasses` — khi cần lấy hoặc tra cứu; `lookupGroupingMenuIconsClasses` — khi cần lấy hoặc tra cứu; `lookupXMLFormatClassOrderTypes` — khi cần lấy hoặc tra cứu; `lookupEDTNames` — khi cần lấy hoặc tra cứu; `getCertainPageTypes` — khi cần lấy hoặc tra cứu; `lookupPageNames` — khi cần lấy hoặc tra cứu; … còn 47 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMDocumentHandler`, `TFMWorkflowValidation`, `TFMImageHandler`, `TFMMenuGroupingIconAttribute`, `TFMTableNameAttribute`, `TFMPagesProvider`, `TFMPages`, `TFMPage`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input Args, record và control state (tham số của method public hoặc state của instance) → xử lý form/helper xử lý UI hoặc cấu hình qua lookupClassesExtendingCertainClass, lookupClasses, lookupValidationClasses → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMFormLookupHelper instance = new TFMFormLookupHelper(<args>);` rồi `instance.lookupClassesExtendingCertainClass(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: caller context, form lifecycle, permissions và null buffers; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMFormSysResourceHelper`
1. **Tên class:** `TFMFormSysResourceHelper`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Form/UI (form sys resource helper); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getResources` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input Args, record và control state (tham số của method public hoặc state của instance) → xử lý form/helper xử lý UI hoặc cấu hình qua getResources → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMFormSysResourceHelper instance = new TFMFormSysResourceHelper(<args>);` rồi `instance.getResources(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: caller context, form lifecycle, permissions và null buffers; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMFormXMLFormatter`
1. **Tên class:** `TFMFormXMLFormatter`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm XML/Serialization (form xml formatter); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `htmlColorXML` — khi cần parse/serialize XML
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/document/format (tham số của method public hoặc state của instance) → xử lý parse hoặc build typed structure rồi serialize qua htmlColorXML → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMFormXMLFormatter instance = new TFMFormXMLFormatter(<args>);` rồi `instance.htmlColorXML(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: namespace, encoding, escaping, optional nodes, version; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMGenericDataHelper`
1. **Tên class:** `TFMGenericDataHelper`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (generic data helper); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `makeCommonFromDatasetClass` — khi cần xem method body để xác định hành vi; `tableNameFromDatasetClass` — khi cần xem method body để xác định hành vi; `findValue` — khi cần lấy hoặc tra cứu; `FindRelation` — khi cần lấy hoặc tra cứu; `getRelatedTable` — khi cần lấy hoặc tra cứu; `getRelatedTablethroughExistingRelation` — khi cần lấy hoặc tra cứu; `getRelatedTablethroughKnownRelation` — khi cần lấy hoặc tra cứu; `tableNameFromRelation` — khi cần xem method body để xác định hành vi; … còn 4 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMXMLFormat`, `TFMTableNameAttribute`, `TFMExpressions`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua makeCommonFromDatasetClass, tableNameFromDatasetClass, findValue → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMGenericDataHelper instance = new TFMGenericDataHelper(<args>);` rồi `instance.makeCommonFromDatasetClass(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMGetGroupsVisitor`
1. **Tên class:** `TFMGetGroupsVisitor`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (get groups visitor); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `attributeArray` (Array) — attribute array; `mobPage` (TFMPage) — mob page; `mobPages` (TFMPages) — mob pages; `pagesEnum` (MapEnumerator) — pages enum; `menuAttribute` (TFMMenuAttribute) — menu attribute; `i` (int) — i; `categories` (Map) — categories
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `visitDocumentHandler` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMPage`, `TFMPages`, `TFMMenuAttribute`. Dependency trong source: `TFMIDocumentHandlerVisitor`, `TFMDocumentHandler`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, visitDocumentHandler → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMGetGroupsVisitor instance = new TFMGetGroupsVisitor(<args>);` rồi `instance.visitDocumentHandler(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMGetPagesVisitor`
1. **Tên class:** `TFMGetPagesVisitor`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (get pages visitor); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `mobPage` (TFMPage) — mob page; `mobPages` (TFMPages) — mob pages; `pagesEnum` (MapEnumerator) — pages enum; `pages` (TFMPages) — pages
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `visitDocumentHandler` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMPage`, `TFMPages`. Dependency trong source: `TFMIDocumentHandlerVisitor`, `TFMDocumentHandler`, `TFMGetGroupsVisitor`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua new, visitDocumentHandler → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMGetPagesVisitor instance = new TFMGetPagesVisitor(<args>);` rồi `instance.visitDocumentHandler(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMGetReferenceData`
1. **Tên class:** `TFMGetReferenceData`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (get reference data); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `createDocumentConfiguration` — khi cần khởi tạo/xây dựng; `getConfigurationsFromQueries` — khi cần lấy hoặc tra cứu; `VersionNumber` — khi cần xem method body để xác định hành vi; `CreateQueryFiltersLine` — khi cần khởi tạo/xây dựng; `getConfigurationsFromDocuments` — khi cần lấy hoặc tra cứu; `createHeaderAndLine` — khi cần khởi tạo/xây dựng; `getReferenceDataMethods` — khi cần lấy hoặc tra cứu; `defaultLineNumberCollector` — khi cần xem method body để xác định hành vi; … còn 14 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentHandler`. Dependency trong source: `TFMConstants`, `TFMReferenceDataConfiguration`, `TFMRegistrationCollector`, `TFMLookupQueries`, `TFMReferenceDataMethodAttribute`, `TFMReferenceData`, `TFMReferenceDataFilterList`, `TFMDocumentNodes`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua createDocumentConfiguration, getConfigurationsFromQueries, VersionNumber → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMGetReferenceData instance = new TFMGetReferenceData(<args>);` rồi `instance.createDocumentConfiguration(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMGetRegistrationConfiguration`
1. **Tên class:** `TFMGetRegistrationConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (get registration configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `canBeEnqueued` — khi cần kiểm tra điều kiện; `description` — khi cần xem method body để xác định hành vi; `getDocumentTypes` — khi cần lấy hoặc tra cứu; `getDocumentContentSubject` — khi cần lấy hoặc tra cứu; `subHandler` — khi cần xem method body để xác định hành vi; `process` — khi cần thực thi xử lý; `findClass` — khi cần lấy hoặc tra cứu; `getMethodFromSysAttribute` — khi cần lấy hoặc tra cứu; … còn 3 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentHandler`. Dependency trong source: `TFMDocumentTypeAttribute`, `TFMCollectorMapAttribute`, `TFMPostAdhocRegistration`, `TFMAttributeHandler`, `TFMHelper`, `TFMFormLookupHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua canBeEnqueued, description, getDocumentTypes → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMGetRegistrationConfiguration instance = new TFMGetRegistrationConfiguration(<args>);` rồi `instance.canBeEnqueued(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMGraphGeneric`
1. **Tên class:** `TFMGraphGeneric`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (graph generic); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `htmlViewer` (TFMHtmlViewerCtrl) — html viewer; `ancestors` (Map) — ancestors; `treeNodes` (Map) — tree nodes; `colors` (container) — colors; `maxDepth` (int) — max depth; `maxBreadth` (int) — max breadth; `height` (int) — height; `width` (int) — width; `forcedWidth` (int) — forced width; `forcedHeight` (int) — forced height; `breadthPerDepth` (Map) — breadth per depth
4. **Method chính và khi nào dùng:** `calcNodePlacements` — khi cần xem method body để xác định hành vi; `draw` — khi cần xem method body để xác định hành vi; `init` — khi cần khởi tạo/xây dựng; `initBaseBmp` — khi cần khởi tạo/xây dựng; `initColors` — khi cần khởi tạo/xây dựng; `initGraphVars` — khi cần khởi tạo/xây dựng; `mouseClick` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; … còn 6 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMHtmlViewerCtrl`. Dependency trong source: `TFMGraphTreeNode`, `TFMGraphicsHelper`, `TFMGraphRectInteraction`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua calcNodePlacements, draw, init → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMGraphGeneric instance = TFMGraphGeneric::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMGraphicsHelper`
1. **Tên class:** `TFMGraphicsHelper`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (graphics helper); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `color2hex` — khi cần xem method body để xác định hành vi; `scaleColor` — khi cần xem method body để xác định hành vi; `hex2color` — khi cần xem method body để xác định hành vi; `addBackgroundColor` — khi cần ghi/cập nhật state; `entityTileImage` — khi cần xem method body để xác định hành vi; `dampenRGB` — khi cần xem method body để xác định hành vi; `drawLine` — khi cần xem method body để xác định hành vi; `drawBmpEdges` — khi cần xem method body để xác định hành vi; … còn 18 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMImageHelper`, `TFMDocGetMedia`, `TFMConstants`, `TFMHtmlViewerCtrl`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua color2hex, scaleColor, hex2color → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMGraphicsHelper instance = new TFMGraphicsHelper(<args>);` rồi `instance.color2hex(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMGraphRectInteraction`
1. **Tên class:** `TFMGraphRectInteraction`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (graph rect interaction); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `rTop` (real) — r top; `rBottom` (real) — r bottom; `rLeft` (real) — r left; `rRight` (real) — r right; `text` (str) — text; `subText` (str) — sub text; `upperColor` (int) — upper color; `lowerColor` (int) — lower color; `textColor` (int) — text color; `edgeColor` (int) — edge color; `updates` (str) — updates
4. **Method chính và khi nào dùng:** `draw` — khi cần xem method body để xác định hành vi; `drawTextAtCenter` — khi cần xem method body để xác định hành vi; `drawTextAtTopAndSubText` — khi cần xem method body để xác định hành vi; `height` — khi cần xem method body để xác định hành vi; `iBottom` — khi cần xem method body để xác định hành vi; `iCenterX` — khi cần xem method body để xác định hành vi; `iCenterY` — khi cần xem method body để xác định hành vi; `iHeight` — khi cần xem method body để xác định hành vi; … còn 24 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMGraphicsHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua draw, drawTextAtCenter, drawTextAtTopAndSubText → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMGraphRectInteraction instance = TFMGraphRectInteraction::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMGraphRectInteractionWorkflow`
1. **Tên class:** `TFMGraphRectInteractionWorkflow`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (graph rect interaction workflow); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `resName` (ResourceName) — res tên/định danh
4. **Method chính và khi nào dùng:** `draw` — khi cần xem method body để xác định hành vi; `drawTextAtTopAndSubText` — khi cần xem method body để xác định hành vi; `parmResourceName` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMGraphRectInteraction`. Dependency trong source: `TFMImageHelper`, `TFMGraphicsHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua draw, drawTextAtTopAndSubText, parmResourceName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMGraphRectInteractionWorkflow instance = new TFMGraphRectInteractionWorkflow(<args>);` rồi `instance.draw(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMGraphTreeNode`
1. **Tên class:** `TFMGraphTreeNode`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (graph tree node); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `maxNodesBefore` (int) — max nodes before; `maxNodesAfter` (int) — max nodes after; `depthPos` (int) — depth pos; `breadthPos` (int) — breadth pos; `maxBreadth` (int) — max breadth; `prevNodes` (Map) — prev nodes; `nextNodes` (Map) — next nodes; `rect` (TFMGraphRectInteraction) — rect; `label` (str) — nhãn; `subText` (str) — sub text; `returnVariable` (str) — return variable; `forcedRectHeight` (int) — forced rect height; … còn 2 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `draw` — khi cần xem method body để xác định hành vi; `drawArrow` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `parmRectClassName` — khi cần đọc/ghi tham số; `parmBreadthPos` — khi cần đọc/ghi tham số; `parmDepthPos` — khi cần đọc/ghi tham số; `parmforcedLowerColor` — khi cần đọc/ghi tham số; `parmforcedRectHeight` — khi cần đọc/ghi tham số; … còn 9 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMGraphRectInteraction`. Dependency trong source: `TFMGraphicsHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua draw, drawArrow, new → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMGraphTreeNode instance = new TFMGraphTreeNode(<args>);` rồi `instance.draw(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMGraphTreeNodeWorkflow`
1. **Tên class:** `TFMGraphTreeNodeWorkflow`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (graph tree node workflow); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `groupName` (str) — group tên/định danh; `resName` (ResourceName) — res tên/định danh
4. **Method chính và khi nào dùng:** `draw` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `parmGroupName` — khi cần đọc/ghi tham số; `parmResourceName` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMGraphTreeNode`. Dependency trong source: `TFMGraphRectInteractionWorkflow`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua draw, new, parmGroupName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMGraphTreeNodeWorkflow instance = new TFMGraphTreeNodeWorkflow(<args>);` rồi `instance.draw(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMGraphWorkflow`
1. **Tên class:** `TFMGraphWorkflow`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (graph workflow); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `construct` — khi cần khởi tạo/xây dựng; `initBaseBmp` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMGraphGeneric`. Dependency trong source: `TFMHtmlViewerCtrl`, `TFMGraphTreeNodeWorkflow`, `TFMGraphRectInteraction`, `TFMGraphRectInteractionWorkflow`, `TFMGraphicsHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua construct, initBaseBmp → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMGraphWorkflow instance = TFMGraphWorkflow::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMHeadersProvider`
1. **Tên class:** `TFMHeadersProvider`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Service/Provider (headers provider); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `GetXML` — khi cần lấy hoặc tra cứu; `GetPageHeaders` — khi cần lấy hoặc tra cứu; `getInlinedHeaders` — khi cần lấy hoặc tra cứu; `invalidateProvider` — khi cần xem method body để xác định hành vi; `version` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMProvider`. Dependency trong source: `TFMDocumentHandler`, `TFMReferenceDataMethodAttribute`, `TFMSearchHandler`, `TFMReferenceDataConfiguration`, `TFMProcessProvider`, `TFMAttributeHandler`, `TFMConstants`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/process/request context (tham số của method public hoặc state của instance) → xử lý chọn handler/service hoặc serialize output qua GetXML, GetPageHeaders, getInlinedHeaders → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMHeadersProvider instance = new TFMHeadersProvider(<args>);` rồi `instance.GetXML(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: dùng đúng factory, cache và runtime context; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMHelper`
1. **Tên class:** `TFMHelper`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (helper); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `attachBase64ToCommon` — khi cần xem method body để xác định hành vi; `matchRegex` — khi cần xem method body để xác định hành vi; `matchRegexSet` — khi cần xem method body để xác định hành vi; `getParametersFromClassAndMethod` — khi cần lấy hoặc tra cứu; `backendId2Record` — khi cần xem method body để xác định hành vi; `splitTextToMultilines` — khi cần xem method body để xác định hành vi; `findIndexOfFirstCapitalLetterFromMiddle` — khi cần lấy hoặc tra cứu; `generateBackendId` — khi cần xem method body để xác định hành vi; … còn 57 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMConstants`, `TFMFormLookupHelper`, `TFMParameterAttribute`, `TFMDocCustomFunctionFlow`, `TFMOrderPostDataSetAttribute`, `TFMGetRegistrationConfiguration`, `TFMGenericDataHelper`, `TFMInventDimHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua attachBase64ToCommon, matchRegex, matchRegexSet → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMHelper instance = new TFMHelper(<args>);` rồi `instance.attachBase64ToCommon(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMHtmlButtonCtrl`
1. **Tên class:** `TFMHtmlButtonCtrl`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (html button ctrl); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `textProperty` (FormProperty) — text property; `faIconProperty` (FormProperty) — fa icon property; `activeLayoutProperty` (FormProperty) — trạng thái hoạt động layout property
4. **Method chính và khi nào dùng:** `actionDelegate` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `clicked` — khi cần xem method body để xác định hành vi; `parmText` — khi cần đọc/ghi tham số; `parmFaIcon` — khi cần đọc/ghi tham số; `parmActiveLayout` — khi cần đọc/ghi tham số; `setText` — khi cần ghi/cập nhật state; `setFaIcon` — khi cần ghi/cập nhật state; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `FormTemplateControl`. Dependency trong source: `TFMHtmlButtonCtrlBuild`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua actionDelegate, new, clicked → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMHtmlButtonCtrl instance = new TFMHtmlButtonCtrl(<args>);` rồi `instance.actionDelegate(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMHtmlButtonCtrlBuild`
1. **Tên class:** `TFMHtmlButtonCtrlBuild`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (html button ctrl build); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `FormBuildControl`. Dependency trong source: `TFMHtmlButtonCtrl`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMHtmlButtonCtrlBuild instance = new TFMHtmlButtonCtrlBuild(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMHtmlHelper`
1. **Tên class:** `TFMHtmlHelper`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (html helper); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `map2Html` — khi cần xem method body để xác định hành vi; `requestmap2HtmlList` — khi cần xem method body để xác định hành vi; `entityTileHtml` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMImageHelper`, `TFMDocGetMedia`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua map2Html, requestmap2HtmlList, entityTileHtml → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMHtmlHelper instance = new TFMHtmlHelper(<args>);` rồi `instance.map2Html(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMHtmlListCtrl`
1. **Tên class:** `TFMHtmlListCtrl`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (html list ctrl); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `formClass` (TFMPageOverviewFormClass) — form class; `SendItemsToJavascriptProperty` (FormProperty) — send các phần tử to javascript property; `SendUpdatingToJavascriptProperty` (FormProperty) — send updating to javascript property; `createdItems` (Map) — created các phần tử; `counter` (int) — counter; `hashCode` (int) — hash code; `cachedAllPagesContracts` (str) — cached all pages contracts
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `setFormClass` — khi cần ghi/cập nhật state; `sendUpdatingToControl` — khi cần xem method body để xác định hành vi; `sendItemsToJavascriptControl` — khi cần xem method body để xác định hành vi; `SendUpdatingToJavascript` — khi cần xem method body để xác định hành vi; `SendItemsToJavascript` — khi cần xem method body để xác định hành vi; `getLocalization` — khi cần lấy hoặc tra cứu; `selectListItem` — khi cần xem method body để xác định hành vi; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `FormTemplateContainerControl`. Composition/member fields: `TFMPageOverviewFormClass`. Dependency trong source: `TFMHtmlListCtrlBuild`, `TFMPages`, `TFMPage`, `TFMListItemContract`, `TFMLocalizationContract`, `TFMListVisualization`, `TFMHelper`, `TFMDocGetMedia`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, setFormClass, sendUpdatingToControl → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMHtmlListCtrl instance = new TFMHtmlListCtrl(<args>);` rồi `instance.setFormClass(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMHtmlListCtrlBuild`
1. **Tên class:** `TFMHtmlListCtrlBuild`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (html list ctrl build); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `FormBuildContainerControl`. Dependency trong source: `TFMHtmlListCtrl`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMHtmlListCtrlBuild instance = new TFMHtmlListCtrlBuild(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMHtmlSanitizer`
1. **Tên class:** `TFMHtmlSanitizer`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (html sanitizer); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `sanitizer` (HtmlSanitizer) — sanitizer
4. **Method chính và khi nào dùng:** `getSanitizer` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua getSanitizer → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMHtmlSanitizer instance = new TFMHtmlSanitizer(<args>);` rồi `instance.getSanitizer(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMHtmlViewerCtrl`
1. **Tên class:** `TFMHtmlViewerCtrl`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (html viewer ctrl); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `addCopyLinkProperty` (FormProperty) — add copy link property; `htmlProperty` (FormProperty) — html property; `formatAsXmlProperty` (FormProperty) — format as XML property; `showProgressInformationProperty` (FormProperty) — show progress information property; `sanitizer` (HtmlSanitizer) — sanitizer; `skipSanitizer` (boolean) — skip sanitizer
4. **Method chính và khi nào dùng:** `actionDelegate` — khi cần xem method body để xác định hành vi; `parmHtml` — khi cần đọc/ghi tham số; `parmAddCopyLink` — khi cần đọc/ghi tham số; `parmFormatAsXml` — khi cần đọc/ghi tham số; `parmShowProgressInformation` — khi cần đọc/ghi tham số; `TFMButtonClicked` — khi cần xem method body để xác định hành vi; `parmSkipSanitizer` — khi cần đọc/ghi tham số; `new` — khi cần khởi tạo/xây dựng; … còn 2 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `FormTemplateControl`. Dependency trong source: `TFMHtmlViewerCtrlBuild`, `TFMHtmlSanitizer`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua actionDelegate, parmHtml, parmAddCopyLink → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMHtmlViewerCtrl instance = new TFMHtmlViewerCtrl(<args>);` rồi `instance.actionDelegate(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMHtmlViewerCtrlBuild`
1. **Tên class:** `TFMHtmlViewerCtrlBuild`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (html viewer ctrl build); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `htmlField` (str) — html field/trường; `addCopyLinkField` (str) — add copy link field/trường; `formatAsXmlField` (str) — format as XML field/trường
4. **Method chính và khi nào dùng:** `htmlField` — khi cần xem method body để xác định hành vi; `addCopyLinkField` — khi cần ghi/cập nhật state; `formatAsXmlField` — khi cần parse/serialize XML
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `FormBuildControl`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua htmlField, addCopyLinkField, formatAsXmlField → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMHtmlViewerCtrlBuild instance = new TFMHtmlViewerCtrlBuild(<args>);` rồi `instance.htmlField(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMIDocumentHandlerVisitor`
1. **Tên class:** `TFMIDocumentHandlerVisitor`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (i document handler visitor); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `visitDocumentHandler` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMDocumentHandler`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua visitDocumentHandler → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMIgnoreParmAttribute`
1. **Tên class:** `TFMIgnoreParmAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (ignore parm attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua parmCacheKey, useSingleton → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMIgnoreParmAttribute instance = new TFMIgnoreParmAttribute(<args>);` rồi `instance.parmCacheKey(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMImageCombiner`
1. **Tên class:** `TFMImageCombiner`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (image combiner); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `combineImages` — khi cần xem method body để xác định hành vi; `combineImage` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMImageHelper`, `TFMDocGetMedia`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua combineImages, combineImage → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMImageCombiner instance = new TFMImageCombiner(<args>);` rồi `instance.combineImages(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMImageHandler`
1. **Tên class:** `TFMImageHandler`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (image handler); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `process` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua process → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMimageHandlerCombinedImages`
1. **Tên class:** `TFMimageHandlerCombinedImages`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (image handler combined images); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `process` — khi cần thực thi xử lý; `workLog` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMImageHandler`. Dependency trong source: `TFMImageCombiner`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua process, workLog → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMimageHandlerCombinedImages instance = new TFMimageHandlerCombinedImages(<args>);` rồi `instance.process(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMImageHandlerFolder`
1. **Tên class:** `TFMImageHandlerFolder`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (image handler folder); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `process` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMImageHandler`. Dependency trong source: `TFMDocGetMedia`, `TFMImageHelper`, `TFMHelper`, `TFMMediaProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua process → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMImageHandlerFolder instance = new TFMImageHandlerFolder(<args>);` rồi `instance.process(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMImageHandlerIconTitle`
1. **Tên class:** `TFMImageHandlerIconTitle`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (image handler icon title); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `process` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMImageHandler`. Dependency trong source: `TFMImageHelper`, `TFMGraphicsHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua process → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMImageHandlerIconTitle instance = new TFMImageHandlerIconTitle(<args>);` rồi `instance.process(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMImageHandlerMenuItemGroup`
1. **Tên class:** `TFMImageHandlerMenuItemGroup`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (image handler menu item group); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `process` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMImageHandler`. Dependency trong source: `TFMDocGetMedia`, `TFMConstants`, `TFMImageHelper`, `TFMHelper`, `TFMPagesProvider`, `TFMMediaProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua process → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMImageHandlerMenuItemGroup instance = new TFMImageHandlerMenuItemGroup(<args>);` rồi `instance.process(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMImageHandlerPercentageProgress`
1. **Tên class:** `TFMImageHandlerPercentageProgress`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (image handler percentage progress); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `process` — khi cần thực thi xử lý; `drawGradient` — khi cần xem method body để xác định hành vi; `drawBmpEdges` — khi cần xem method body để xác định hành vi; `drawBmpText` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMImageHandler`. Dependency trong source: `TFMImageHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua process, drawGradient, drawBmpEdges → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMImageHandlerPercentageProgress instance = new TFMImageHandlerPercentageProgress(<args>);` rồi `instance.process(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMImageHandlerPercentIndicator`
1. **Tên class:** `TFMImageHandlerPercentIndicator`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (image handler percent indicator); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `process` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMImageHandler`. Dependency trong source: `TFMGraphicsHelper`, `TFMImageHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua process → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMImageHandlerPercentIndicator instance = new TFMImageHandlerPercentIndicator(<args>);` rồi `instance.process(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMImageHelper`
1. **Tên class:** `TFMImageHelper`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (image helper); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `ExifRotateBase64Image` — khi cần xem method body để xác định hành vi; `ExifRotateImageStream` — khi cần xem method body để xác định hành vi; `ExifRotateImage` — khi cần xem method body để xác định hành vi; `convertImageToContainer` — khi cần xem method body để xác định hành vi; `Image2Base64` — khi cần xem method body để xác định hành vi; `base64ToImage` — khi cần xem method body để xác định hành vi; `base64ToHtml` — khi cần xem method body để xác định hành vi; `scaleImage` — khi cần xem method body để xác định hành vi; … còn 2 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMMediaProvider`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua ExifRotateBase64Image, ExifRotateImageStream, ExifRotateImage → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMImageHelper instance = new TFMImageHelper(<args>);` rồi `instance.ExifRotateBase64Image(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMImportLists`
1. **Tên class:** `TFMImportLists`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (import lists); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `main` — khi cần xem method body để xác định hành vi; `importFromText` — khi cần xem method body để xác định hành vi; `importFont` — khi cần xem method body để xác định hành vi; `importList` — khi cần xem method body để xác định hành vi; `importNode` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMListsProvider`, `TFMListNewVersion`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua main, importFromText, importFont → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMImportLists instance = new TFMImportLists(<args>);` rồi `instance.main(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMImportSetup`
1. **Tên class:** `TFMImportSetup`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (import setup); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `main` — khi cần xem method body để xác định hành vi; `importFromText` — khi cần xem method body để xác định hành vi; `replaceKeysInTable` — khi cần xem method body để xác định hành vi; `putIntoTable` — khi cần xem method body để xác định hành vi; `convert` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua main, importFromText, replaceKeysInTable → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMImportSetup instance = new TFMImportSetup(<args>);` rồi `instance.main(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMInfoContextContract`
1. **Tên class:** `TFMInfoContextContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (info context contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `itemInfo` (str) — mặt hàng info; `qOrderInformation` (str) — q đơn hàng information
4. **Method chính và khi nào dùng:** `parmItemInfo` — khi cần đọc/ghi tham số; `parmQOrderInformation` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmItemInfo, parmQOrderInformation → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMInfoContextContract instance = new TFMInfoContextContract(<args>);` rồi `instance.parmItemInfo(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMInputHandler`
1. **Tên class:** `TFMInputHandler`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (input handler); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `request` (TFMRequestElement) — request; `requestXml` (XmlDocument) — request XML; `messageId` (TFMDocumentMessageId) — message mã định danh; `responseElement` (TFMResponseElement) — response element; `resultXml` (XmlDocument) — result XML
4. **Method chính và khi nào dùng:** `setRequest` — khi cần ghi/cập nhật state; `setRequestXml` — khi cần ghi/cập nhật state; `parmMessageId` — khi cần đọc/ghi tham số; `preProcess` — khi cần xem method body để xác định hành vi; `getDocumentContentSubject` — khi cần lấy hoặc tra cứu; `run` — khi cần thực thi xử lý; `getResultTable` — khi cần lấy hoặc tra cứu; `getResponseElement` — khi cần lấy hoặc tra cứu; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMRequestElement`, `TFMResponseElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua setRequest, setRequestXml, parmMessageId → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMInventDimensionSetupContract`
1. **Tên class:** `TFMInventDimensionSetupContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (invent dimension setup contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `active` (boolean) — trạng thái hoạt động; `allowBlank` (boolean) — allow blank; `productDimensionValues` (str) — product dimension values; `hasValueInContext` (boolean) — has giá trị in ngữ cảnh; `valueFromContext` (str) — giá trị from ngữ cảnh; `manualAllocation` (boolean) — manual allocation
4. **Method chính và khi nào dùng:** `parmActive` — khi cần đọc/ghi tham số; `parmAllowBlank` — khi cần đọc/ghi tham số; `parmAllowedValues` — khi cần đọc/ghi tham số; `parmHasValueInContext` — khi cần đọc/ghi tham số; `parmValueFromContext` — khi cần đọc/ghi tham số; `parmManualAllocation` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua parmActive, parmAllowBlank, parmAllowedValues → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMInventDimensionSetupContract instance = new TFMInventDimensionSetupContract(<args>);` rồi `instance.parmActive(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMInventDimHelper`
1. **Tên class:** `TFMInventDimHelper`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (invent dim helper); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `GetInventDimCollectors` — khi cần lấy hoặc tra cứu; `getStorageDimensions` — khi cần lấy hoặc tra cứu; `isStorageDimensionForWMSLocationNotActive` — khi cần kiểm tra điều kiện; `getTrackingDimensions` — khi cần lấy hoặc tra cứu; `getProductDimensions` — khi cần lấy hoặc tra cứu; `GetInventDimFromLicensePlate` — khi cần lấy hoặc tra cứu; `WmsLocationIdFromLicensePlate` — khi cần xem method body để xác định hành vi; `flagFieldName` — khi cần xem method body để xác định hành vi; … còn 15 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMInventDimSetup`, `TFMHelper`, `TFMRegistrationCollectorList`, `TFMConstants`, `TFMRegistrationCollector`, `TFMGetReferenceData`, `TFMRegistrationCollectorText`, `TFMRegistrationCollectorDecimal`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua GetInventDimCollectors, getStorageDimensions, isStorageDimensionForWMSLocationNotActive → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMInventDimHelper instance = new TFMInventDimHelper(<args>);` rồi `instance.GetInventDimCollectors(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMInventDimSetup`
1. **Tên class:** `TFMInventDimSetup`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (invent dim setup); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `inventDimGroupSetup` (InventDimGroupSetup) — invent dim group setup; `orderType` (TFMOrderTypes) — đơn hàng loại; `dimGroupId` (InventDimGroupId) — dim group mã định danh; `inventTable` (InventTable) — invent table
4. **Method chính và khi nào dùng:** `parmInventTable` — khi cần đọc/ghi tham số; `Construct` — khi cần khởi tạo/xây dựng; `new` — khi cần khởi tạo/xây dựng; `registerBatchID` — khi cần xem method body để xác định hành vi; `registerSerialNumber` — khi cần xem method body để xác định hành vi; `registerSerialNumberSales` — khi cần xem method body để xác định hành vi; `registerWMSLocation` — khi cần xem method body để xác định hành vi; `registerWMSPallet` — khi cần xem method body để xác định hành vi; … còn 2 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmInventTable, Construct, new → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMInventDimSetup instance = TFMInventDimSetup::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMJsonHelper`
1. **Tên class:** `TFMJsonHelper`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (json helper); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `ConFromJSON` — khi cần xem method body để xác định hành vi; `convertCLRObjectToContainer` — khi cần xem method body để xác định hành vi; `getList` — khi cần lấy hoặc tra cứu; `getMap` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua ConFromJSON, convertCLRObjectToContainer, getList → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMJsonHelper instance = new TFMJsonHelper(<args>);` rồi `instance.ConFromJSON(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMJsonSerializer`
1. **Tên class:** `TFMJsonSerializer`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (json serializer); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `nullPlaceholder` (str) — null placeholder; `dateTimeBase` (utcDateTime) — ngày thời gian base; `theDataContractClass` (Map) — the dữ liệu contract class; `theDataContractClassEnumerator` (MapEnumerator) — the dữ liệu contract class enumerator; `dateTimeIso8601Type` (int) — ngày thời gian iso8601 loại; `dateTimeIso8601WithMillisecondsType` (int) — ngày thời gian iso8601 with milliseconds loại
4. **Method chính và khi nào dùng:** `extendsDateTimeIso8601Type` — khi cần xem method body để xác định hành vi; `extendsDateTimeIso8601WithMillisecondsType` — khi cần xem method body để xác định hành vi; `json` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `dateTimeBase` — khi cần xem method body để xác định hành vi; `serializeDataContract` — khi cần parse/serialize XML; `serializeList` — khi cần parse/serialize XML; `serializeMap` — khi cần parse/serialize XML; … còn 17 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMContractClassAttribute`, `TFMDocCustomFunctionFlow`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua extendsDateTimeIso8601Type, extendsDateTimeIso8601WithMillisecondsType, json → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMJsonSerializer instance = new TFMJsonSerializer(<args>);` rồi `instance.extendsDateTimeIso8601Type(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLineSelectionResponseElement`
1. **Tên class:** `TFMLineSelectionResponseElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (line selection response element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `request` (TFMRequestElement) — request; `inventSum` (InventSum) — invent sum
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Construct` — khi cần khởi tạo/xây dựng; `addResponse` — khi cần ghi/cập nhật state; `getXML` — khi cần lấy hoặc tra cứu; `appendInventDimToXmlElement` — khi cần ghi/cập nhật state; `appendToXML` — khi cần ghi/cập nhật state; `translateFieldNamesToMobileApi` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMResponseElement`. Composition/member fields: `TFMRequestElement`. Dependency trong source: `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua new, Construct, addResponse → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMLineSelectionResponseElement instance = TFMLineSelectionResponseElement::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMList`
1. **Tên class:** `TFMList`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `listName` (TFMListId) — danh sách tên/định danh; `deltaLevel` (TFMDeltaLevel) — delta level
4. **Method chính và khi nào dùng:** `parmListName` — khi cần đọc/ghi tham số; `new` — khi cần khởi tạo/xây dựng; `setListName` — khi cần ghi/cập nhật state; `parmDeltaLevel` — khi cần đọc/ghi tham số; `hasApprovedVersion` — khi cần kiểm tra điều kiện; `getListConfiguration` — khi cần lấy hoặc tra cứu; `getList` — khi cần lấy hoặc tra cứu; `Construct` — khi cần khởi tạo/xây dựng; … còn 5 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMListConfiguration`, `TFMListConverter`, `TFMListRow`, `TFMListColumn`, `TFMListTextElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmListName, new, setListName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMList instance = TFMList::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListAttachments`
1. **Tên class:** `TFMListAttachments`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list attachments); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getList` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMList`. Dependency trong source: `TFMListIdAttribute`, `TFMListConfiguration`, `TFMListRow`, `TFMListColumn`, `TFMListTextElement`, `TFMListImageElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua getList → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListAttachments instance = new TFMListAttachments(<args>);` rồi `instance.getList(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListBase`
1. **Tên class:** `TFMListBase`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list base); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `name` (Name) — tên/định danh; `baseChildren` (Map) — base children
4. **Method chính và khi nào dùng:** `addChild` — khi cần ghi/cập nhật state; `getChildren` — khi cần lấy hoặc tra cứu; `new` — khi cần khởi tạo/xây dựng; `ParmName` — khi cần đọc/ghi tham số; `attributeSummary` — khi cần xem method body để xác định hành vi; `appendToXML` — khi cần ghi/cập nhật state; `render` — khi cần xem method body để xác định hành vi; `replaceTextWithValue` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMListELementAttribute`, `TFMListVisualizationInterface`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua addChild, getChildren, new → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListBase instance = new TFMListBase(<args>);` rồi `instance.addChild(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListColumn`
1. **Tên class:** `TFMListColumn`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list column); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `elements` (TFMListElements) — elements; `backgroundColor` (SysColorHex) — background color; `width` (TFMListWidth) — width; `xAlign` (TFMListXAlign) — x align; `yAlign` (TFMListYAlign) — y align
4. **Method chính và khi nào dùng:** `parmwidth` — khi cần đọc/ghi tham số; `parmxAlign` — khi cần đọc/ghi tham số; `parmyAlign` — khi cần đọc/ghi tham số; `addElement` — khi cần ghi/cập nhật state; `Construct` — khi cần khởi tạo/xây dựng; `appendToXML` — khi cần ghi/cập nhật state; `parmBackgroundColor` — khi cần đọc/ghi tham số; `attributeSummary` — khi cần xem method body để xác định hành vi; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListBase`. Composition/member fields: `TFMListElements`. Dependency trong source: `TFMListElementAttribute`, `TFMListElementHierarchyInterface`, `TFMHelper`, `TFMListVisualizationInterface`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmwidth, parmxAlign, parmyAlign → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMListColumn instance = TFMListColumn::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListColumns`
1. **Tên class:** `TFMListColumns`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list columns); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `render` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListBase`. Dependency trong source: `TFMListElementAttribute`, `TFMListVisualizationInterface`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua Construct, render → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMListColumns instance = TFMListColumns::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListConfiguration`
1. **Tên class:** `TFMListConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (list configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `displayStatus` (boolean) — display trạng thái; `useSingleSelection` (boolean) — use single selection; `listId` (TFMListId) — danh sách mã định danh
4. **Method chính và khi nào dùng:** `parmDisplayStatus` — khi cần đọc/ghi tham số; `parmUseSingleSelection` — khi cần đọc/ghi tham số; `parmListId` — khi cần đọc/ghi tham số; `Construct` — khi cần khởi tạo/xây dựng; `getListTags` — khi cần lấy hoặc tra cứu; `populateListTags` — khi cần xem method body để xác định hành vi; `addTagsToMap` — khi cần ghi/cập nhật state; `addRow` — khi cần ghi/cập nhật state; … còn 3 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListBase`. Dependency trong source: `TFMListRows`, `TFMListTextElement`, `TFMListImageElement`, `TFMListCustomComponent`, `TFMHelper`, `TFMListRow`, `TFMListCustomComponentFinder`, `TFMListVisualizationInterface`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmDisplayStatus, parmUseSingleSelection, parmListId → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMListConfiguration instance = TFMListConfiguration::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListConverter`
1. **Tên class:** `TFMListConverter`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list converter); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `buildListConfiguration` — khi cần khởi tạo/xây dựng; `buildLayoutFromData` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMListConfiguration`, `TFMList`, `TFMListBase`, `TFMParameterAttribute`, `TFMListElementAttribute`, `TFMListELementAttribute`, `TFMGetRegistrationConfiguration`, `TFMFormHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua buildListConfiguration, buildLayoutFromData → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListConverter instance = new TFMListConverter(<args>);` rồi `instance.buildListConfiguration(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListCountOrderLines`
1. **Tên class:** `TFMListCountOrderLines`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (list count order lines); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `quantityCellContent` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListOrderLines`. Dependency trong source: `TFMListIdAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua quantityCellContent → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListCountOrderLines instance = new TFMListCountOrderLines(<args>);` rồi `instance.quantityCellContent(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListCustomComponent`
1. **Tên class:** `TFMListCustomComponent`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list custom component); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `possibleParents` — khi cần xem method body để xác định hành vi; `name` — khi cần xem method body để xác định hành vi; `attributeSummary` — khi cần xem method body để xác định hành vi; `resourceIcon` — khi cần xem method body để xác định hành vi; `SubComponents` — khi cần xem method body để xác định hành vi; `enrichDataset` — khi cần xem method body để xác định hành vi; `getCustomComponents` — khi cần lấy hoặc tra cứu; `getCustomComponentSubTree` — khi cần lấy hoặc tra cứu; … còn 6 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListBase`. Dependency trong source: `TFMHelper`, `TFMAttributeHandler`, `TFMParameterAttribute`, `TFMFormLookupHelper`, `TFMListVisualizationInterface`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua possibleParents, name, attributeSummary → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListCustomComponentDimensionDisplay`
1. **Tên class:** `TFMListCustomComponentDimensionDisplay`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (list custom component dimension display); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `storageDimensions` (NoYes) — storage dimensions; `productDimensions` (NoYes) — product dimensions; `trackingDimensions` (NoYes) — tracking dimensions; `showItemName` (NoYes) — show mặt hàng tên/định danh; `showItemId` (NoYes) — show mặt hàng mã định danh; `width` (TFMListWidth) — width; `blackList` (Set) — black danh sách
4. **Method chính và khi nào dùng:** `parmwidth` — khi cần đọc/ghi tham số; `new` — khi cần khởi tạo/xây dựng; `parmItemID` — khi cần đọc/ghi tham số; `parmItemIName` — khi cần đọc/ghi tham số; `parmStorageDimensions` — khi cần đọc/ghi tham số; `parmProductDimensions` — khi cần đọc/ghi tham số; `parmTrackingDimensions` — khi cần đọc/ghi tham số; `possibleParents` — khi cần xem method body để xác định hành vi; … còn 5 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListCustomComponent`. Dependency trong source: `TFMListElementAttribute`, `TFMListColumn`, `TFMListTextElement`, `TFMInventDimHelper`, `TFMConstants`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua parmwidth, new, parmItemID → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListCustomComponentDimensionDisplay instance = new TFMListCustomComponentDimensionDisplay(<args>);` rồi `instance.parmwidth(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListCustomComponentFinder`
1. **Tên class:** `TFMListCustomComponentFinder`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list custom component finder); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `retSet` (Set) — ret set
4. **Method chính và khi nào dùng:** `getCustomComponentsInList` — khi cần lấy hoặc tra cứu; `renderCustomComponent` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMAbstractListRender`. Dependency trong source: `TFMListConfiguration`, `TFMListCustomComponent`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua getCustomComponentsInList, renderCustomComponent → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListCustomComponentFinder instance = new TFMListCustomComponentFinder(<args>);` rồi `instance.getCustomComponentsInList(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListCustomComponentProgressBar`
1. **Tên class:** `TFMListCustomComponentProgressBar`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list custom component progress bar); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `SubComponents` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListCustomComponent`. Dependency trong source: `TFMListElementAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua SubComponents → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListCustomComponentProgressBar instance = new TFMListCustomComponentProgressBar(<args>);` rồi `instance.SubComponents(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListCustomComponentTrafficLight`
1. **Tên class:** `TFMListCustomComponentTrafficLight`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list custom component traffic light); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `width` (TFMListWidth) — width; `fieldName` (FieldName) — field/trường tên/định danh
4. **Method chính và khi nào dùng:** `parmwidth` — khi cần đọc/ghi tham số; `parmFieldName` — khi cần đọc/ghi tham số; `parmRedLightValue` — khi cần đọc/ghi tham số; `parmYellowLightValue` — khi cần đọc/ghi tham số; `parmGreenLightValue` — khi cần đọc/ghi tham số; `resourceIcon` — khi cần xem method body để xác định hành vi; `SubComponents` — khi cần xem method body để xác định hành vi; `possibleParents` — khi cần xem method body để xác định hành vi; … còn 2 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListCustomComponent`. Dependency trong source: `TFMListElementAttribute`, `TFMListImageElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmwidth, parmFieldName, parmRedLightValue → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListCustomComponentTrafficLight instance = new TFMListCustomComponentTrafficLight(<args>);` rồi `instance.parmwidth(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListEditorTree`
1. **Tên class:** `TFMListEditorTree`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list editor tree); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `tree` (FormTreeControl) — tree; `fgc` (FormGroupControl) — fgc; `buttonGroup` (FormButtonGroupControl) — button group; `idXs` (Map) — mã định danh xs; `idX2recId` (Map) — mã định danh x2rec mã định danh; `actionIds` (Map) — action ids; `formRun` (FormRun) — form run; `listID` (TFMListId) — danh sách mã định danh; `currentVersion` (Version) — current phiên bản; `VersionLocked` (boolean) — phiên bản trạng thái khóa; `currentCopy` (RecId) — current copy; `currentCopyName` (Name) — current copy tên/định danh; … còn 1 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Construct` — khi cần khởi tạo/xây dựng; `rebuildTree` — khi cần xem method body để xác định hành vi; `currentSelectedRecId` — khi cần xem method body để xác định hành vi; `setSelection` — khi cần ghi/cập nhật state; `addTreeItemId` — khi cần ghi/cập nhật state; `buildTree` — khi cần khởi tạo/xây dựng; `buildSubTree` — khi cần khởi tạo/xây dựng; … còn 14 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMListELementAttribute`, `TFMListElementAttribute`, `TFMGetRegistrationConfiguration`, `TFMListBase`, `TFMListCustomComponent`, `TFMHelper`, `TFMPageXSDParser`, `TFMPageXsdParserProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, Construct, rebuildTree → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMListEditorTree instance = TFMListEditorTree::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListElement`
1. **Tên class:** `TFMListElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `horizontalAlignment` (TFMListXAlign) — horizontal alignment; `verticalAlignment` (TFMListYAlign) — vertical alignment
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmHorizontalAlignment` — khi cần đọc/ghi tham số; `parmVerticalAlignment` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListBase`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, parmHorizontalAlignment, parmVerticalAlignment → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListElement instance = new TFMListElement(<args>);` rồi `instance.parmHorizontalAlignment(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListElementAttribute`
1. **Tên class:** `TFMListElementAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (list element attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `name` (Name) — tên/định danh
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmCacheKey` — khi cần đọc/ghi tham số; `parmName` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua new, parmCacheKey, parmName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListElementAttribute instance = new TFMListElementAttribute(<args>);` rồi `instance.parmCacheKey(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListElementHierarchyInterface`
1. **Tên class:** `TFMListElementHierarchyInterface`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (list element hierarchy interface); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getChildren` — khi cần lấy hoặc tra cứu; `addChild` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua getChildren, addChild → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListElements`
1. **Tên class:** `TFMListElements`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list elements); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `getCustomComponents` — khi cần lấy hoặc tra cứu; `render` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListBase`. Dependency trong source: `TFMListElementAttribute`, `TFMListElementHierarchyInterface`, `TFMListCustomComponent`, `TFMListVisualizationInterface`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua Construct, getCustomComponents, render → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMListElements instance = TFMListElements::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListIDAttribute`
1. **Tên class:** `TFMListIDAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (list id attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `oldDefaultValue` (TFMListId) — old mặc định giá trị
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmListId` — khi cần đọc/ghi tham số; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua new, parmListId, parmCacheKey → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListIDAttribute instance = new TFMListIDAttribute(<args>);` rồi `instance.parmListId(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListImageElement`
1. **Tên class:** `TFMListImageElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list image element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `width` (TFMListWidth) — width; `height` (TFMListHeight) — height; `sourceId` (TFMDataSetField) — source mã định danh; `dataMember` (TFMDataSetField) — dữ liệu member; `dataMemberValues` (Map) — dữ liệu member values; `valuesElement` (TFMListValuesElement) — values element
4. **Method chính và khi nào dùng:** `parmwidth` — khi cần đọc/ghi tham số; `parmheight` — khi cần đọc/ghi tham số; `parmDataMember` — khi cần đọc/ghi tham số; `parmSourceId` — khi cần đọc/ghi tham số; `addValueElement` — khi cần ghi/cập nhật state; `new` — khi cần khởi tạo/xây dựng; `ConstructImageElement` — khi cần khởi tạo/xây dựng; `findImage` — khi cần lấy hoặc tra cứu; … còn 3 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListElement`. Composition/member fields: `TFMListValuesElement`. Dependency trong source: `TFMListElementAttribute`, `TFMListValueElement`, `TFMDocGetMedia`, `TFMImageHelper`, `TFMListbase`, `TFMListVisualizationInterface`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmwidth, parmheight, parmDataMember → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListImageElement instance = new TFMListImageElement(<args>);` rồi `instance.parmwidth(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListItemContract`
1. **Tên class:** `TFMListItemContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (list item contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `listItemId` (str) — danh sách mặt hàng mã định danh; `title` (str) — tiêu đề; `line2` (str) — line2; `line3` (str) — line3; `line4` (str) — line4; `iconName` (str) — icon tên/định danh; `line4Class` (str) — line4 class
4. **Method chính và khi nào dùng:** `parmListItemId` — khi cần đọc/ghi tham số; `parmTitle` — khi cần đọc/ghi tham số; `parmLine2` — khi cần đọc/ghi tham số; `parmLine3` — khi cần đọc/ghi tham số; `parmLine4` — khi cần đọc/ghi tham số; `parmLine4Class` — khi cần đọc/ghi tham số; `parmIconName` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua parmListItemId, parmTitle, parmLine2 → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListItemContract instance = new TFMListItemContract(<args>);` rồi `instance.parmListItemId(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListLookupJournalHeader`
1. **Tên class:** `TFMListLookupJournalHeader`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list lookup journal header); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getList` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListOrdersWithImage`. Dependency trong source: `TFMListIdAttribute`, `TFMListConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua getList → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListLookupJournalHeader instance = new TFMListLookupJournalHeader(<args>);` rồi `instance.getList(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListLookupNoSlash`
1. **Tên class:** `TFMListLookupNoSlash`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list lookup no slash); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `quantityCellContent` — khi cần xem method body để xác định hành vi; `getList` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListOrderLines`. Dependency trong source: `TFMListIdAttribute`, `TFMListConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua quantityCellContent, getList → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListLookupNoSlash instance = new TFMListLookupNoSlash(<args>);` rồi `instance.quantityCellContent(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListLookupWithRegistrations`
1. **Tên class:** `TFMListLookupWithRegistrations`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list lookup with registrations); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `quantityCellContent` — khi cần xem method body để xác định hành vi; `getList` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListOrderLines`. Dependency trong source: `TFMListIdAttribute`, `TFMListConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua quantityCellContent, getList → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListLookupWithRegistrations instance = new TFMListLookupWithRegistrations(<args>);` rồi `instance.quantityCellContent(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListNewVersion`
1. **Tên class:** `TFMListNewVersion`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list new version); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `Main` — khi cần xem method body để xác định hành vi; `makeANewVersionOfAList` — khi cần xem method body để xác định hành vi; `makeNewList` — khi cần xem method body để xác định hành vi; `copyListFromCode` — khi cần xem method body để xác định hành vi; `copySubTree` — khi cần xem method body để xác định hành vi; `refreshCallingForm` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMListsProvider`, `TFMList`, `TFMImportLists`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua Main, makeANewVersionOfAList, makeNewList → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListNewVersion instance = new TFMListNewVersion(<args>);` rồi `instance.Main(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListOrderLines`
1. **Tên class:** `TFMListOrderLines`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (list order lines); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `dontShowDimTracking` (boolean) — dont show dim tracking; `dontShowDimProduct` (boolean) — dont show dim product; `dontShowDimStorage` (boolean) — dont show dim storage
4. **Method chính và khi nào dùng:** `getList` — khi cần lấy hoặc tra cứu; `quantityCellContent` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMList`. Dependency trong source: `TFMListIdAttribute`, `TFMListConfiguration`, `TFMListRow`, `TFMListColumn`, `TFMListCustomComponentDimensionDisplay`, `TFMListTextElement`, `TFMListColumns`, `TFMListImageElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua getList, quantityCellContent → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListOrderLines instance = new TFMListOrderLines(<args>);` rồi `instance.getList(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListOrders`
1. **Tên class:** `TFMListOrders`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (list orders); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `getList` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMList`. Dependency trong source: `TFMListConfiguration`, `TFMListImageElement`, `TFMListRow`, `TFMListColumn`, `TFMListTextElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua new, getList → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListOrders instance = new TFMListOrders(<args>);` rồi `instance.getList(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListOrders3x2Image`
1. **Tên class:** `TFMListOrders3x2Image`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (list orders3x2 image); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `getList` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMList`. Dependency trong source: `TFMListConfiguration`, `TFMListRow`, `TFMListColumn`, `TFMListImageElement`, `TFMListTextElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua new, getList → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListOrders3x2Image instance = new TFMListOrders3x2Image(<args>);` rồi `instance.getList(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListOrdersWithImage`
1. **Tên class:** `TFMListOrdersWithImage`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (list orders with image); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `useWideLines` (boolean) — use wide lines
4. **Method chính và khi nào dùng:** `getList` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMList`. Dependency trong source: `TFMListIdAttribute`, `TFMListConfiguration`, `TFMListRow`, `TFMListColumn`, `TFMListImageElement`, `TFMListTextElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua getList → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListOrdersWithImage instance = new TFMListOrdersWithImage(<args>);` rồi `instance.getList(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListOrdersWithImageWideLines`
1. **Tên class:** `TFMListOrdersWithImageWideLines`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (list orders with image wide lines); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getList` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListOrdersWithImage`. Dependency trong source: `TFMListConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua getList → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListOrdersWithImageWideLines instance = new TFMListOrdersWithImageWideLines(<args>);` rồi `instance.getList(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListPageConfiguration`
1. **Tên class:** `TFMListPageConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (list page configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `openEnabled` (boolean) — open trạng thái bật; `refreshEnabled` (boolean) — refresh trạng thái bật
4. **Method chính và khi nào dùng:** `parmOpenEnabled` — khi cần đọc/ghi tham số; `parmRefreshEnabled` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPageConfiguration`. Dependency trong source: `TFMPageConfigurationAttributeAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmOpenEnabled, parmRefreshEnabled → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListPendingAdhocRegistrationsList`
1. **Tên class:** `TFMListPendingAdhocRegistrationsList`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list pending adhoc registrations list); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getList` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMList`. Dependency trong source: `TFMListIdAttribute`, `TFMListConfiguration`, `TFMListRow`, `TFMListColumn`, `TFMListImageElement`, `TFMPagesProvider`, `TFMPage`, `TFMPageUnplannedItemRegistration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua getList → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListPendingAdhocRegistrationsList instance = new TFMListPendingAdhocRegistrationsList(<args>);` rồi `instance.getList(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListRegistrations`
1. **Tên class:** `TFMListRegistrations`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list registrations); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getList` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMList`. Dependency trong source: `TFMListIdAttribute`, `TFMListConfiguration`, `TFMListRow`, `TFMListColumn`, `TFMListImageElement`, `TFMListTextElement`, `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua getList → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListRegistrations instance = new TFMListRegistrations(<args>);` rồi `instance.getList(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListRow`
1. **Tên class:** `TFMListRow`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list row); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `columns` (TFMListColumns) — columns
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `makeColumn` — khi cần xem method body để xác định hành vi; `addColumn` — khi cần ghi/cập nhật state; `addChild` — khi cần ghi/cập nhật state; `render` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListBase`. Composition/member fields: `TFMListColumns`. Dependency trong source: `TFMListElementAttribute`, `TFMListColumn`, `TFMListVisualizationInterface`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua Construct, makeColumn, addColumn → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMListRow instance = TFMListRow::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListRows`
1. **Tên class:** `TFMListRows`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list rows); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `render` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListBase`. Dependency trong source: `TFMListElementAttribute`, `TFMListVisualizationInterface`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua Construct, render → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMListRows instance = TFMListRows::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListsCollection`
1. **Tên class:** `TFMListsCollection`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (lists collection); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `lists` (Map) — lists
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `addList` — khi cần ghi/cập nhật state; `getList` — khi cần lấy hoặc tra cứu; `listMap` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMList`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, addList, getList → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListsCollection instance = new TFMListsCollection(<args>);` rồi `instance.addList(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListShortLookup`
1. **Tên class:** `TFMListShortLookup`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list short lookup); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getList` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMList`. Dependency trong source: `TFMListConfiguration`, `TFMListRow`, `TFMListColumn`, `TFMListTextElement`, `TFMListImageElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua getList → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListShortLookup instance = new TFMListShortLookup(<args>);` rồi `instance.getList(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListsProvider`
1. **Tên class:** `TFMListsProvider`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Service/Provider (lists provider); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `languageListsMap` (Map) — language lists map
4. **Method chính và khi nào dùng:** `getEntity` — khi cần lấy hoặc tra cứu; `setEntity` — khi cần ghi/cập nhật state; `constructEntityImpl` — khi cần khởi tạo/xây dựng; `createListsForLanguage` — khi cần khởi tạo/xây dựng; `instance` — khi cần xem method body để xác định hành vi; `getAllLists` — khi cần lấy hoặc tra cứu; `getAllListsXML` — khi cần lấy hoặc tra cứu; `version` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMCachedProvider`. Dependency trong source: `TFMListsCollection`, `TFMList`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/process/request context (tham số của method public hoặc state của instance) → xử lý chọn handler/service hoặc serialize output qua getEntity, setEntity, constructEntityImpl → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListsProvider instance = new TFMListsProvider(<args>);` rồi `instance.getEntity(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: dùng đúng factory, cache và runtime context; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListTagCountingLineWithRegistrations`
1. **Tên class:** `TFMListTagCountingLineWithRegistrations`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list tag counting line with registrations); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `quantityCellContent` — khi cần xem method body để xác định hành vi; `getList` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListOrderLines`. Dependency trong source: `TFMListIdAttribute`, `TFMListConfiguration`, `TFMListRows`, `TFMListRow`, `TFMListColumn`, `TFMListTextElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua quantityCellContent, getList → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListTagCountingLineWithRegistrations instance = new TFMListTagCountingLineWithRegistrations(<args>);` rồi `instance.quantityCellContent(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListTextElement`
1. **Tên class:** `TFMListTextElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list text element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `text` (str) — text; `dataMember` (str) — dữ liệu member; `fontId` (TFMFontId) — font mã định danh
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `ConstructTextElement` — khi cần khởi tạo/xây dựng; `addValueElement` — khi cần ghi/cập nhật state; `appendToXML` — khi cần ghi/cập nhật state; `attributeSummary` — khi cần xem method body để xác định hành vi; `parmText` — khi cần đọc/ghi tham số; `parmDataMember` — khi cần đọc/ghi tham số; `parmFontId` — khi cần đọc/ghi tham số; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListElement`. Dependency trong source: `TFMListELementAttribute`, `TFMListValueElement`, `TFMListBase`, `TFMListVisualizationInterface`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua Construct, ConstructTextElement, addValueElement → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMListTextElement instance = TFMListTextElement::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListValueElement`
1. **Tên class:** `TFMListValueElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list value element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `valueIf` (TFMListValueIf) — giá trị if; `dataMemberValue` (Description255) — dữ liệu member giá trị; `fontId` (TFMFontID) — font mã định danh; `text` (TFMDataSetField) — text; `resName` (ResourceName) — res tên/định danh
4. **Method chính và khi nào dùng:** `parmIf` — khi cần đọc/ghi tham số; `parmDataMemberValue` — khi cần đọc/ghi tham số; `parmFontId` — khi cần đọc/ghi tham số; `parmText` — khi cần đọc/ghi tham số; `parmImageId` — khi cần đọc/ghi tham số; `attributeSummary` — khi cần xem method body để xác định hành vi; `appendToXML` — khi cần ghi/cập nhật state; `render` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListBase`. Dependency trong source: `TFMListELementAttribute`, `TFMHelper`, `TFMListVisualizationInterface`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmIf, parmDataMemberValue, parmFontId → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListValueElement instance = new TFMListValueElement(<args>);` rồi `instance.parmIf(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListValuesAndDataTable`
1. **Tên class:** `TFMListValuesAndDataTable`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list values and data table); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `ListValues` (str) — danh sách values; `ListSeparator` (str) — danh sách separator; `dataTable` (str) — dữ liệu table; `dataKeyColumn` (str) — dữ liệu key column; `dataDisplayColumn` (str) — dữ liệu display column; `dataLinkedElement` (int) — dữ liệu linked element; `filterColumn` (str) — bộ lọc column; `linkedElement` (int) — linked element; `linkColumn` (str) — link column
4. **Method chính và khi nào dùng:** `parmDataDisplayColumn` — khi cần đọc/ghi tham số; `parmListSeparator` — khi cần đọc/ghi tham số; `parmListValues` — khi cần đọc/ghi tham số; `parmVisible` — khi cần đọc/ghi tham số; `parmDefaultValue` — khi cần đọc/ghi tham số; `map2ListValues` — khi cần xem method body để xác định hành vi; `parmDataTable` — khi cần đọc/ghi tham số; `parmFilterColumn` — khi cần đọc/ghi tham số; … còn 7 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRegistrationCollector`. Dependency trong source: `TFMListValuesInterface`, `TFMDataTableInterface`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmDataDisplayColumn, parmListSeparator, parmListValues → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListValuesElement`
1. **Tên class:** `TFMListValuesElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list values element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `render` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListBase`. Dependency trong source: `TFMListELementAttribute`, `TFMListVisualizationInterface`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua render → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListValuesElement instance = new TFMListValuesElement(<args>);` rồi `instance.render(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListValuesInterface`
1. **Tên class:** `TFMListValuesInterface`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (list values interface); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `parmListSeparator` — khi cần đọc/ghi tham số; `parmListValues` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua parmListSeparator, parmListValues → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListVisualization`
1. **Tên class:** `TFMListVisualization`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list visualization); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `totalWidth` (int) — total width; `valuesMap` (Map) — values map; `listConfigElement` (TFMListConfiguration) — danh sách cấu hình element; `list` (TFMList) — danh sách; `drawCells` (boolean) — draw cells; `drawDevice` (boolean) — draw thiết bị; `listHtmlOutputResult` (str) — danh sách html output result
4. **Method chính và khi nào dùng:** `parmList` — khi cần đọc/ghi tham số; `parmDrawDevice` — khi cần đọc/ghi tham số; `parmDrawCells` — khi cần đọc/ghi tham số; `parmValuesMap` — khi cần đọc/ghi tham số; `DrawList` — khi cần xem method body để xác định hành vi; `getHtmlForList` — khi cần lấy hoặc tra cứu; `findDataset` — khi cần lấy hoặc tra cứu; `XMLFieldsToMap` — khi cần parse/serialize XML; … còn 10 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMAbstractListRender`. Composition/member fields: `TFMListConfiguration`, `TFMList`. Dependency trong source: `TFMHtmlViewerCtrl`, `TFMListsProvider`, `TFMDrawPage`, `TFMXMLFormat`, `TFMPage`, `TFMPagesProvider`, `TFMXMLFormatOrders`, `TFMXMLFormatOrderLines`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmList, parmDrawDevice, parmDrawCells → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListVisualization instance = new TFMListVisualization(<args>);` rồi `instance.parmList(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListVisualizationInterface`
1. **Tên class:** `TFMListVisualizationInterface`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (list visualization interface); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `render` — khi cần xem method body để xác định hành vi; `renderList` — khi cần xem method body để xác định hành vi; `renderRows` — khi cần xem method body để xác định hành vi; `renderRow` — khi cần xem method body để xác định hành vi; `renderColumns` — khi cần xem method body để xác định hành vi; `renderColumn` — khi cần xem method body để xác định hành vi; `renderElements` — khi cần xem method body để xác định hành vi; `renderText` — khi cần xem method body để xác định hành vi; … còn 4 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMListBase`, `TFMListConfiguration`, `TFMListRows`, `TFMListRow`, `TFMListColumns`, `TFMListColumn`, `TFMListElements`, `TFMListTextElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua render, renderList, renderRows → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMListWorkLogList`
1. **Tên class:** `TFMListWorkLogList`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (list work log list); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getList` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMList`. Dependency trong source: `TFMListIdAttribute`, `TFMListConfiguration`, `TFMListRow`, `TFMListColumn`, `TFMListCustomComponentTrafficLight`, `TFMListTextElement`, `TFMListImageElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua getList → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMListWorkLogList instance = new TFMListWorkLogList(<args>);` rồi `instance.getList(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLocalizationContract`
1. **Tên class:** `TFMLocalizationContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (localization contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `key` (str) — key; `translation` (str) — translation
4. **Method chính và khi nào dùng:** `parmKey` — khi cần đọc/ghi tham số; `parmTranslation` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmKey, parmTranslation → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLocalizationContract instance = new TFMLocalizationContract(<args>);` rồi `instance.parmKey(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLockOrder`
1. **Tên class:** `TFMLockOrder`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (lock order); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `type` (TFMOrderTypes) — loại; `backendId` (TFMBackendId) — backend mã định danh; `backendNum` (Num) — backend num; `backendType` (Str) — backend loại; `orderType` (TFMOrderTypes) — đơn hàng loại
4. **Method chính và khi nào dùng:** `canBeEnqueued` — khi cần kiểm tra điều kiện; `description` — khi cần xem method body để xác định hành vi; `getDocumentTypes` — khi cần lấy hoặc tra cứu; `getDocumentContentSubject` — khi cần lấy hoặc tra cứu; `process` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentHandler`. Dependency trong source: `TFMConstants`, `TFMDataSourceBlock`, `TFMDataSourceBlockLockOrderList`, `TFMBackendIDInstance`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua canBeEnqueued, description, getDocumentTypes → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLockOrder instance = new TFMLockOrder(<args>);` rồi `instance.canBeEnqueued(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicBlock`
1. **Tên class:** `TFMLogicBlock`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic block); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `refConf` (TFMReferenceDataConfiguration) — ref conf; `components` (TFMLogicComponentCollection) — components; `name` (Name) — tên/định danh; `inheritanceHandler` (TFMLogicBlockDataInheritanceHandler) — inheritance handler; `request` (TFMRequestElement) — request; `logicContext` (TFMLogicContext) — logic ngữ cảnh; `fields` (Map) — fields; `categories` (Set) — categories; `instanceId` (int) — instance mã định danh
4. **Method chính và khi nào dùng:** `setInstanceID` — khi cần ghi/cập nhật state; `getInstanceID` — khi cần lấy hoặc tra cứu; `inputs` — khi cần xem method body để xác định hành vi; `autoCreatedProcesses` — khi cần xem method body để xác định hành vi; `outputs` — khi cần xem method body để xác định hành vi; `parmRequest` — khi cần đọc/ghi tham số; `parmLogicContext` — khi cần đọc/ghi tham số; `addField` — khi cần ghi/cập nhật state; … còn 14 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMReferenceDataConfiguration`, `TFMLogicComponentCollection`, `TFMLogicBlockDataInheritanceHandler`, `TFMRequestElement`, `TFMLogicContext`. Dependency trong source: `TFMLogicInputOutputContainer`, `TFMProcess`, `TFMLogicStepOperatorInterface`, `TFMFormLookupHelper`, `TFMParameterAttribute`, `TFMLogicComponent`, `TFMProcessBlocksParametersEdit`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua setInstanceID, getInstanceID, inputs → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicBlock instance = new TFMLogicBlock(<args>);` rồi `instance.setInstanceID(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicBlockAddon`
1. **Tên class:** `TFMLogicBlockAddon`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic block addon); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `listOfAddonsAvailable` — khi cần xem method body để xác định hành vi; `addonName` — khi cần ghi/cập nhật state; `addonDescription` — khi cần ghi/cập nhật state; `compatibleWithBlock` — khi cần xem method body để xác định hành vi; `modifyRegistrationCollectors` — khi cần xem method body để xác định hành vi; `modifyHeaderCollectors` — khi cần xem method body để xác định hành vi; `modifyDataBeforePost` — khi cần xem method body để xác định hành vi; `modifyRequestBeforePost` — khi cần xem method body để xác định hành vi; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMLogicBlock`, `TFMRegistrationCollectors`, `TFMReferenceDataConfiguration`, `TFMRequestElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua listOfAddonsAvailable, addonName, addonDescription → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicBlockAddonCollection`
1. **Tên class:** `TFMLogicBlockAddonCollection`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic block addon collection); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `blockAddons` (Map) — block addons; `process` (TFMProcess) — process; `latestId` (int) — latest mã định danh; `addedClasses` (Map) — added classes; `subFgc` (FormGroupControl) — sub fgc; `fmbc` (FormMenuButtonControl) — fmbc
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `new` — khi cần khởi tạo/xây dựng; `blockAddons` — khi cần xem method body để xác định hành vi; `addBlockAddon` — khi cần ghi/cập nhật state; `removeBlockAddon` — khi cần ghi/cập nhật state; `modifyBlockHeaders` — khi cần xem method body để xác định hành vi; `modifyBlockCollectors` — khi cần xem method body để xác định hành vi; `modifyDataBeforePost` — khi cần xem method body để xác định hành vi; … còn 6 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMProcess`. Dependency trong source: `TFMLogicBlock`, `TFMLogicBlockAddon`, `TFMReferenceDataConfiguration`, `TFMRegistrationCollectors`, `TFMRequestElement`, `TFMLogicBlockCollection`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua Construct, new, blockAddons → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMLogicBlockAddonCollection instance = TFMLogicBlockAddonCollection::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicBlockAddonDisableValueTransfers`
1. **Tên class:** `TFMLogicBlockAddonDisableValueTransfers`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic block addon disable value transfers); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `addonName` — khi cần ghi/cập nhật state; `compatibleWithBlock` — khi cần xem method body để xác định hành vi; `addonDescription` — khi cần ghi/cập nhật state; `modifyRegistrationCollectors` — khi cần xem method body để xác định hành vi; `modifyHeaderCollectors` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicBlockAddon`. Dependency trong source: `TFMLogicBlock`, `TFMRegistrationCollectors`, `TFMRegistrationCollector`, `TFMReferenceDataConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua addonName, compatibleWithBlock, addonDescription → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicBlockAddonDisableValueTransfers instance = new TFMLogicBlockAddonDisableValueTransfers(<args>);` rồi `instance.addonName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicBlockCaptureSignature`
1. **Tên class:** `TFMLogicBlockCaptureSignature`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic block capture signature); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `registrationCollectors` — khi cần xem method body để xác định hành vi; `headerFieldsNeeded` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `post` — khi cần thực thi xử lý; `prePostRegistrationCollectors` — khi cần xem method body để xác định hành vi; `blockIcon` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicBlock`. Dependency trong source: `TFMLogicBlockDataCollectionInterface`, `TFMRegistrationCollectors`, `TFMRequestElement`, `TFMRegistrationCollectorSignature`, `TFMReferenceDataConfiguration`, `TFMLogicComponentDataContext`, `TFMPostResponseData`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua registrationCollectors, headerFieldsNeeded, new → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicBlockCaptureSignature instance = new TFMLogicBlockCaptureSignature(<args>);` rồi `instance.registrationCollectors(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicBlockCollection`
1. **Tên class:** `TFMLogicBlockCollection`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic block collection); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `hash2CollectorIds` (Map) — hash2 collector ids; `blocks` (Map) — blocks; `blockNodes` (Map) — block nodes; `hash2BlockName` (Map) — hash2 block tên/định danh; `headerCollectors` (Set) — header collectors; `trackXs` (Map) — track xs; `tracks` (Map) — tracks; `trackDataInheritance` (Map) — track dữ liệu inheritance; `inheritanceBlocksData` (Map) — inheritance blocks dữ liệu; `blockCollectorMap` (Map) — block collector map; `blockHeaderMap` (Map) — block header map; `blockAddons` (TFMLogicBlockAddonCollection) — block addons; … còn 1 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `inheritanceFromStepName` — khi cần xem method body để xác định hành vi; `setProcess` — khi cần ghi/cập nhật state; `getProcess` — khi cần lấy hoặc tra cứu; `getBlockDatasources` — khi cần lấy hoặc tra cứu; `getBlockCollectors` — khi cần lấy hoặc tra cứu; `copyInheritance` — khi cần xem method body để xác định hành vi; `getBlockHeaders` — khi cần lấy hoặc tra cứu; … còn 43 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMLogicBlockAddonCollection`, `TFMProcess`. Dependency trong source: `TFMLogicBlock`, `TFMOrderPostDataSetAttribute`, `TFMFormLookupHelper`, `TFMRegistrationCollectors`, `TFMLogicBlockDataCollectionInterface`, `TFMRegistrationCollector`, `TFMReferenceDataConfiguration`, `TFMLogicComponent`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua new, inheritanceFromStepName, setProcess → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMLogicBlockCollection instance = TFMLogicBlockCollection::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicBlockCustomBaseBlock`
1. **Tên class:** `TFMLogicBlockCustomBaseBlock`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic block custom base block); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `regCols` (TFMRegistrationCollectors) — reg cols; `prePostCols` (TFMRegistrationCollectors) — pre post cols; `theBlockName` (TFMCustomLogicBlockName) — the block tên/định danh; `iconName` (TFMImageName) — icon tên/định danh
4. **Method chính và khi nào dùng:** `headerFieldsNeeded` — khi cần xem method body để xác định hành vi; `registrationCollectors` — khi cần xem method body để xác định hành vi; `prePostRegistrationCollectors` — khi cần xem method body để xác định hành vi; `post` — khi cần thực thi xử lý; `parmCustomBlock` — khi cần đọc/ghi tham số; `setBlockName` — khi cần ghi/cập nhật state; `loadCustomBlock` — khi cần xem method body để xác định hành vi; `blockIcon` — khi cần xem method body để xác định hành vi; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicBlock`. Composition/member fields: `TFMRegistrationCollectors`. Dependency trong source: `TFMLogicBlockDataCollectionInterface`, `TFMReferenceDataConfiguration`, `TFMPostResponseData`, `TFMRegistrationCollector`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua headerFieldsNeeded, registrationCollectors, prePostRegistrationCollectors → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicBlockCustomBaseBlock instance = new TFMLogicBlockCustomBaseBlock(<args>);` rồi `instance.headerFieldsNeeded(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicBlockDataCollectionInterface`
1. **Tên class:** `TFMLogicBlockDataCollectionInterface`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic block data collection interface); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `headerFieldsNeeded` — khi cần xem method body để xác định hành vi; `registrationCollectors` — khi cần xem method body để xác định hành vi; `post` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMReferenceDataConfiguration`, `TFMRegistrationCollectors`, `TFMPostResponseData`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua headerFieldsNeeded, registrationCollectors, post → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicBlockDataInheritanceHandler`
1. **Tên class:** `TFMLogicBlockDataInheritanceHandler`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic block data inheritance handler); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `fieldNames` (Set) — field/trường names; `datasourcesAvailable` (Map) — datasources available; `prePostDataSourcesAvailable` (Map) — pre post dữ liệu sources available; `previousBlocks` (Set) — previous blocks; `parentBlockName` (str) — parent block tên/định danh; `variableLookups` (Map) — variable lookups; `variables` (Set) — variables
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `new` — khi cần khởi tạo/xây dựng; `addVariableName` — khi cần ghi/cập nhật state; `variableExists` — khi cần xem method body để xác định hành vi; `variableNames` — khi cần xem method body để xác định hành vi; `addVariableLookup` — khi cần ghi/cập nhật state; `VariableLookupClass` — khi cần xem method body để xác định hành vi; `previousBlocksEnumerator` — khi cần xem method body để xác định hành vi; … còn 17 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMRequestElement`, `TFMLogicContext`, `TFMHelper`, `TFMSearchGenericTable`, `TFMGenericDataHelper`, `TFMRegistrationCollector`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua Construct, new, addVariableName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMLogicBlockDataInheritanceHandler instance = TFMLogicBlockDataInheritanceHandler::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicBlockItemInfo`
1. **Tên class:** `TFMLogicBlockItemInfo`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic block item info); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `headerFieldsNeeded` — khi cần xem method body để xác định hành vi; `registrationCollectors` — khi cần xem method body để xác định hành vi; `blockName` — khi cần xem method body để xác định hành vi; `post` — khi cần thực thi xử lý; `prePostRegistrationCollectors` — khi cần xem method body để xác định hành vi; `blockIcon` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicBlock`. Dependency trong source: `TFMLogicBlockDataCollectionInterface`, `TFMReferenceDataConfiguration`, `TFMGetReferenceData`, `TFMRegistrationCollectors`, `TFMRegistrationCollectorInformation`, `TFMConditions`, `TFMCondition`, `TFMLogicContextInfoContext`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua new, headerFieldsNeeded, registrationCollectors → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicBlockItemInfo instance = new TFMLogicBlockItemInfo(<args>);` rồi `instance.headerFieldsNeeded(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicBlockPostAdhocRegistrationInterface`
1. **Tên class:** `TFMLogicBlockPostAdhocRegistrationInterface`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic block post adhoc registration interface); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `post` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMPostResponseData`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua post → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicBlockPrePostDataCollectionInterface`
1. **Tên class:** `TFMLogicBlockPrePostDataCollectionInterface`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic block pre post data collection interface); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `prePostRegistrationCollectors` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMRegistrationCollectors`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua prePostRegistrationCollectors → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicBlockPrePostDataModifyInterface`
1. **Tên class:** `TFMLogicBlockPrePostDataModifyInterface`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic block pre post data modify interface); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `preparePost` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua preparePost → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicBlockProvideTableNamesInterface`
1. **Tên class:** `TFMLogicBlockProvideTableNamesInterface`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic block provide table names interface); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `tablesProvided` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua tablesProvided → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicBlocksContract`
1. **Tên class:** `TFMLogicBlocksContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic blocks contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `blockName` (Name) — block tên/định danh; `className` (ClassName) — class tên/định danh; `resourcePath` (str) — resource path; `purchReqStatus` (str) — purch req trạng thái; `classType` (str) — class loại; `boxText` (str) — box text; `numberOfInputs` (int) — number of inputs; `numberOfOutputs` (int) — number of outputs; `editorName` (str) — editor tên/định danh; `categories` (List) — categories
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmBlockName` — khi cần đọc/ghi tham số; `parmClassName` — khi cần đọc/ghi tham số; `parmResourcePath` — khi cần đọc/ghi tham số; `parmClassType` — khi cần đọc/ghi tham số; `parmBoxText` — khi cần đọc/ghi tham số; `parmNumberOfInputs` — khi cần đọc/ghi tham số; `parmNumberOfOutputs` — khi cần đọc/ghi tham số; … còn 2 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua new, parmBlockName, parmClassName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicBlocksContract instance = new TFMLogicBlocksContract(<args>);` rồi `instance.parmBlockName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicBlockTakeImage`
1. **Tên class:** `TFMLogicBlockTakeImage`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic block take image); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `headerFieldsNeeded` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `registrationCollectors` — khi cần xem method body để xác định hành vi; `prePostRegistrationCollectors` — khi cần xem method body để xác định hành vi; `post` — khi cần thực thi xử lý; `blockIcon` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicBlock`. Dependency trong source: `TFMLogicBlockDataCollectionInterface`, `TFMReferenceDataConfiguration`, `TFMLogicComponentDataContext`, `TFMRegistrationCollectors`, `TFMRegistrationCollectorImageCapture`, `TFMRequestBasicElement`, `TFMPostResponseData`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua headerFieldsNeeded, new, registrationCollectors → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicBlockTakeImage instance = new TFMLogicBlockTakeImage(<args>);` rồi `instance.headerFieldsNeeded(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicComponent`
1. **Tên class:** `TFMLogicComponent`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic component); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `refCon` (TFMReferenceDataConfiguration) — ref con; `request` (TFMRequestElement) — request; `subComponents` (TFMLogicComponentCollection) — sub components
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `headerFieldsNeeded` — khi cần xem method body để xác định hành vi; `registrationCollectors` — khi cần xem method body để xác định hành vi; `prePostRegistrationCollectors` — khi cần xem method body để xác định hành vi; `requestClassProvided` — khi cần xem method body để xác định hành vi; `componentRequest` — khi cần xem method body để xác định hành vi; `SetRequest` — khi cần ghi/cập nhật state; `provideDataIfPossible` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMReferenceDataConfiguration`, `TFMRequestElement`, `TFMLogicComponentCollection`. Dependency trong source: `TFMRegistrationCollectors`, `TFMXMLDeserializer`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, headerFieldsNeeded, registrationCollectors → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicComponentCollection`
1. **Tên class:** `TFMLogicComponentCollection`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic component collection); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `components` (Map) — components
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Construct` — khi cần khởi tạo/xây dựng; `addComponent` — khi cần ghi/cập nhật state; `getHeaders` — khi cần lấy hoặc tra cứu; `getCollectors` — khi cần lấy hoặc tra cứu; `getComponent` — khi cần lấy hoặc tra cứu; `modifyRequest` — khi cần xem method body để xác định hành vi; `setRequests` — khi cần ghi/cập nhật state; … còn 2 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMLogicComponent`, `TFMReferenceDataConfiguration`, `TFMRegistrationCollectors`, `TFMRequestElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, Construct, addComponent → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMLogicComponentCollection instance = TFMLogicComponentCollection::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicComponentDataContext`
1. **Tên class:** `TFMLogicComponentDataContext`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic component data context); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `inputData` (TableName) — input dữ liệu; `blockName` (Name) — block tên/định danh
4. **Method chính và khi nào dùng:** `headerFieldsNeeded` — khi cần xem method body để xác định hành vi; `registrationCollectors` — khi cần xem method body để xác định hành vi; `parmInputData` — khi cần đọc/ghi tham số; `parmBlockName` — khi cần đọc/ghi tham số; `requestClassProvided` — khi cần xem method body để xác định hành vi; `getData` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicComponent`. Dependency trong source: `TFMDataInputEnabledInterface`, `TFMReferenceDataConfiguration`, `TFMGetReferenceData`, `TFMRegistrationCollectors`, `TFMRequestElement`, `TFMRequestBasicElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua headerFieldsNeeded, registrationCollectors, parmInputData → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicComponentDataContext instance = new TFMLogicComponentDataContext(<args>);` rồi `instance.headerFieldsNeeded(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicComponentDimensions`
1. **Tên class:** `TFMLogicComponentDimensions`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (logic component dimensions); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `headerFieldsNeeded` — khi cần xem method body để xác định hành vi; `parmDisableProductDim` — khi cần đọc/ghi tham số; `parmDisableStorageDim` — khi cần đọc/ghi tham số; `parmDisableTrackingDim` — khi cần đọc/ghi tham số; `getInventDim` — khi cần lấy hoặc tra cứu; `requestClassProvided` — khi cần xem method body để xác định hành vi; `registrationCollectors` — khi cần xem method body để xác định hành vi; `componentRequest` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicComponent`. Dependency trong source: `TFMReferenceDataConfiguration`, `TFMGetReferenceData`, `TFMRequestElement`, `TFMRequestItemAndDimensionElement`, `TFMRegistrationCollectors`, `TFMInventDimHelper`, `TFMLogicContextDimensionSetup`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua headerFieldsNeeded, parmDisableProductDim, parmDisableStorageDim → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicComponentDimensions instance = new TFMLogicComponentDimensions(<args>);` rồi `instance.headerFieldsNeeded(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicComponentQuantity`
1. **Tên class:** `TFMLogicComponentQuantity`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic component quantity); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `addScrapQty` (boolean) — add scrap qty; `itemIdStringForConditions` (str) — mặt hàng mã định danh string for conditions
4. **Method chính và khi nào dùng:** `headerFieldsNeeded` — khi cần xem method body để xác định hành vi; `parmAddScrapQty` — khi cần đọc/ghi tham số; `parmItemIdStringForConditions` — khi cần đọc/ghi tham số; `registrationCollectors` — khi cần xem method body để xác định hành vi; `requestClassProvided` — khi cần xem method body để xác định hành vi; `componentRequest` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicComponent`. Dependency trong source: `TFMReferenceDataConfiguration`, `TFMGetReferenceData`, `TFMRegistrationCollectors`, `TFMRegistrationCollector`, `TFMConstants`, `TFMConditions`, `TFMCondition`, `TFMLogicContextInverterOperator`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua headerFieldsNeeded, parmAddScrapQty, parmItemIdStringForConditions → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicComponentQuantity instance = new TFMLogicComponentQuantity(<args>);` rồi `instance.headerFieldsNeeded(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContext`
1. **Tên class:** `TFMLogicContext`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `ContextObjects` (Map) — ngữ cảnh objects; `aliases` (Map) — aliases; `DataContext` (Map) — dữ liệu ngữ cảnh; `fieldsAndContent` (Map) — fields and content; `fieldsToTransfer` (Set) — fields to transfer; `executedFromDevice` (boolean) — executed from thiết bị
4. **Method chính và khi nào dùng:** `parmExecutedFromDevice` — khi cần đọc/ghi tham số; `new` — khi cần khởi tạo/xây dựng; `Construct` — khi cần khởi tạo/xây dựng; `addContextObject` — khi cần ghi/cập nhật state; `addFieldContent` — khi cần ghi/cập nhật state; `getDataSourcesToTransfer` — khi cần lấy hoặc tra cứu; `getDataContextMap` — khi cần lấy hoặc tra cứu; `extractTableData` — khi cần xem method body để xác định hành vi; … còn 14 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMLogicContextObject`, `TFMHelper`, `TFMRequestElement`, `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmExecutedFromDevice, new, Construct → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMLogicContext instance = TFMLogicContext::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextAndGate`
1. **Tên class:** `TFMLogicContextAndGate`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context and gate); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Name` — khi cần xem method body để xác định hành vi; `process` — khi cần thực thi xử lý; `icon` — khi cần xem method body để xác định hành vi; `evaluate` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicContextTools`. Dependency trong source: `TFMLogicContext`, `TFMCondition`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, Name, process → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicContextAndGate instance = new TFMLogicContextAndGate(<args>);` rồi `instance.Name(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextComparator`
1. **Tên class:** `TFMLogicContextComparator`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context comparator); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Name` — khi cần xem method body để xác định hành vi; `process` — khi cần thực thi xử lý; `icon` — khi cần xem method body để xác định hành vi; `evaluate` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicContextTools`. Dependency trong source: `TFMLogicContext`, `TFMCondition`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, Name, process → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicContextComparator instance = new TFMLogicContextComparator(<args>);` rồi `instance.Name(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextDataContract`
1. **Tên class:** `TFMLogicContextDataContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context data contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `logicContextCls` (ClassName) — logic ngữ cảnh cls; `obj` (TFMLogicContextObject) — obj; `objDesc` (Description255) — obj desc; `inputsAndOutputs` (str) — inputs and outputs
4. **Method chính và khi nào dùng:** `contractObject` — khi cần xem method body để xác định hành vi; `parmLogicContextClass` — khi cần đọc/ghi tham số; `getDescription` — khi cần lấy hoặc tra cứu; `outputType` — khi cần xem method body để xác định hành vi; `inputTypes` — khi cần xem method body để xác định hành vi; `noOfinputs` — khi cần xem method body để xác định hành vi; `displayValue` — khi cần xem method body để xác định hành vi; `detailsValue` — khi cần xem method body để xác định hành vi; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMLogicContextObject`. Dependency trong source: `TFMDescriptionAttribute`, `TFMDocGetMedia`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua contractObject, parmLogicContextClass, getDescription → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextDimensionSetup`
1. **Tên class:** `TFMLogicContextDimensionSetup`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (logic context dimension setup); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `itemId` (ItemId) — mặt hàng mã định danh; `fieldName` (TFMInventDimFieldName) — field/trường tên/định danh; `inventDimGroupSetup` (InventDimGroupSetup) — invent dim group setup; `storDims` (Set) — stor dims; `prodDims` (Set) — prod dims; `tracDims` (Set) — trac dims; `prodDimSetup` (EcoResProductDimGroupSetup) — prod dim setup; `inventTable` (InventTable) — invent table; `prettyName` (str) — pretty tên/định danh
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Construct` — khi cần khởi tạo/xây dựng; `Name` — khi cần xem method body để xác định hành vi; `alternateName` — khi cần xem method body để xác định hành vi; `parmItemId` — khi cần đọc/ghi tham số; `process` — khi cần thực thi xử lý; `lookupInventDimFieldName` — khi cần lấy hoặc tra cứu; `icon` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicContextFunctions`. Dependency trong source: `TFMHelper`, `TFMInventDimensionSetupContract`, `TFMInventDimHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua new, Construct, Name → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMLogicContextDimensionSetup instance = TFMLogicContextDimensionSetup::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextExecuteExpression`
1. **Tên class:** `TFMLogicContextExecuteExpression`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context execute expression); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Name` — khi cần xem method body để xác định hành vi; `process` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicContextObject`. Dependency trong source: `TFMExpressions`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, Name, process → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicContextExecuteExpression instance = new TFMLogicContextExecuteExpression(<args>);` rồi `instance.Name(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextFieldValue`
1. **Tên class:** `TFMLogicContextFieldValue`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context field value); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Name` — khi cần xem method body để xác định hành vi; `process` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicContextObject`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, Name, process → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicContextFieldValue instance = new TFMLogicContextFieldValue(<args>);` rồi `instance.Name(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextFunctions`
1. **Tên class:** `TFMLogicContextFunctions`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context functions); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `outputType` — khi cần xem method body để xác định hành vi; `process` — khi cần thực thi xử lý; `icon` — khi cần xem method body để xác định hành vi; `Name` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicContextObject`. Dependency trong source: `TFMLogicContextFunctionsDataContract`, `TFMAttributeHandler`, `TFMConditionEditorFormClass`, `TFMLogicContext`, `TFMDocCustomFunctionFlow`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, outputType, process → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextFunctionsDataContract`
1. **Tên class:** `TFMLogicContextFunctionsDataContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context functions data contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `keyName` (str) — key tên/định danh; `parameters` (container) — parameters; `parameterNames` (container) — parameter names
4. **Method chính và khi nào dùng:** `contractObject` — khi cần xem method body để xác định hành vi; `parmLogicContextClass` — khi cần đọc/ghi tham số; `parmParameters` — khi cần đọc/ghi tham số; `parmKeyName` — khi cần đọc/ghi tham số; `detailsValue` — khi cần xem method body để xác định hành vi; `alternateHeadline` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicContextDataContract`. Dependency trong source: `TFMLogicContextObject`, `TFMLogicContextFunctions`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua contractObject, parmLogicContextClass, parmParameters → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicContextFunctionsDataContract instance = new TFMLogicContextFunctionsDataContract(<args>);` rồi `instance.contractObject(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextGetFieldFromTable`
1. **Tên class:** `TFMLogicContextGetFieldFromTable`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context get field from table); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Name` — khi cần xem method body để xác định hành vi; `outputType` — khi cần xem method body để xác định hành vi; `DictField2ContextType` — khi cần xem method body để xác định hành vi; `process` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicContextObject`. Dependency trong source: `TFMLogicContextFunctionsDataContract`, `TFMLogicContext`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, Name, outputType → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicContextGetFieldFromTable instance = new TFMLogicContextGetFieldFromTable(<args>);` rồi `instance.Name(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextInfoContext`
1. **Tên class:** `TFMLogicContextInfoContext`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context info context); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `itemId` (ItemId) — mặt hàng mã định danh; `inventTable` (InventTable) — invent table
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `Name` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `parmItemId` — khi cần đọc/ghi tham số; `process` — khi cần thực thi xử lý; `icon` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicContextFunctions`. Dependency trong source: `TFMInfoContextContract`, `TFMHelper`, `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua Construct, Name, new → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMLogicContextInfoContext instance = TFMLogicContextInfoContext::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextInverterOperator`
1. **Tên class:** `TFMLogicContextInverterOperator`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context inverter operator); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Name` — khi cần xem method body để xác định hành vi; `process` — khi cần thực thi xử lý; `icon` — khi cần xem method body để xác định hành vi; `evaluate` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicContextTools`. Dependency trong source: `TFMLogicContext`, `TFMCondition`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, Name, process → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicContextInverterOperator instance = new TFMLogicContextInverterOperator(<args>);` rồi `instance.Name(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextObject`
1. **Tên class:** `TFMLogicContextObject`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context object); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `children` (Set) — children; `dataContract` (TFMLogicContextDataContract) — dữ liệu contract; `inputTypes` (Set) — input types; `outputType` (TFMLogicContextTypes) — output loại; `noOfInput` (int) — no of input; `context` (TFMLogicContext) — ngữ cảnh; `categories` (Set) — categories
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `noOfInputs` — khi cần xem method body để xác định hành vi; `validate` — khi cần kiểm tra điều kiện; `inputTypes` — khi cần xem method body để xác định hành vi; `categories` — khi cần xem method body để xác định hành vi; `outputType` — khi cần xem method body để xác định hành vi; `process` — khi cần thực thi xử lý; `Name` — khi cần xem method body để xác định hành vi; … còn 8 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMLogicContextDataContract`, `TFMLogicContext`. Dependency trong source: `TFMCondition`, `TFMLogicContextFunctionsDataContract`, `TFMDocCustomFunctionFlow`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, noOfInputs, validate → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextOperatorDataContract`
1. **Tên class:** `TFMLogicContextOperatorDataContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context operator data contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicContextDataContract`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicContextOperatorDataContract instance = new TFMLogicContextOperatorDataContract(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextORGate`
1. **Tên class:** `TFMLogicContextORGate`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context or gate); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Name` — khi cần xem method body để xác định hành vi; `process` — khi cần thực thi xử lý; `icon` — khi cần xem method body để xác định hành vi; `evaluate` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicContextTools`. Dependency trong source: `TFMLogicContext`, `TFMCondition`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, Name, process → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicContextORGate instance = new TFMLogicContextORGate(<args>);` rồi `instance.Name(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextToBoolean`
1. **Tên class:** `TFMLogicContextToBoolean`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context to boolean); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `new` — khi cần khởi tạo/xây dựng; `Name` — khi cần xem method body để xác định hành vi; `process` — khi cần thực thi xử lý; `icon` — khi cần xem method body để xác định hành vi; `evaluate` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicContextTools`. Dependency trong source: `TFMLogicContext`, `TFMCondition`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua Construct, new, Name → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMLogicContextToBoolean instance = TFMLogicContextToBoolean::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextToDecimal`
1. **Tên class:** `TFMLogicContextToDecimal`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context to decimal); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `new` — khi cần khởi tạo/xây dựng; `Name` — khi cần xem method body để xác định hành vi; `process` — khi cần thực thi xử lý; `icon` — khi cần xem method body để xác định hành vi; `evaluate` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicContextTools`. Dependency trong source: `TFMLogicContext`, `TFMCondition`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua Construct, new, Name → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMLogicContextToDecimal instance = TFMLogicContextToDecimal::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextToInteger`
1. **Tên class:** `TFMLogicContextToInteger`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context to integer); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `new` — khi cần khởi tạo/xây dựng; `Name` — khi cần xem method body để xác định hành vi; `process` — khi cần thực thi xử lý; `icon` — khi cần xem method body để xác định hành vi; `evaluate` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicContextTools`. Dependency trong source: `TFMLogicContext`, `TFMCondition`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua Construct, new, Name → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMLogicContextToInteger instance = TFMLogicContextToInteger::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextTools`
1. **Tên class:** `TFMLogicContextTools`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context tools); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Name` — khi cần xem method body để xác định hành vi; `icon` — khi cần xem method body để xác định hành vi; `evaluate` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicContextObject`. Dependency trong source: `TFMLogicContext`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, Name, icon → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicContextToString`
1. **Tên class:** `TFMLogicContextToString`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic context to string); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Name` — khi cần xem method body để xác định hành vi; `process` — khi cần thực thi xử lý; `icon` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicContextTools`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, Name, process → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicContextToString instance = new TFMLogicContextToString(<args>);` rồi `instance.Name(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicInputOutputContainer`
1. **Tên class:** `TFMLogicInputOutputContainer`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (logic input output container); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `connection` (Map) — connection; `connectionBlocks` (Map) — connection blocks
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Construct` — khi cần khởi tạo/xây dựng; `NoOfConnections` — khi cần xem method body để xác định hành vi; `addConnectionName` — khi cần ghi/cập nhật state; `getConnectionName` — khi cần lấy hoặc tra cứu; `getIdFromConnectionName` — khi cần lấy hoặc tra cứu; `getBlockAtConnection` — khi cần lấy hoặc tra cứu; `getBlockAtConnectionName` — khi cần lấy hoặc tra cứu; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMLogicBlock`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, Construct, NoOfConnections → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMLogicInputOutputContainer instance = TFMLogicInputOutputContainer::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicStepOperatorClassifyAndReplaceInput`
1. **Tên class:** `TFMLogicStepOperatorClassifyAndReplaceInput`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic step operator classify and replace input); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `variableName` (TFMFlowVariableName) — variable tên/định danh; `contextField` (TFMFlowContextField) — ngữ cảnh field/trường
4. **Method chính và khi nào dùng:** `blockName` — khi cần xem method body để xác định hành vi; `blockIcon` — khi cần xem method body để xác định hành vi; `parmContextField` — khi cần đọc/ghi tham số; `runLogic` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicBlock`. Dependency trong source: `TFMLogicStepOperatorInterface`, `TFMRequestElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua blockName, blockIcon, parmContextField → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicStepOperatorClassifyAndReplaceInput instance = new TFMLogicStepOperatorClassifyAndReplaceInput(<args>);` rồi `instance.blockName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicStepOperatorClassifyInput`
1. **Tên class:** `TFMLogicStepOperatorClassifyInput`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic step operator classify input); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `variableName` (TFMFlowVariableName) — variable tên/định danh; `contextField` (TFMFlowContextField) — ngữ cảnh field/trường
4. **Method chính và khi nào dùng:** `blockName` — khi cần xem method body để xác định hành vi; `blockIcon` — khi cần xem method body để xác định hành vi; `parmVariableName` — khi cần đọc/ghi tham số; `parmContextField` — khi cần đọc/ghi tham số; `runLogic` — khi cần thực thi xử lý; `lookupVariableContext` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicBlock`. Dependency trong source: `TFMLogicStepOperatorInterface`, `TFMLogicStepOperatorVariableContextLookupInterface`, `TFMRequestElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua blockName, blockIcon, parmVariableName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicStepOperatorClassifyInput instance = new TFMLogicStepOperatorClassifyInput(<args>);` rồi `instance.blockName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicStepOperatorDeclareVariable`
1. **Tên class:** `TFMLogicStepOperatorDeclareVariable`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic step operator declare variable); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `variableName` (TFMFlowVariableName) — variable tên/định danh; `startValue` (str) — start giá trị
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `blockName` — khi cần xem method body để xác định hành vi; `blockIcon` — khi cần xem method body để xác định hành vi; `parmVariableName` — khi cần đọc/ghi tham số; `parmStartValue` — khi cần đọc/ghi tham số; `runLogic` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicBlock`. Dependency trong source: `TFMLogicStepOperatorInterface`, `TFMLogicInputOutputContainer`, `TFMRequestElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua new, blockName, blockIcon → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicStepOperatorDeclareVariable instance = new TFMLogicStepOperatorDeclareVariable(<args>);` rồi `instance.blockName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicStepOperatorDimensionSetupGate`
1. **Tên class:** `TFMLogicStepOperatorDimensionSetupGate`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic step operator dimension setup gate); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `itemNumber` (str) — mặt hàng number; `dimensionFunctionValue` (str) — dimension function giá trị; `dimensionFieldName` (TFMInventDimFieldName) — dimension field/trường tên/định danh
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `blockName` — khi cần xem method body để xác định hành vi; `blockIcon` — khi cần xem method body để xác định hành vi; `parmDimensionFieldName` — khi cần đọc/ghi tham số; `parmItemNumber` — khi cần đọc/ghi tham số; `parmDimensionFunctionValue` — khi cần đọc/ghi tham số; `runLogic` — khi cần thực thi xử lý; `runGateLogic` — khi cần thực thi xử lý; … còn 2 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicBlock`. Dependency trong source: `TFMLogicStepOperatorInterface`, `TFMLogicStepOperatorIf`, `TFMLogicInputOutputContainer`, `TFMConstants`, `TFMRequestElement`, `TFMHelper`, `TFMFormLookupHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua new, blockName, blockIcon → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicStepOperatorDimensionSetupGate instance = new TFMLogicStepOperatorDimensionSetupGate(<args>);` rồi `instance.blockName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicStepOperatorFindRelatedTable`
1. **Tên class:** `TFMLogicStepOperatorFindRelatedTable`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic step operator find related table); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `tableFrom` (TableName) — table from; `tableToRelation` (TFMTableRelation) — table to relation; `tableTo` (TableName) — table to
4. **Method chính và khi nào dùng:** `blockName` — khi cần xem method body để xác định hành vi; `tablesProvided` — khi cần xem method body để xác định hành vi; `parmTableToRelation` — khi cần đọc/ghi tham số; `parmTableFrom` — khi cần đọc/ghi tham số; `runLogic` — khi cần thực thi xử lý; `lookupExpression` — khi cần lấy hoặc tra cứu; `blockIcon` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicBlock`. Dependency trong source: `TFMLogicStepOperatorInterface`, `TFMLogicBlockProvideTableNamesInterface`, `TFMGenericDataHelper`, `TFMRequestElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua blockName, tablesProvided, parmTableToRelation → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicStepOperatorFindRelatedTable instance = new TFMLogicStepOperatorFindRelatedTable(<args>);` rồi `instance.blockName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicStepOperatorFindTable`
1. **Tên class:** `TFMLogicStepOperatorFindTable`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic step operator find table); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `tableName` (TableName) — table tên/định danh; `contextField` (TFMFlowVariableContextLookupField) — ngữ cảnh field/trường
4. **Method chính và khi nào dùng:** `blockName` — khi cần xem method body để xác định hành vi; `tablesProvided` — khi cần xem method body để xác định hành vi; `parmTableName` — khi cần đọc/ghi tham số; `parmContextField` — khi cần đọc/ghi tham số; `runLogic` — khi cần thực thi xử lý; `blockIcon` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicBlock`. Dependency trong source: `TFMLogicStepOperatorInterface`, `TFMLogicBlockProvideTableNamesInterface`, `TFMRequestElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua blockName, tablesProvided, parmTableName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicStepOperatorFindTable instance = new TFMLogicStepOperatorFindTable(<args>);` rồi `instance.blockName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicStepOperatorIf`
1. **Tên class:** `TFMLogicStepOperatorIf`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic step operator if); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `compareOperator` (TFMListValueIf) — compare operator; `valueName` (str) — giá trị tên/định danh; `compareValue` (str) — compare giá trị; `compareNumerically` (NoYes) — compare numerically
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `blockName` — khi cần xem method body để xác định hành vi; `operator2ShortString` — khi cần xem method body để xác định hành vi; `blockIcon` — khi cần xem method body để xác định hành vi; `parmCompareNumerically` — khi cần đọc/ghi tham số; `parmCompareValue1` — khi cần đọc/ghi tham số; `parmCompareOperator` — khi cần đọc/ghi tham số; `parmCompareValue2` — khi cần đọc/ghi tham số; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicBlock`. Dependency trong source: `TFMLogicStepOperatorInterface`, `TFMLogicInputOutputContainer`, `TFMConstants`, `TFMRequestElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua new, blockName, operator2ShortString → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicStepOperatorIf instance = new TFMLogicStepOperatorIf(<args>);` rồi `instance.blockName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicStepOperatorInterface`
1. **Tên class:** `TFMLogicStepOperatorInterface`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic step operator interface); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `runLogic` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMRequestElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua runLogic → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicStepOperatorThrowError`
1. **Tên class:** `TFMLogicStepOperatorThrowError`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic step operator throw error); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `textToThrow` (LabelString) — text to throw
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmErrorText` — khi cần đọc/ghi tham số; `blockIcon` — khi cần xem method body để xác định hành vi; `blockName` — khi cần xem method body để xác định hành vi; `runLogic` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicBlock`. Dependency trong source: `TFMLogicStepOperatorInterface`, `TFMLogicInputOutputContainer`, `TFMRequestElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua new, parmErrorText, blockIcon → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicStepOperatorThrowError instance = new TFMLogicStepOperatorThrowError(<args>);` rồi `instance.parmErrorText(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicStepOperatorTransferDataToField`
1. **Tên class:** `TFMLogicStepOperatorTransferDataToField`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic step operator transfer data to field); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `inputValue` (str) — input giá trị; `outputField` (str) — output field/trường
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `blockName` — khi cần xem method body để xác định hành vi; `blockIcon` — khi cần xem method body để xác định hành vi; `parmInputValue` — khi cần đọc/ghi tham số; `parmOutputField` — khi cần đọc/ghi tham số; `runLogic` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMLogicBlock`. Dependency trong source: `TFMLogicStepOperatorInterface`, `TFMLogicInputOutputContainer`, `TFMRequestElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua new, blockName, blockIcon → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogicStepOperatorTransferDataToField instance = new TFMLogicStepOperatorTransferDataToField(<args>);` rồi `instance.blockName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogicStepOperatorVariableContextLookupInterface`
1. **Tên class:** `TFMLogicStepOperatorVariableContextLookupInterface`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (logic step operator variable context lookup interface); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `lookupVariableContext` — khi cần lấy hoặc tra cứu; `parmVariableName` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua lookupVariableContext, parmVariableName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLogin`
1. **Tên class:** `TFMLogin`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (login); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `description` — khi cần xem method body để xác định hành vi; `getDocumentTypes` — khi cần lấy hoặc tra cứu; `process` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentHandler`. Dependency trong source: `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua description, getDocumentTypes, process → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLogin instance = new TFMLogin(<args>);` rồi `instance.description(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLookup`
1. **Tên class:** `TFMLookup`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (lookup); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `canBeEnqueued` — khi cần kiểm tra điều kiện; `description` — khi cần xem method body để xác định hành vi; `getDocumentTypes` — khi cần lấy hoặc tra cứu; `getDocumentContentSubject` — khi cần lấy hoặc tra cứu; `getResult` — khi cần lấy hoặc tra cứu; `process` — khi cần thực thi xử lý; `findClass` — khi cần lấy hoặc tra cứu; `subHandler` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentHandler`. Dependency trong source: `TFMLookupResponseElement`, `TFMDocumentTypeAttribute`, `TFMLookupResponseAttribute`, `TFMGetRegistrationConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua canBeEnqueued, description, getDocumentTypes → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLookup instance = new TFMLookup(<args>);` rồi `instance.canBeEnqueued(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLookupMethodForEDTAttribute`
1. **Tên class:** `TFMLookupMethodForEDTAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (lookup method for edt attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `parmType` (str) — parm loại
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmParameterType` — khi cần đọc/ghi tham số; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua new, parmParameterType, parmCacheKey → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLookupMethodForEDTAttribute instance = new TFMLookupMethodForEDTAttribute(<args>);` rồi `instance.parmParameterType(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLookupQueries`
1. **Tên class:** `TFMLookupQueries`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (lookup queries); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `lookupQuery` — khi cần lấy hoặc tra cứu; `fields` — khi cần xem method body để xác định hành vi; `fieldsFromQuery` — khi cần xem method body để xác định hành vi; `applyNamedFilterMapToQuery` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMLookupResponseElement`, `TFMRequestElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua lookupQuery, fields, fieldsFromQuery → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLookupQueries instance = new TFMLookupQueries(<args>);` rồi `instance.lookupQuery(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLookupResponseAttribute`
1. **Tên class:** `TFMLookupResponseAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (lookup response attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `documentType` (TFMDocumentTypeId) — document loại; `contentType` (TFMDocumentContentSubject) — content loại
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmContentType` — khi cần đọc/ghi tham số; `parmDocumentType` — khi cần đọc/ghi tham số; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`. Dependency trong source: `TFMGetRegistrationConfiguration`, `TFMPostAdhocRegistration`, `TFMLookup`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua new, parmContentType, parmDocumentType → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMLookupResponseAttribute instance = new TFMLookupResponseAttribute(<args>);` rồi `instance.parmContentType(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMLookupResponseElement`
1. **Tên class:** `TFMLookupResponseElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (lookup response element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `backendIds` (Map) — backend ids; `registrationCollectors` (Map) — registration collectors; `addValues` (Map) — add values; `buffers` (Map) — buffers; `htmls` (Map) — htmls; `documentType` (TFMDocumentTypeId) — document loại; `contentType` (TFMDocumentContentSubject) — content loại; `dataSources` (Map) — dữ liệu sources; `RecID2OrderType` (Map) — rec id2 đơn hàng loại; `sortingMap` (Map) — sorting map; `clsName` (className) — cls tên/định danh; `request` (TFMRequestElement) — request; … còn 1 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `contentType` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `Construct` — khi cần khởi tạo/xây dựng; `getBuffers` — khi cần lấy hoặc tra cứu; `removeResponse` — khi cần ghi/cập nhật state; `addResponse` — khi cần ghi/cập nhật state; `collectorsFromProcess` — khi cần xem method body để xác định hành vi; `getRequestElement` — khi cần lấy hoặc tra cứu; … còn 5 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMResponseElement`. Composition/member fields: `TFMRequestElement`. Dependency trong source: `TFMGetRegistrationConfiguration`, `TFMPostAdhocRegistration`, `TFMLookup`, `TFMDocumentHandler`, `TFMRegistrationCollectors`, `TFMRegistrationCollector`, `TFMXMLFormatLookup`, `TFMBackendIDInstance`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua contentType, new, Construct → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMLookupResponseElement instance = TFMLookupResponseElement::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMMediaItem`
1. **Tên class:** `TFMMediaItem`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (media item); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `name` (str) — tên/định danh; `base64` (str) — base64; `url` (str) — url
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmName` — khi cần đọc/ghi tham số; `parmBase64` — khi cần đọc/ghi tham số; `parmURL` — khi cần đọc/ghi tham số; `getBase64ForHtml` — khi cần lấy hoặc tra cứu; `getMediaForHtml` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua new, parmName, parmBase64 → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMMediaItem instance = new TFMMediaItem(<args>);` rồi `instance.parmName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMMediaProvider`
1. **Tên class:** `TFMMediaProvider`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Service/Provider (media provider); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `mediaStore` (TFMMediaStore) — media store
4. **Method chính và khi nào dùng:** `instance` — khi cần xem method body để xác định hành vi; `getEntity` — khi cần lấy hoặc tra cứu; `setEntity` — khi cần ghi/cập nhật state; `constructEntityImpl` — khi cần khởi tạo/xây dựng; `getBase64ForMedia` — khi cần lấy hoặc tra cứu; `getMedia` — khi cần lấy hoặc tra cứu; `setMedia` — khi cần ghi/cập nhật state; `removeMedia` — khi cần ghi/cập nhật state; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMCachedProvider`. Composition/member fields: `TFMMediaStore`. Dependency trong source: `TFMMediaItem`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/process/request context (tham số của method public hoặc state của instance) → xử lý chọn handler/service hoặc serialize output qua instance, getEntity, setEntity → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMMediaProvider instance = new TFMMediaProvider(<args>);` rồi `instance.instance(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: dùng đúng factory, cache và runtime context; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMMediaStore`
1. **Tên class:** `TFMMediaStore`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (media store); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `store` (Map) — store
4. **Method chính và khi nào dùng:** `getMedia` — khi cần lấy hoặc tra cứu; `addMedia` — khi cần ghi/cập nhật state; `removeMedia` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMMediaItem`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua getMedia, addMedia, removeMedia → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMMediaStore instance = new TFMMediaStore(<args>);` rồi `instance.getMedia(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMMenuAttribute`
1. **Tên class:** `TFMMenuAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (menu attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `iconName` (ResourceName) — icon tên/định danh; `name` (Name) — tên/định danh; `description` (Description) — mô tả; `label` (Name) — nhãn; `categories` (Set) — categories; `mainMenuEnabled` (boolean) — main menu trạng thái bật; `contextMenuEnabled` (boolean) — ngữ cảnh menu trạng thái bật; `oneClickSetup` (boolean) — one click setup
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmIconName` — khi cần đọc/ghi tham số; `parmName` — khi cần đọc/ghi tham số; `getCategories` — khi cần lấy hoặc tra cứu; `parmDescription` — khi cần đọc/ghi tham số; `parmLabel` — khi cần đọc/ghi tham số; `parmMainMenuEnabled` — khi cần đọc/ghi tham số; `parmContextMenuEnabled` — khi cần đọc/ghi tham số; … còn 3 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua new, parmIconName, parmName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMMenuAttribute instance = new TFMMenuAttribute(<args>);` rồi `instance.parmIconName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMMenuConfigContract`
1. **Tên class:** `TFMMenuConfigContract`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (menu config contract); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `pageId` (str) — page mã định danh; `title` (str) — tiêu đề; `iconName` (str) — icon tên/định danh; `standard` (boolean) — standard; `mandatory` (boolean) — mandatory; `offline` (boolean) — offline; `pageOffline` (boolean) — page offline; `hide` (boolean) — hide; `promoted` (boolean) — promoted; `updated` (int) — updated
4. **Method chính và khi nào dùng:** `parmPageId` — khi cần đọc/ghi tham số; `parmTitle` — khi cần đọc/ghi tham số; `parmIconName` — khi cần đọc/ghi tham số; `parmIsStandard` — khi cần đọc/ghi tham số; `parmIsMandatory` — khi cần đọc/ghi tham số; `parmIsHide` — khi cần đọc/ghi tham số; `parmIsOffline` — khi cần đọc/ghi tham số; `parmPageIsSetupForOffline` — khi cần đọc/ghi tham số; … còn 2 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua parmPageId, parmTitle, parmIconName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMMenuConfigContract instance = new TFMMenuConfigContract(<args>);` rồi `instance.parmPageId(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMMenuConfigurator`
1. **Tên class:** `TFMMenuConfigurator`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (menu configurator); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `customGroupsCreated` (boolean) — custom groups created; `comboBox` (FormComboBoxControl) — combo box; `menuMakerControl` (TFMMenuMakerCtrl) — menu maker control; `pages` (TFMPages) — pages; `imageLocations` (Map) — image locations; `menuItemsForSelectedGroup` (List) — menu các phần tử for selected group; `availableMenuItems` (Map) — available menu các phần tử; `availGroupPages` (Map) — avail group pages; `selectedItem` (str) — selected mặt hàng; `latestgroupID` (UserGroupId) — latestgroup mã định danh; `ds` (FormDataSource) — ds
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `setDS` — khi cần ghi/cập nhật state; `notifyUpdating` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `setSelectedGroup` — khi cần ghi/cập nhật state; `initMenus` — khi cần khởi tạo/xây dựng; `isAvailableForPage` — khi cần kiểm tra điều kiện; `addDefaultMenuPermissions` — khi cần ghi/cập nhật state; … còn 8 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMMenuMakerCtrl`, `TFMPages`. Dependency trong source: `TFMPagesProvider`, `TFMConstants`, `TFMPage`, `TFMImageHelper`, `TFMDocGetMedia`, `TFMGraphicsHelper`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua Construct, setDS, notifyUpdating → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMMenuConfigurator instance = TFMMenuConfigurator::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMMenuExport`
1. **Tên class:** `TFMMenuExport`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (menu export); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `menuItems` (Map) — menu các phần tử; `folders` (Map) — folders; `mainmenuItemMap` (Map) — mainmenu mặt hàng map
4. **Method chính và khi nào dùng:** `Main` — khi cần xem method body để xác định hành vi; `process` — khi cần thực thi xử lý; `sendFileToUser` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua Main, process, sendFileToUser → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMMenuExport instance = new TFMMenuExport(<args>);` rồi `instance.Main(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMMenuGroupingIconAttribute`
1. **Tên class:** `TFMMenuGroupingIconAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (menu grouping icon attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `groupingType` (str) — grouping loại
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmGroupingType` — khi cần đọc/ghi tham số; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua new, parmGroupingType, parmCacheKey → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMMenuGroupingIconAttribute instance = new TFMMenuGroupingIconAttribute(<args>);` rồi `instance.parmGroupingType(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMMenuItemsContainerInterface`
1. **Tên class:** `TFMMenuItemsContainerInterface`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (menu items container interface); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `currentPage` — khi cần xem method body để xác định hành vi; `setActiveMenuItem` — khi cần ghi/cập nhật state; `saveMenuItemsSetup` — khi cần xem method body để xác định hành vi; `showAddMenuItemsFormLookup` — khi cần xem method body để xác định hành vi; `parmLastSelectedMenuItemId` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMPage`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua currentPage, setActiveMenuItem, saveMenuItemsSetup → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMMenuItemsCtrl`
1. **Tên class:** `TFMMenuItemsCtrl`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (menu items ctrl); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `formClass` (TFMMenuItemsContainerInterface) — form class; `SendAvailableMenuItemsToJavascriptProperty` (FormProperty) — send available menu các phần tử to javascript property; `SendSelectedMenuItemsToJavascriptProperty` (FormProperty) — send selected menu các phần tử to javascript property; `SendSaveRequestToControlToJavascriptProperty` (FormProperty) — send save request to control to javascript property; `SetActiveMenuItemsToJavascriptProperty` (FormProperty) — set trạng thái hoạt động menu các phần tử to javascript property; `SendUpdatingToJavascriptProperty` (FormProperty) — send updating to javascript property; `createdMenuItems` (Map) — created menu các phần tử; `counter` (int) — counter
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `setFormClass` — khi cần ghi/cập nhật state; `sendUpdatingToControl` — khi cần xem method body để xác định hành vi; `sendMenuItemsToControl` — khi cần xem method body để xác định hành vi; `sendSaveRequestToControl` — khi cần xem method body để xác định hành vi; `SendUpdatingToJavascript` — khi cần xem method body để xác định hành vi; `SendSaveRequestToControlToJavascript` — khi cần xem method body để xác định hành vi; `SendAvailableMenuItemsToJavascript` — khi cần xem method body để xác định hành vi; … còn 7 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `FormTemplateContainerControl`. Composition/member fields: `TFMMenuItemsContainerInterface`. Dependency trong source: `TFMMenuItemsCtrlBuild`, `TFMMenuConfigContract`, `TFMPages`, `TFMPagesProvider`, `TFMLocalizationContract`, `TFMListVisualization`, `TFMPageMenuItemsFormHelper`, `TFMDocGetMedia`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua new, setFormClass, sendUpdatingToControl → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMMenuItemsCtrl instance = new TFMMenuItemsCtrl(<args>);` rồi `instance.setFormClass(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMMenuItemsCtrlBuild`
1. **Tên class:** `TFMMenuItemsCtrlBuild`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (menu items ctrl build); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `FormBuildContainerControl`. Dependency trong source: `TFMMenuItemsCtrl`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMMenuItemsCtrlBuild instance = new TFMMenuItemsCtrlBuild(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMMenuItemStateConfiguration`
1. **Tên class:** `TFMMenuItemStateConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (menu item state configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `menuItemName` (str) — menu mặt hàng tên/định danh; `icon` (str) — icon; `promoted` (real) — promoted; `title` (str) — tiêu đề; `enabled` (boolean) — trạng thái bật; `titleChanged` (boolean) — tiêu đề changed; `pageMenuItemPointsTo` (TFMPage) — page menu mặt hàng points to; `pageActionAttribute` (TFMPageActionAttribute) — page action attribute; `additionalProperties` (TFMPageMenuItemsAdditionalProperties) — additional properties
4. **Method chính và khi nào dùng:** `parmMenuItemName` — khi cần đọc/ghi tham số; `parmPromoted` — khi cần đọc/ghi tham số; `parmEnabled` — khi cần đọc/ghi tham số; `parmAdditionalProperties` — khi cần đọc/ghi tham số; `parmPageMenuItemPointsTo` — khi cần đọc/ghi tham số; `titleChanged` — khi cần xem method body để xác định hành vi; `parmTitle` — khi cần đọc/ghi tham số; `parmIcon` — khi cần đọc/ghi tham số; … còn 6 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMPage`, `TFMPageActionAttribute`, `TFMPageMenuItemsAdditionalProperties`. Dependency trong source: `TFMPagesProvider`, `TFMPageAdhocMenuItemsAdditionalProperties`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmMenuItemName, parmPromoted, parmEnabled → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMMenuItemStateConfiguration instance = TFMMenuItemStateConfiguration::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMMenuMakerCtrl`
1. **Tên class:** `TFMMenuMakerCtrl`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (menu maker ctrl); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `configurator` (TFMMenuConfigurator) — configurator; `SendAvailableMenuItemsToJavascriptProperty` (FormProperty) — send available menu các phần tử to javascript property; `SendSelectedMenuItemsToJavascriptProperty` (FormProperty) — send selected menu các phần tử to javascript property; `SendSaveRequestToControlToJavascriptProperty` (FormProperty) — send save request to control to javascript property; `SendUpdatingToJavascriptProperty` (FormProperty) — send updating to javascript property; `createdMenuItems` (Map) — created menu các phần tử; `counter` (int) — counter
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `setConfigurator` — khi cần ghi/cập nhật state; `sendUpdatingToControl` — khi cần xem method body để xác định hành vi; `sendMenuItemsToControl` — khi cần xem method body để xác định hành vi; `sendSaveRequestToControl` — khi cần xem method body để xác định hành vi; `SendUpdatingToJavascript` — khi cần xem method body để xác định hành vi; `SendSaveRequestToControlToJavascript` — khi cần xem method body để xác định hành vi; `SendAvailableMenuItemsToJavascript` — khi cần xem method body để xác định hành vi; … còn 6 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `FormTemplateContainerControl`. Composition/member fields: `TFMMenuConfigurator`. Dependency trong source: `TFMMenuMakerCtrlBuild`, `TFMLocalizationContract`, `TFMPage`, `TFMMenuConfigContract`, `TFMConstants`, `TFMListVisualization`, `TFMDocGetMedia`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua new, setConfigurator, sendUpdatingToControl → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMMenuMakerCtrl instance = new TFMMenuMakerCtrl(<args>);` rồi `instance.setConfigurator(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMMenuMakerCtrlBuild`
1. **Tên class:** `TFMMenuMakerCtrlBuild`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (menu maker ctrl build); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `FormBuildContainerControl`. Dependency trong source: `TFMMenuMakerCtrl`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMMenuMakerCtrlBuild instance = new TFMMenuMakerCtrlBuild(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMMethodParameterAttribute`
1. **Tên class:** `TFMMethodParameterAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (method parameter attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `method` (MethodName) — method; `parmType` (str) — parm loại
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmMethodName` — khi cần đọc/ghi tham số; `parmParameterType` — khi cần đọc/ghi tham số; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua new, parmMethodName, parmParameterType → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMMethodParameterAttribute instance = new TFMMethodParameterAttribute(<args>);` rồi `instance.parmMethodName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMNewPageFromProcess`
1. **Tên class:** `TFMNewPageFromProcess`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (new page from process); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMNewPageFromProcess instance = new TFMNewPageFromProcess(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMOrderLinesResponseElement`
1. **Tên class:** `TFMOrderLinesResponseElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (order lines response element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `new` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMOrderListResponseElement`. Dependency trong source: `TFMXMLFormatOrderLines`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua Construct, new → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMOrderLinesResponseElement instance = TFMOrderLinesResponseElement::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMOrderListGetOrderLinesDocumentTypeAttribute`
1. **Tên class:** `TFMOrderListGetOrderLinesDocumentTypeAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (order list get order lines document type attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `methodName` (MethodName) — method tên/định danh; `pageId` (TFMPageID) — page mã định danh
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmMethodName` — khi cần đọc/ghi tham số; `parmPageID` — khi cần đọc/ghi tham số; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua new, parmMethodName, parmPageID → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMOrderListGetOrderLinesDocumentTypeAttribute instance = new TFMOrderListGetOrderLinesDocumentTypeAttribute(<args>);` rồi `instance.parmMethodName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMOrderListGetOrdersDocumentTypeAttribute`
1. **Tên class:** `TFMOrderListGetOrdersDocumentTypeAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (order list get orders document type attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `methodName` (MethodName) — method tên/định danh; `pageId` (TFMPageID) — page mã định danh
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmMethodName` — khi cần đọc/ghi tham số; `parmPageID` — khi cần đọc/ghi tham số; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua new, parmMethodName, parmPageID → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMOrderListGetOrdersDocumentTypeAttribute instance = new TFMOrderListGetOrdersDocumentTypeAttribute(<args>);` rồi `instance.parmMethodName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMOrderListLineSelectionAttribute`
1. **Tên class:** `TFMOrderListLineSelectionAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (order list line selection attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `methodName` (MethodName) — method tên/định danh; `pageId` (TFMPageID) — page mã định danh
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmMethodName` — khi cần đọc/ghi tham số; `parmPageID` — khi cần đọc/ghi tham số; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua new, parmMethodName, parmPageID → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMOrderListLineSelectionAttribute instance = new TFMOrderListLineSelectionAttribute(<args>);` rồi `instance.parmMethodName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMOrderListPostOrderDocumentTypeAttribute`
1. **Tên class:** `TFMOrderListPostOrderDocumentTypeAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (order list post order document type attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `methodName` (MethodName) — method tên/định danh; `pageId` (TFMPageID) — page mã định danh
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmMethodName` — khi cần đọc/ghi tham số; `parmPageID` — khi cần đọc/ghi tham số; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua new, parmMethodName, parmPageID → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMOrderListPostOrderDocumentTypeAttribute instance = new TFMOrderListPostOrderDocumentTypeAttribute(<args>);` rồi `instance.parmMethodName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMOrderListResponseElement`
1. **Tên class:** `TFMOrderListResponseElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (order list response element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `records` (Map) — records; `RecID2OrderType` (Map) — rec id2 đơn hàng loại; `fieldsMap` (Map) — fields map; `className` (ClassName) — class tên/định danh; `sortingMap` (Map) — sorting map; `dataSources` (Map) — dữ liệu sources; `groupingField` (FieldName) — grouping field/trường; `groupFieldId` (FieldId) — group field/trường mã định danh; `groupedMap` (Map) — grouped map; `sortOrder` (AscendingDescending) — sort đơn hàng
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `new` — khi cần khởi tạo/xây dựng; `parmPageId` — khi cần đọc/ghi tham số; `parmGroupingField` — khi cần đọc/ghi tham số; `addRecord` — khi cần ghi/cập nhật state; `mergeRecordMap` — khi cần xem method body để xác định hành vi; `appendToXML` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMResponseElement`. Dependency trong source: `TFMXMLFormatOrders`, `TFMXMLFormat`, `TFMHelper`, `TFMDataSourceBlock`, `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua Construct, new, parmPageId → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMOrderListResponseElement instance = TFMOrderListResponseElement::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMOrderPostDataSetAttribute`
1. **Tên class:** `TFMOrderPostDataSetAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (order post data set attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `tableName` (TableName) — table tên/định danh
4. **Method chính và khi nào dùng:** `name` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua name, new → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMOrderPostDataSetAttribute instance = new TFMOrderPostDataSetAttribute(<args>);` rồi `instance.name(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMOrderTypeInterface`
1. **Tên class:** `TFMOrderTypeInterface`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (order type interface); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `OrderType` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua OrderType → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPage`
1. **Tên class:** `TFMPage`.
2. **Mục đích/chức năng chính:** Định nghĩa page và metadata runtime.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `title`, `name`, `type`, `configuration`, `actions`, `docHand`, `tileEntries`, `tileForms`, `referencedPages`, `dsBlocks` — tên/loại page, cấu hình, handler, tile và datasource.
4. **Method chính và khi nào dùng:** `getConfiguration`, `initializeDataSources`, `getXML`, `saveAllParms`, `getDocumentHandler` — lấy cấu hình, khởi tạo datasource, lưu parm và serialize.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition với `TFMPageConfiguration`, `TFMDocumentHandler`, `TFMDataSourceBlock`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Cấu hình → init action/datasource → page XML → client Tasklet.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Dùng page đã đăng ký; với order-list page có thể truyền page vào `TFMService::Construct(page)`.
8. **Lưu ý/rủi ro thường gặp:** Page type/configuration/datasource phải tương thích.

### `TFMPageActionAttribute`
1. **Tên class:** `TFMPageActionAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page action attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `hide` (boolean) — hide; `promoted` (boolean) — promoted; `mandatory` (boolean) — mandatory; `visibleWhenNoData` (boolean) — hiển thị when no dữ liệu; `icon` (ResourceName) — icon; `menuItemType` (TFMPageMenuItemType) — menu mặt hàng loại
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi; `parmMandatory` — khi cần đọc/ghi tham số; `parmHide` — khi cần đọc/ghi tham số; `parmPromoted` — khi cần đọc/ghi tham số; `parmSortingValue` — khi cần đọc/ghi tham số; `parmMenuItemType` — khi cần đọc/ghi tham số; … còn 2 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua new, parmCacheKey, useSingleton → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageActionAttribute instance = new TFMPageActionAttribute(<args>);` rồi `instance.parmCacheKey(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageAdhocMenuItemsAdditionalProperties`
1. **Tên class:** `TFMPageAdhocMenuItemsAdditionalProperties`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page adhoc menu items additional properties); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `documentType` (TFMDocumentTypeId) — document loại; `contentType` (TFMDocumentContentSubject) — content loại; `refreshOnSuccess` (boolean) — refresh on success; `pageId` (TFMPageID) — page mã định danh
4. **Method chính và khi nào dùng:** `parmRefreshOnSuccess` — khi cần đọc/ghi tham số; `parmContentType` — khi cần đọc/ghi tham số; `parmDocumentType` — khi cần đọc/ghi tham số; `parmNavigateTo` — khi cần đọc/ghi tham số; `getparameters` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPageMenuItemsAdditionalProperties`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua parmRefreshOnSuccess, parmContentType, parmDocumentType → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageAdhocMenuItemsAdditionalProperties instance = new TFMPageAdhocMenuItemsAdditionalProperties(<args>);` rồi `instance.parmRefreshOnSuccess(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageAttributeAttribute`
1. **Tên class:** `TFMPageAttributeAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page attribute attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `name` (str) — tên/định danh; `xPath` (str) — x path; `defaultValue` (anytype) — mặc định giá trị
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmXPath` — khi cần đọc/ghi tham số; `parmName` — khi cần đọc/ghi tham số; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua new, parmXPath, parmName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageAttributeAttribute instance = new TFMPageAttributeAttribute(<args>);` rồi `instance.parmXPath(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageClassOverrideDialog`
1. **Tên class:** `TFMPageClassOverrideDialog`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page class override dialog); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `checkmarkField` (DialogField) — checkmark field/trường; `fields` (Map) — fields; `savedPages` (Map) — saved pages; `dlg` (DialogGroup) — dlg; `printFromBuffer` (Common) — print from buffer; `ds` (FormDataSource) — ds
4. **Method chính và khi nào dùng:** `dialog` — khi cần xem method body để xác định hành vi; `run` — khi cần thực thi xử lý; `prompt` — khi cần xem method body để xác định hành vi; `getFromDialog` — khi cần lấy hoặc tra cứu; `canRunInNewSession` — khi cần kiểm tra điều kiện; `main` — khi cần xem method body để xác định hành vi; `setDataSource` — khi cần ghi/cập nhật state; `pack` — khi cần xem method body để xác định hành vi; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `RunBase`. Dependency trong source: `TFMPagesProvider`, `TFMPages`, `TFMPage`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua dialog, run, prompt → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageClassOverrideDialog instance = new TFMPageClassOverrideDialog(<args>);` rồi `instance.dialog(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageConfiguration`
1. **Tên class:** `TFMPageConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `type` (str) — loại; `useType` (boolean) — use loại; `offlineEnabled` (boolean) — offline trạng thái bật; `warnOnNavigationBackMessage` (str) — warn on navigation back message; `warnOnNavigationBackTitle` (str) — warn on navigation back tiêu đề; `warnOnNavigationBackWarningType` (TFMOverDeliveryValidation) — warn on navigation back warning loại; `warnOnNavigationBackNotifyBackendDocument` (str) — warn on navigation back notify backend document; `filterName` (str) — bộ lọc tên/định danh; `pageName` (str) — page tên/định danh
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmType` — khi cần đọc/ghi tham số; `parmWarnOnNavigationBackTitle` — khi cần đọc/ghi tham số; `parmWarnOnNavigationBackMessage` — khi cần đọc/ghi tham số; `parmWarnOnNavigationBackNotifyBackendDocument` — khi cần đọc/ghi tham số; `parmWarnOnNavigationBackWarningType` — khi cần đọc/ghi tham số; `isOfflineEnabled` — khi cần kiểm tra điều kiện; `initParmsMethodsWithAttributeDefaultValues` — khi cần khởi tạo/xây dựng; … còn 9 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMPageConfigurationAttributeAttribute`, `TFMFormLookupHelper`, `TFMPageOrderLinesConfiguration`, `TFMRegistrationCollector`, `TFMPage`, `TFMTranslationProvider`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua new, parmType, parmWarnOnNavigationBackTitle → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageConfigurationAttributeAttribute`
1. **Tên class:** `TFMPageConfigurationAttributeAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page configuration attribute attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `xPath` (str) — x path; `defaultValue` (anytype) — mặc định giá trị; `nodeName` (str) — node tên/định danh; `mandatory` (boolean) — mandatory; `editable` (boolean) — editable; `visibleWhenNoData` (boolean) — hiển thị when no dữ liệu; `excludeFromXmlOutput` (boolean) — exclude from XML output; `xmlOutputOnPage` (boolean) — XML output on page
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmXPath` — khi cần đọc/ghi tham số; `parmMandatory` — khi cần đọc/ghi tham số; `parmVisibleWhenNoData` — khi cần đọc/ghi tham số; `parmEditable` — khi cần đọc/ghi tham số; `parmExcludeFromXmlOutput` — khi cần đọc/ghi tham số; `parmXmlOutputOnPage` — khi cần đọc/ghi tham số; `parmnodeName` — khi cần đọc/ghi tham số; … còn 3 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`. Dependency trong source: `TFMPageAttributeAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua new, parmXPath, parmMandatory → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageConfigurationAttributeAttribute instance = new TFMPageConfigurationAttributeAttribute(<args>);` rồi `instance.parmXPath(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageConfigurationHeader`
1. **Tên class:** `TFMPageConfigurationHeader`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page configuration header); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `configurationKey` (str) — cấu hình key; `automaticAcceptOnOpen` (boolean) — automatic accept on open; `automaticAcceptAfterLastScan` (boolean) — automatic accept after last scan; `clearAfterPost` (boolean) — clear after post
4. **Method chính và khi nào dùng:** `parmconfigurationKey` — khi cần đọc/ghi tham số; `parmautomaticAcceptOnOpen` — khi cần đọc/ghi tham số; `parmautomaticAcceptAfterLastScan` — khi cần đọc/ghi tham số; `parmclearAfterPost` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPageConfigurationNode`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmconfigurationKey, parmautomaticAcceptOnOpen, parmautomaticAcceptAfterLastScan → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageConfigurationHeader instance = new TFMPageConfigurationHeader(<args>);` rồi `instance.parmconfigurationKey(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageConfigurationList`
1. **Tên class:** `TFMPageConfigurationList`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page configuration list); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPageConfigurationNode`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageConfigurationList instance = new TFMPageConfigurationList(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageConfigurationNode`
1. **Tên class:** `TFMPageConfigurationNode`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page configuration node); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageConfigurationOnSuccessfulPost`
1. **Tên class:** `TFMPageConfigurationOnSuccessfulPost`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page configuration on successful post); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPageConfigurationNode`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageConfigurationOnSuccessfulPost instance = new TFMPageConfigurationOnSuccessfulPost(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageConfiguratorFormClass`
1. **Tên class:** `TFMPageConfiguratorFormClass`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page configurator form class); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `currentPage` (TFMPage) — current page; `menuItemsFormDataSource` (FormDataSource) — menu các phần tử form dữ liệu source; `menuPageIdControl` (FormStringControl) — menu page mã định danh control; `pagesOnForm` (TFMPages) — pages on form; `lastSelectedMenuItemId` (str) — last selected menu mặt hàng mã định danh
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `currentPage` — khi cần xem method body để xác định hành vi; `parmLastSelectedMenuItemId` — khi cần đọc/ghi tham số; `control_lookup` — khi cần xem method body để xác định hành vi; `control_modified` — khi cần xem method body để xác định hành vi; `control_EnumModified` — khi cần xem method body để xác định hành vi; `pagesObjectsWasUpdated` — khi cần xem method body để xác định hành vi; `setTabPages` — khi cần ghi/cập nhật state; … còn 7 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `Object`. Composition/member fields: `TFMPage`, `TFMPages`. Dependency trong source: `TFMMenuItemsContainerInterface`, `TFMPagesProvider`, `TFMFormLookupHelper`, `TFMDocCustomFunctionFlow`, `TFMHelper`, `TFMDatasourceParametersEdit`, `TFMDocumentParametersEdit`, `TFMPageConfigurationAttributeAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua new, currentPage, parmLastSelectedMenuItemId → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageConfiguratorFormClass instance = new TFMPageConfiguratorFormClass(<args>);` rồi `instance.currentPage(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageHelper`
1. **Tên class:** `TFMPageHelper`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page helper); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getPagesFromClass` — khi cần lấy hoặc tra cứu; `findOrderlistRequestDocuments` — khi cần lấy hoặc tra cứu; `menuContainer2Classes` — khi cần xem method body để xác định hành vi; `getMethodsUsingSysAttribute` — khi cần lấy hoặc tra cứu; `constructUnplannedItemRegistrationPage` — khi cần khởi tạo/xây dựng; `addOrUpdateUnplannedItemRegistrationPage` — khi cần ghi/cập nhật state; `addOrUpdateLookupPage` — khi cần ghi/cập nhật state; `setToUnavailableForMenuPages` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMPages`, `TFMDocumentHandler`, `TFMDocumentTypeAttribute`, `TFMMenuAttribute`, `TFMPageLookup`, `TFMPageLookupConfiguration`, `TFMPageUnplannedItemRegistration`, `TFMPageUnplannedItemRegistrationConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua getPagesFromClass, findOrderlistRequestDocuments, menuContainer2Classes → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageHelper instance = new TFMPageHelper(<args>);` rồi `instance.getPagesFromClass(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageLineAdhocRequestAttribute`
1. **Tên class:** `TFMPageLineAdhocRequestAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (page line adhoc request attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `methodName` (MethodName) — method tên/định danh; `title` (Name) — tiêu đề; `icon` (ResourceName) — icon; `refreshOnSuccess` (boolean) — refresh on success
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmMethodName` — khi cần đọc/ghi tham số; `parmTitle` — khi cần đọc/ghi tham số; `parmIcon` — khi cần đọc/ghi tham số; `parmRefreshOnSuccess` — khi cần đọc/ghi tham số; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua new, parmMethodName, parmTitle → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageLineAdhocRequestAttribute instance = new TFMPageLineAdhocRequestAttribute(<args>);` rồi `instance.parmMethodName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageListDataBindingFormHelper`
1. **Tên class:** `TFMPageListDataBindingFormHelper`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page list data binding form helper); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `listGroup` (FormGroupControl) — danh sách group; `dataBindingGroup` (FormGroupControl) — dữ liệu binding group; `changeDesignMode` (boolean) — change design mode; `page` (TFMPage) — page; `dsDataSource` (FormDataSource) — ds dữ liệu source; `doDataSource` (FormDataSource) — do dữ liệu source; `qbr` (QueryBuildRange) — qbr; `dataHtmls` (Map) — dữ liệu htmls; `relationsHtmls` (Map) — relations htmls; `viewerControl` (FormGroupControl) — viewer control; `dsGrid` (FormGridControl) — ds grid
4. **Method chính và khi nào dùng:** `page` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `Construct` — khi cần khởi tạo/xây dựng; `fillListGroup` — khi cần xem method body để xác định hành vi; `showDesignOnAllDatasources` — khi cần xem method body để xác định hành vi; `pickDesigns` — khi cần xem method body để xác định hành vi; `setHtmlOnDesignsHtml` — khi cần ghi/cập nhật state; `listHtmlToDesigns` — khi cần xem method body để xác định hành vi; … còn 7 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `Object`. Composition/member fields: `TFMPage`. Dependency trong source: `TFMHtmlViewerCtrl`, `TFMPagesProvider`, `TFMList`, `TFMListsProvider`, `TFMListVisualization`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua page, new, Construct → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMPageListDataBindingFormHelper instance = TFMPageListDataBindingFormHelper::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageLookup`
1. **Tên class:** `TFMPageLookup`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page lookup); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `dataSources` (Set) — dữ liệu sources
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `addDataSource` — khi cần ghi/cập nhật state; `getDataSources` — khi cần lấy hoặc tra cứu; `addPageTiles` — khi cần ghi/cập nhật state; `initializeDataSources` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPage`. Dependency trong source: `TFMCollectorMapAttribute`, `TFMLookup`, `TFMDocumentTypeAttribute`, `TFMGetRegistrationConfiguration`, `TFMPageLookupConfiguration`, `TFMProcessProvider`, `TFMTableNameAttribute`, `TFMXMLFormatLookup`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua new, addDataSource, getDataSources → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageLookup instance = new TFMPageLookup(<args>);` rồi `instance.addDataSource(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageLookupConfiguration`
1. **Tên class:** `TFMPageLookupConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page lookup configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `useRegistrationCollector` (str) — use registration collector; `includeInputDataRowInSubmitRequest` (boolean) — include input dữ liệu row in submit request; `automaticAcceptAfterLastScan` (boolean) — automatic accept after last scan; `automaticAccept` (TFMAutomaticAccept) — automatic accept; `hideAfterAccept` (boolean) — hide after accept; `enabled` (boolean) — trạng thái bật; `navigateTo` (TFMPageID) — navigate to; `navigateToOnSuccess` (TFMPageID) — navigate to on success; `close` (boolean) — close; `refreshOnSuccess` (boolean) — refresh on success; `lookup` (str) — lookup; `submit` (str) — submit; … còn 1 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `parmType` — khi cần đọc/ghi tham số; `parmUseRegistrationCollector` — khi cần đọc/ghi tham số; `parmIncludeInputDataRowInSubmitRequest` — khi cần đọc/ghi tham số; `parmHideAfterAccept` — khi cần đọc/ghi tham số; `parmAutomaticAcceptAfterLastScan` — khi cần đọc/ghi tham số; `parmEnabled` — khi cần đọc/ghi tham số; `parmNavigateTo` — khi cần đọc/ghi tham số; `parmListId` — khi cần đọc/ghi tham số; … còn 6 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListPageConfiguration`. Dependency trong source: `TFMPageConfigurationAttributeAttribute`, `TFMListLookupWithRegistrations`, `TFMList`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmType, parmUseRegistrationCollector, parmIncludeInputDataRowInSubmitRequest → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageLookupConfiguration instance = new TFMPageLookupConfiguration(<args>);` rồi `instance.parmType(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageLookupContent`
1. **Tên class:** `TFMPageLookupContent`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page lookup content); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `mobTmpPages` (TFMPagesTmpLookup) — mob tmp pages; `gridControl` (FormGridControl) — grid control; `splitterControl` (FormGroupControl) — splitter control; `previewControl` (FormGroupControl) — preview control; `strControlPageID` (FormStringControl) — str control page mã định danh; `strControlPageType` (FormStringControl) — str control page loại; `formViewerControl` (TFMHtmlViewerCtrl) — form viewer control
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `setIcon` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMHtmlViewerCtrl`. Dependency trong source: `TFMGraphicsHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua new, setIcon → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageLookupContent instance = new TFMPageLookupContent(<args>);` rồi `instance.setIcon(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageMenuConfiguration`
1. **Tên class:** `TFMPageMenuConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page menu configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPageConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageMenuConfiguration instance = new TFMPageMenuConfiguration(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageMenuItemsAdditionalProperties`
1. **Tên class:** `TFMPageMenuItemsAdditionalProperties`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page menu items additional properties); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `parametersMap` (Map) — parameters map
4. **Method chính và khi nào dùng:** `getparameters` — khi cần lấy hoặc tra cứu; `addParameter` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua getparameters, addParameter → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageMenuItemsAdditionalProperties instance = new TFMPageMenuItemsAdditionalProperties(<args>);` rồi `instance.getparameters(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageMenuItemsFormHelper`
1. **Tên class:** `TFMPageMenuItemsFormHelper`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page menu items form helper); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `ds` (FormDataSource) — ds; `prevsender` (FormWindowControl) — prevsender; `qbr` (QueryBuildRange) — qbr
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `new` — khi cần khởi tạo/xây dựng; `latestID` — khi cần xem method body để xác định hành vi; `getPageMenuItemStateConfigurations` — khi cần lấy hoặc tra cứu; `getMenuItemTitleStr` — khi cần lấy hoặc tra cứu; `getMenuItemIconStr` — khi cần lấy hoặc tra cứu; `windowClickOverride` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMPages`, `TFMPage`, `TFMPagesProvider`, `TFMPageUnplannedItemRegistrationConfiguration`, `TFMDocGetMedia`, `TFMMenuItemStateConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua Construct, new, latestID → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMPageMenuItemsFormHelper instance = TFMPageMenuItemsFormHelper::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageMenuItemsHelper`
1. **Tên class:** `TFMPageMenuItemsHelper`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page menu items helper); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `addMenuItemsToXML` — khi cần ghi/cập nhật state; `addMenuStateToXml` — khi cần ghi/cập nhật state; `addActionToXml` — khi cần ghi/cập nhật state; `findElementForPageSpecificMenuItem` — khi cần lấy hoặc tra cứu; `replaceXmlForPageSpecificMenuItems` — khi cần parse/serialize XML; `setMenuItemsAttributesValues` — khi cần ghi/cập nhật state; `setTFMPageConfigParmsAsAttributeOnElement` — khi cần ghi/cập nhật state; `isMenuItemElement` — khi cần kiểm tra điều kiện; … còn 2 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMPage`, `TFMPages`, `TFMPageConfiguration`, `TFMConstants`, `TFMPageLookupConfiguration`, `TFMMenuItemStateConfiguration`, `TFMPageMenuItemsAdditionalProperties`, `TFMPageAdhocMenuItemsAdditionalProperties`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua addMenuItemsToXML, addMenuStateToXml, addActionToXml → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageMenuItemsHelper instance = new TFMPageMenuItemsHelper(<args>);` rồi `instance.addMenuItemsToXML(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageMenuPage`
1. **Tên class:** `TFMPageMenuPage`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page menu page); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `addPageTiles` — khi cần ghi/cập nhật state; `getXML` — khi cần lấy hoặc tra cứu; `referencedPages` — khi cần xem method body để xác định hành vi; `addMenuPageConfiguration` — khi cần ghi/cập nhật state; `isOneClickSetup` — khi cần kiểm tra điều kiện; `addMenuItems` — khi cần ghi/cập nhật state; `addPageToMenuItemsElement` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPage`. Dependency trong source: `TFMPages`, `TFMConstants`, `TFMTranslationProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua addPageTiles, getXML, referencedPages → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageMenuPage instance = new TFMPageMenuPage(<args>);` rồi `instance.addPageTiles(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageOfflineManagement`
1. **Tên class:** `TFMPageOfflineManagement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page offline management); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPage`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageOfflineManagement instance = new TFMPageOfflineManagement(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageOfflineManagementAdhocServiceConfiguration`
1. **Tên class:** `TFMPageOfflineManagementAdhocServiceConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page offline management adhoc service configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getConfigurationName` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPageOfflineManagementServiceConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua getConfigurationName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageOfflineManagementAdhocServiceConfiguration instance = new TFMPageOfflineManagementAdhocServiceConfiguration(<args>);` rồi `instance.getConfigurationName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageOfflineManagementConfiguration`
1. **Tên class:** `TFMPageOfflineManagementConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page offline management configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `navigateToButton` (TFMPageID) — navigate to button; `postAllEnabled` (boolean) — post all trạng thái bật; `postAllTitle` (TFMPageTitleString) — post all tiêu đề; `refreshEnabled` (boolean) — refresh trạng thái bật; `refreshTitle` (TFMPageTitleString) — refresh tiêu đề
4. **Method chính và khi nào dùng:** `parmUpdateMode` — khi cần đọc/ghi tham số; `parmNavigateToButton` — khi cần đọc/ghi tham số; `parmPostAllEnabled` — khi cần đọc/ghi tham số; `parmPostAllTitle` — khi cần đọc/ghi tham số; `parmRefreshTitle` — khi cần đọc/ghi tham số; `parmRefreshEnabled` — khi cần đọc/ghi tham số; `appendToXML` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPageConfiguration`. Dependency trong source: `TFMPageConfigurationAttributeAttribute`, `TFMPage`, `TFMPageOfflineManagementServiceConfiguration`, `TFMPageOfflineManagementOrderServiceConfiguration`, `TFMPageOfflineManagementAdhocServiceConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmUpdateMode, parmNavigateToButton, parmPostAllEnabled → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageOfflineManagementConfiguration instance = new TFMPageOfflineManagementConfiguration(<args>);` rồi `instance.parmUpdateMode(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageOfflineManagementOrderServiceConfiguration`
1. **Tên class:** `TFMPageOfflineManagementOrderServiceConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page offline management order service configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `serviceId` (TFMServiceId) — service mã định danh
4. **Method chính và khi nào dùng:** `parmServiceId` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPageOfflineManagementServiceConfiguration`. Dependency trong source: `TFMPageConfigurationAttributeAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmServiceId → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageOfflineManagementOrderServiceConfiguration instance = new TFMPageOfflineManagementOrderServiceConfiguration(<args>);` rồi `instance.parmServiceId(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageOfflineManagementServiceConfiguration`
1. **Tên class:** `TFMPageOfflineManagementServiceConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page offline management service configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `listId` (TFMListId) — danh sách mã định danh; `navigateTo` (TFMMenu) — navigate to
4. **Method chính và khi nào dùng:** `getConfigurationName` — khi cần lấy hoặc tra cứu; `parmListId` — khi cần đọc/ghi tham số; `parmOnItemSelectedNavigateTo` — khi cần đọc/ghi tham số; `appendToXML` — khi cần ghi/cập nhật state; `populateXML` — khi cần parse/serialize XML
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMPageConfigurationAttributeAttribute`, `TFMFormLookupHelper`, `TFMRegistrationCollector`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua getConfigurationName, parmListId, parmOnItemSelectedNavigateTo → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageOfflineManagementServiceConfiguration instance = new TFMPageOfflineManagementServiceConfiguration(<args>);` rồi `instance.getConfigurationName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageOrderLines`
1. **Tên class:** `TFMPageOrderLines`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page order lines); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `dataSources` (Set) — dữ liệu sources
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `addDataSource` — khi cần ghi/cập nhật state; `getDataSources` — khi cần lấy hoặc tra cứu; `pageSpecificListTags` — khi cần xem method body để xác định hành vi; `DefaultActions` — khi cần xem method body để xác định hành vi; `addPageTiles` — khi cần ghi/cập nhật state; `initializeDataSources` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPage`. Dependency trong source: `TFMMenuItemStateConfiguration`, `TFMConstants`, `TFMPageOrderLinesConfiguration`, `TFMService`, `TFMServiceProvider`, `TFMPageOverviewSubPageNavigator`, `TFMTableNameAttribute`, `TFMXMLFormatOrderLines`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua new, addDataSource, getDataSources → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageOrderLines instance = new TFMPageOrderLines(<args>);` rồi `instance.addDataSource(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageOrderLinesConfiguration`
1. **Tên class:** `TFMPageOrderLinesConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page order lines configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `suggestQuantity` (boolean) — suggest số lượng; `listId` (TFMListId) — danh sách mã định danh; `serviceId` (TFMServiceID) — service mã định danh; `clearOrderLevelRegistrations` (boolean) — clear đơn hàng level registrations; `viewRegistrationsEnabled` (boolean) — view registrations trạng thái bật; `viewRegistrationsNavigateTo` (TFMPageID) — view registrations navigate to; `viewRegistrationsTitle` (TFMPageTitleString) — view registrations tiêu đề; `actionOnEmptyList` (TFMActionOnEmptyList) — action on empty danh sách; `deleteOrderRegistrationsEnabled` (boolean) — delete đơn hàng registrations trạng thái bật; `deleteOrderRegistrationsTitle` (TFMPageTitleString) — delete đơn hàng registrations tiêu đề; `postOrderEnabled` (boolean) — post đơn hàng trạng thái bật; `postOrderNavigateTo` (TFMPageID) — post đơn hàng navigate to; … còn 13 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `parmSuggestQuantity` — khi cần đọc/ghi tham số; `parmActionOnEmptyList` — khi cần đọc/ghi tham số; `parmListId` — khi cần đọc/ghi tham số; `parmId` — khi cần đọc/ghi tham số; `parmClearOrderLevelRegistrations` — khi cần đọc/ghi tham số; `parmSearchEnabled` — khi cần đọc/ghi tham số; `parmSearchNavigateTo` — khi cần đọc/ghi tham số; `parmViewRegistrationsEnabled` — khi cần đọc/ghi tham số; … còn 17 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListPageConfiguration`. Dependency trong source: `TFMPageConfigurationAttributeAttribute`, `TFMListOrderLines`, `TFMList`, `TFMPage`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmSuggestQuantity, parmActionOnEmptyList, parmListId → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageOrderLinesConfiguration instance = new TFMPageOrderLinesConfiguration(<args>);` rồi `instance.parmSuggestQuantity(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageOrderList`
1. **Tên class:** `TFMPageOrderList`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page order list); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `dataSources` (Set) — dữ liệu sources
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `addDataSource` — khi cần ghi/cập nhật state; `pageSpecificListTags` — khi cần xem method body để xác định hành vi; `getDataSources` — khi cần lấy hoặc tra cứu; `initializeDataSources` — khi cần khởi tạo/xây dựng; `createLinesPage` — khi cần khởi tạo/xây dựng; `getServiceXML` — khi cần lấy hoặc tra cứu; `addLineSelectionElement` — khi cần ghi/cập nhật state; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPage`. Dependency trong source: `TFMXMLFormatOrders`, `TFMTableNameAttribute`, `TFMPageOrderLines`, `TFMPageOrderLinesConfiguration`, `TFMPageOrderListConfiguration`, `TFMListOrderLines`, `TFMHelper`, `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua new, addDataSource, pageSpecificListTags → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageOrderList instance = new TFMPageOrderList(<args>);` rồi `instance.addDataSource(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageOrderListConfiguration`
1. **Tên class:** `TFMPageOrderListConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page order list configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `automaticOrderSelectionAfterFilter` (boolean) — automatic đơn hàng selection after bộ lọc; `automaticAcceptAfterLastScan` (boolean) — automatic accept after last scan; `automaticAcceptOnOpen` (boolean) — automatic accept on open; `filterEnabled` (boolean) — bộ lọc trạng thái bật; `listId` (TFMListId) — danh sách mã định danh; `navigateTo` (TFMPageID) — navigate to; `serviceId` (TFMServiceID) — service mã định danh; `searchNavigateTo` (TFMPageID) — search navigate to; `operationMode` (TFMOfflineModeTypes) — operation mode; `lineCompletionDefinition` (TFMLineCompletedDefinitionTypes) — line completion definition; `lineSelectionDocument` (TFMDocumentTypeId) — line selection document; `cancelOrderEnabled` (boolean) — cancel đơn hàng trạng thái bật; … còn 8 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `parmUnlockOrderEnabled` — khi cần đọc/ghi tham số; `parmUnlockOrderTitle` — khi cần đọc/ghi tham số; `parmToggleShowPostedOrdersEnabled` — khi cần đọc/ghi tham số; `parmViewErrorMessageEnabled` — khi cần đọc/ghi tham số; `parmRegisterOrderEnabled` — khi cần đọc/ghi tham số; `parmPostAllOrdersEnabled` — khi cần đọc/ghi tham số; `parmClearCompletedOrdersEnabled` — khi cần đọc/ghi tham số; `parmCancelOrderEnabled` — khi cần đọc/ghi tham số; … còn 13 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListPageConfiguration`. Dependency trong source: `TFMPageConfigurationAttributeAttribute`, `TFMListOrdersWithImage`, `TFMList`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmUnlockOrderEnabled, parmUnlockOrderTitle, parmToggleShowPostedOrdersEnabled → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageOrderListConfiguration instance = new TFMPageOrderListConfiguration(<args>);` rồi `instance.parmUnlockOrderEnabled(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageOverviewFormClass`
1. **Tên class:** `TFMPageOverviewFormClass`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page overview form class); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `foundPages` (Map) — found pages; `fgc` (FormGroupControl) — fgc; `first` (boolean) — first; `imageLocations` (Map) — image locations; `pageEnum` (MapEnumerator) — page enum; `filterStr` (str) — bộ lọc str; `pageHtmls` (Map) — page htmls; `currentPage` (TFMPage) — current page; `fr` (Object) — fr; `HTML` (TFMHtmlViewerCtrl) — html; `loadingURL` (str) — loading url; `firstControlSelectedByFilter` (FormButtonControl) — first control selected by bộ lọc; … còn 2 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `cacheTimeStamp` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `currentPage` — khi cần xem method body để xác định hành vi; `filterText` — khi cần xem method body để xác định hành vi; `loadAllPages` — khi cần xem method body để xác định hành vi; `showPageFoundByFilter` — khi cần xem method body để xác định hành vi; `windowClickOverride` — khi cần xem method body để xác định hành vi; `setCurrentPage` — khi cần ghi/cập nhật state; … còn 6 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `Object`. Composition/member fields: `TFMPage`, `TFMHtmlViewerCtrl`, `TFMHtmlListCtrl`, `TFMPages`. Dependency trong source: `TFMPagesProvider`, `TFMDocGetMedia`, `TFMHelper`, `TFMFormHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua cacheTimeStamp, new, currentPage → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageOverviewFormClass instance = new TFMPageOverviewFormClass(<args>);` rồi `instance.cacheTimeStamp(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageOverviewSubPageNavigator`
1. **Tên class:** `TFMPageOverviewSubPageNavigator`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page overview sub page navigator); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `Main` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua Main → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageOverviewSubPageNavigator instance = new TFMPageOverviewSubPageNavigator(<args>);` rồi `instance.Main(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPagePendingRegistrations`
1. **Tên class:** `TFMPagePendingRegistrations`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page pending registrations); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPage`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua new → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPagePendingRegistrations instance = new TFMPagePendingRegistrations(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPagePendingRegistrationsConfiguration`
1. **Tên class:** `TFMPagePendingRegistrationsConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page pending registrations configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `allRegistrationTypes` (boolean) — all registration types; `deleteRegistrationEnabled` (boolean) — delete registration trạng thái bật; `postAllRegistrationsEnabled` (boolean) — post all registrations trạng thái bật; `deleteRegistrationTitle` (TFMPageTitleString) — delete registration tiêu đề; `postAllRegistrationsTitle` (TFMPageTitleString) — post all registrations tiêu đề; `resubmitRegistrationEnabled` (boolean) — resubmit registration trạng thái bật; `resubmitRegistrationTitle` (TFMPageTitleString) — resubmit registration tiêu đề; `viewErrorMessageEnabled` (boolean) — view error message trạng thái bật; `viewErrorMessageTitle` (TFMPageTitleString) — view error message tiêu đề; `listId` (TFMListId) — danh sách mã định danh
4. **Method chính và khi nào dùng:** `parmAllRegistrationTypes` — khi cần đọc/ghi tham số; `parmListId` — khi cần đọc/ghi tham số; `parmDeleteRegistrationTitle` — khi cần đọc/ghi tham số; `parmDeleteRegistrationEnabled` — khi cần đọc/ghi tham số; `parmPostAllRegistrationsTitle` — khi cần đọc/ghi tham số; `parmPostAllRegistrationsEnabled` — khi cần đọc/ghi tham số; `parmResubmitRegistrationTitle` — khi cần đọc/ghi tham số; `parmResubmitRegistrationEnabled` — khi cần đọc/ghi tham số; … còn 2 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListPageConfiguration`. Dependency trong source: `TFMPageConfigurationAttributeAttribute`, `TFMListPendingAdhocRegistrationsList`, `TFMList`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmAllRegistrationTypes, parmListId, parmDeleteRegistrationTitle → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPagePendingRegistrationsConfiguration instance = new TFMPagePendingRegistrationsConfiguration(<args>);` rồi `instance.parmAllRegistrationTypes(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageRegistrations`
1. **Tên class:** `TFMPageRegistrations`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page registrations); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPage`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageRegistrations instance = new TFMPageRegistrations(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageRegistrationsConfiguration`
1. **Tên class:** `TFMPageRegistrationsConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page registrations configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `deleteRegistrationEnabled` (boolean) — delete registration trạng thái bật; `deleteAllRegistrationsEnabled` (boolean) — delete all registrations trạng thái bật; `deleteRegistrationTitle` (TFMPageTitleString) — delete registration tiêu đề; `deleteAllRegistrationsTitle` (TFMPageTitleString) — delete all registrations tiêu đề; `listId` (TFMListId) — danh sách mã định danh; `openEnabled` (boolean) — open trạng thái bật; `refreshEnabled` (boolean) — refresh trạng thái bật
4. **Method chính và khi nào dùng:** `parmOpenEnabled` — khi cần đọc/ghi tham số; `parmRefreshEnabled` — khi cần đọc/ghi tham số; `parmListId` — khi cần đọc/ghi tham số; `parmDeleteRegistrationTitle` — khi cần đọc/ghi tham số; `parmDeleteRegistrationEnabled` — khi cần đọc/ghi tham số; `parmDeleteAllRegistrationsTitle` — khi cần đọc/ghi tham số; `parmDeleteAllRegistrationsEnabled` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPageConfiguration`. Dependency trong source: `TFMPageConfigurationAttributeAttribute`, `TFMListRegistrations`, `TFMList`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmOpenEnabled, parmRefreshEnabled, parmListId → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageRegistrationsConfiguration instance = new TFMPageRegistrationsConfiguration(<args>);` rồi `instance.parmOpenEnabled(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPages`
1. **Tên class:** `TFMPages`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (pages); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `pages` (Map) — pages
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `addPage` — khi cần ghi/cập nhật state; `getPages` — khi cần lấy hoặc tra cứu; `getPage` — khi cần lấy hoặc tra cứu; `getPagesUsingProcess` — khi cần lấy hoặc tra cứu; `removePage` — khi cần ghi/cập nhật state; `setDocumentHandler` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMPage`, `TFMPageUnplannedItemRegistration`, `TFMPageLookup`, `TFMDocumentHandler`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua new, addPage, getPages → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPages instance = new TFMPages(<args>);` rồi `instance.addPage(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageScanInfo`
1. **Tên class:** `TFMPageScanInfo`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page scan info); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getPageActions` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPage`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua getPageActions → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageScanInfo instance = new TFMPageScanInfo(<args>);` rồi `instance.getPageActions(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageScanInfoConfiguration`
1. **Tên class:** `TFMPageScanInfoConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page scan info configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `parmType` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPageConfiguration`. Dependency trong source: `TFMPageConfigurationAttributeAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmType → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageScanInfoConfiguration instance = new TFMPageScanInfoConfiguration(<args>);` rồi `instance.parmType(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageSearch`
1. **Tên class:** `TFMPageSearch`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (page search); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPage`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua new → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageSearch instance = new TFMPageSearch(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageSearchConfiguration`
1. **Tên class:** `TFMPageSearchConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page search configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `listId` (TFMListId) — danh sách mã định danh; `automaticAcceptOnOpen` (boolean) — automatic accept on open; `hideAfterAccept` (boolean) — hide after accept; `close` (boolean) — close; `enabled` (boolean) — trạng thái bật
4. **Method chính và khi nào dùng:** `parmListId` — khi cần đọc/ghi tham số; `parmAutomaticAcceptOnOpen` — khi cần đọc/ghi tham số; `parmHideAfterAccept` — khi cần đọc/ghi tham số; `parmEnabled` — khi cần đọc/ghi tham số; `parmClose` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPageConfiguration`. Dependency trong source: `TFMPageConfigurationAttributeAttribute`, `TFMListShortLookup`, `TFMList`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmListId, parmAutomaticAcceptOnOpen, parmHideAfterAccept → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageSearchConfiguration instance = new TFMPageSearchConfiguration(<args>);` rồi `instance.parmListId(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageSettings`
1. **Tên class:** `TFMPageSettings`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page settings); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `DefaultActions` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPage`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua DefaultActions → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageSettings instance = new TFMPageSettings(<args>);` rồi `instance.DefaultActions(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageSettingsConfiguration`
1. **Tên class:** `TFMPageSettingsConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page settings configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `parmType` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPageConfiguration`. Dependency trong source: `TFMPageConfigurationAttributeAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmType → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageSettingsConfiguration instance = new TFMPageSettingsConfiguration(<args>);` rồi `instance.parmType(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPagesExport`
1. **Tên class:** `TFMPagesExport`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (pages export); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `referencedFilters` (Set) — referenced filters
4. **Method chính và khi nào dùng:** `GetConfigurationXmlForPages` — khi cần lấy hoặc tra cứu; `getReferencedFilters` — khi cần lấy hoặc tra cứu; `Construct` — khi cần khởi tạo/xây dựng; `new` — khi cần khởi tạo/xây dựng; `addTFMPageXmlToPagesElement` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMPages`, `TFMPagesProvider`, `TFMPagesMapHelper`, `TFMPage`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua GetConfigurationXmlForPages, getReferencedFilters, Construct → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMPagesExport instance = TFMPagesExport::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPagesMapHelper`
1. **Tên class:** `TFMPagesMapHelper`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (pages map helper); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `pages` (TFMPages) — pages; `pageMap` (Map) — page map; `htmlGeneratedPages` (Set) — html generated pages; `imgUrls` (Map) — img urls
4. **Method chính và khi nào dùng:** `init` — khi cần khởi tạo/xây dựng; `drillDownHierarchy` — khi cần xem method body để xác định hành vi; `pagesReferenced` — khi cần xem method body để xác định hành vi; `generateHtml` — khi cần xem method body để xác định hành vi; `getImgURL` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMPages`. Dependency trong source: `TFMPagesProvider`, `TFMPage`, `TFMGraphicsHelper`, `TFMMenuConfigurator`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua init, drillDownHierarchy, pagesReferenced → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPagesMapHelper instance = new TFMPagesMapHelper(<args>);` rồi `instance.init(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPagesProvider`
1. **Tên class:** `TFMPagesProvider`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (pages provider); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `languagePagesMap` (Map) — language pages map; `versionUpdateCounter` (int) — phiên bản update counter; `devMode` (boolean) — dev mode
4. **Method chính và khi nào dùng:** `instance` — khi cần xem method body để xác định hành vi; `getEntity` — khi cần lấy hoặc tra cứu; `setEntity` — khi cần ghi/cập nhật state; `new` — khi cần khởi tạo/xây dựng; `getAllPages` — khi cần lấy hoặc tra cứu; `updateVersion` — khi cần ghi/cập nhật state; `updateVersionCounter` — khi cần ghi/cập nhật state; `constructEntityImpl` — khi cần khởi tạo/xây dựng; … còn 17 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMCachedProvider`. Dependency trong source: `TFMPages`, `TFMProcessCollection`, `TFMProcessProvider`, `TFMPage`, `TFMPageConfiguration`, `TFMPageUnplannedItemRegistration`, `TFMWorkflowProvider`, `TFMProcess`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua instance, getEntity, setEntity → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPagesProvider instance = new TFMPagesProvider(<args>);` rồi `instance.instance(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageTitle`
1. **Tên class:** `TFMPageTitle`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page title); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `defaultValue` (str) — mặc định giá trị
4. **Method chính và khi nào dùng:** `parmDefaultValue` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua parmDefaultValue → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageTitle instance = new TFMPageTitle(<args>);` rồi `instance.parmDefaultValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageTypeAttribute`
1. **Tên class:** `TFMPageTypeAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page type attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `pageType` (TFMPageType) — page loại; `label` (str) — nhãn
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmPageType` — khi cần đọc/ghi tham số; `parmLabel` — khi cần đọc/ghi tham số; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua new, parmPageType, parmLabel → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageTypeAttribute instance = new TFMPageTypeAttribute(<args>);` rồi `instance.parmPageType(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageUnplannedItemRegistration`
1. **Tên class:** `TFMPageUnplannedItemRegistration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page unplanned item registration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `addPageTiles` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPage`. Dependency trong source: `TFMCollectorMapAttribute`, `TFMGetRegistrationConfiguration`, `TFMDocumentTypeAttribute`, `TFMProcessProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua new, addPageTiles → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageUnplannedItemRegistration instance = new TFMPageUnplannedItemRegistration(<args>);` rồi `instance.addPageTiles(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageUnplannedItemRegistrationConfiguration`
1. **Tên class:** `TFMPageUnplannedItemRegistrationConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (page unplanned item registration configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `useRegistrationCollector` (str) — use registration collector; `includeInputDataRowInSubmitRequest` (boolean) — include input dữ liệu row in submit request; `automaticAcceptAfterLastScan` (boolean) — automatic accept after last scan; `automaticAcceptOnOpen` (boolean) — automatic accept on open; `enabled` (boolean) — trạng thái bật; `navigateTo` (TFMPageID) — navigate to; `navigateToOnSuccess` (TFMPageID) — navigate to on success; `close` (boolean) — close; `refreshOnSuccess` (boolean) — refresh on success; `clearAfterPost` (boolean) — clear after post; `postAllRegistrationsEnabled` (boolean) — post all registrations trạng thái bật; `getRegistrationConfiguration` (TFMDocumentTypeId) — get registration cấu hình; … còn 7 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `parmType` — khi cần đọc/ghi tham số; `hasOfflineOptions` — khi cần kiểm tra điều kiện; `parmUseRegistrationCollector` — khi cần đọc/ghi tham số; `parmIncludeInputDataRowInSubmitRequest` — khi cần đọc/ghi tham số; `parmAutomaticAcceptAfterLastScan` — khi cần đọc/ghi tham số; `parmAutomaticAcceptOnOpen` — khi cần đọc/ghi tham số; `parmClearAfterPost` — khi cần đọc/ghi tham số; `parmClose` — khi cần đọc/ghi tham số; … còn 11 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMPageConfiguration`. Dependency trong source: `TFMPageConfigurationAttributeAttribute`, `TFMListPendingAdhocRegistrationsList`, `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmType, hasOfflineOptions, parmUseRegistrationCollector → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageUnplannedItemRegistrationConfiguration instance = new TFMPageUnplannedItemRegistrationConfiguration(<args>);` rồi `instance.parmType(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageWizard`
1. **Tên class:** `TFMPageWizard`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page wizard); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `formname` — khi cần xem method body để xác định hành vi; `run` — khi cần thực thi xử lý; `setupNavigation` — khi cần ghi/cập nhật state; `validate` — khi cần kiểm tra điều kiện; `description` — khi cần xem method body để xác định hành vi; `main` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysWizard`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua formname, run, setupNavigation → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageWizard instance = new TFMPageWizard(<args>);` rồi `instance.formname(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageXSDParser`
1. **Tên class:** `TFMPageXSDParser`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page xsd parser); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `xsdDoc` (XmlDocument) — xsd doc
4. **Method chính và khi nào dùng:** `drillDownForAttributes` — khi cần xem method body để xác định hành vi; `drillDownForDocumentation` — khi cần xem method body để xác định hành vi; `drillDown` — khi cần xem method body để xác định hành vi; `getAttributes` — khi cần lấy hoặc tra cứu; `getEnumerationValues` — khi cần lấy hoặc tra cứu; `getPossibleChildren` — khi cần lấy hoặc tra cứu; `getNodes` — khi cần lấy hoặc tra cứu; `mergeMaps` — khi cần xem method body để xác định hành vi; … còn 4 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMConstants`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua drillDownForAttributes, drillDownForDocumentation, drillDown → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageXSDParser instance = new TFMPageXSDParser(<args>);` rồi `instance.drillDownForAttributes(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPageXsdParserProvider`
1. **Tên class:** `TFMPageXsdParserProvider`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Page/Navigation (page xsd parser provider); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `parser` (TFMPageXsdParser) — parser
4. **Method chính và khi nào dùng:** `instance` — khi cần xem method body để xác định hành vi; `getEntity` — khi cần lấy hoặc tra cứu; `setEntity` — khi cần ghi/cập nhật state; `constructEntityImpl` — khi cần khởi tạo/xây dựng; `invalidateProvider` — khi cần xem method body để xác định hành vi; `version` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMCachedProvider`. Composition/member fields: `TFMPageXsdParser`. Dependency trong source: `TFMListsCollection`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/configuration/action/data source (tham số của method public hoặc state của instance) → xử lý khởi tạo page runtime và serialize metadata qua instance, getEntity, setEntity → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPageXsdParserProvider instance = new TFMPageXsdParserProvider(<args>);` rồi `instance.instance(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: class/config/data source/handler phải tương thích; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMParameterAttribute`
1. **Tên class:** `TFMParameterAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (parameter attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `GroupString` (str) — group string; `LabelString` (LabelString) — nhãn string; `defaultValue` (anytype) — mặc định giá trị; `helpText` (HelpTxt) — help text
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmDefaultValue` — khi cần đọc/ghi tham số; `parmGroupString` — khi cần đọc/ghi tham số; `parmLabelString` — khi cần đọc/ghi tham số; `parmHelpText` — khi cần đọc/ghi tham số; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua new, parmDefaultValue, parmGroupString → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMParameterAttribute instance = new TFMParameterAttribute(<args>);` rồi `instance.parmDefaultValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPostAdhocRegistration`
1. **Tên class:** `TFMPostAdhocRegistration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (post adhoc registration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `registrationType` (Str) — registration loại; `docHandler` (TFMDocumentHandler) — doc handler
4. **Method chính và khi nào dùng:** `subHandler` — khi cần xem method body để xác định hành vi; `canBeEnqueued` — khi cần kiểm tra điều kiện; `getResult` — khi cần lấy hoặc tra cứu; `getResultStr` — khi cần lấy hoặc tra cứu; `getResultTable` — khi cần lấy hoặc tra cứu; `description` — khi cần xem method body để xác định hành vi; `getDocumentTypes` — khi cần lấy hoặc tra cứu; `getDocumentContentSubject` — khi cần lấy hoặc tra cứu; … còn 3 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentHandler`. Composition/member fields: `TFMDocumentHandler`. Dependency trong source: `TFMDocumentTypeAttribute`, `TFMGetRegistrationConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua subHandler, canBeEnqueued, getResult → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPostAdhocRegistration instance = new TFMPostAdhocRegistration(<args>);` rồi `instance.subHandler(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPostMethodAttribute`
1. **Tên class:** `TFMPostMethodAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (post method attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `tableName` (TableName) — table tên/định danh
4. **Method chính và khi nào dùng:** `name` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua name, new, parmCacheKey → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMPostMethodAttribute instance = new TFMPostMethodAttribute(<args>);` rồi `instance.name(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMPostResponseData`
1. **Tên class:** `TFMPostResponseData`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (post response data); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `printOutput` (Map) — print output; `regCols` (TFMRegistrationCollectors) — reg cols; `fields` (Map) — fields
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `new` — khi cần khởi tạo/xây dựng; `addMenuItemToCollectors` — khi cần ghi/cập nhật state; `addPrintOutput` — khi cần ghi/cập nhật state; `printOutputEnumerator` — khi cần xem method body để xác định hành vi; `mergePrintOutput` — khi cần xem method body để xác định hành vi; `addCollector` — khi cần ghi/cập nhật state; `getCollectors` — khi cần lấy hoặc tra cứu; … còn 5 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMResponseElement`. Composition/member fields: `TFMRegistrationCollectors`. Dependency trong source: `TFMMenuItemStateConfiguration`, `TFMRegistrationCollector`, `TFMConstants`, `TFMRegistrationConfigurationResponseElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua Construct, new, addMenuItemToCollectors → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMPostResponseData instance = TFMPostResponseData::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMProcess`
1. **Tên class:** `TFMProcess`.
2. **Mục đích/chức năng chính:** Điều phối process; chọn lấy bước, lấy configuration hoặc post.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `processName`, `deltaLevel`, `version`, `blockCollection`, `combinedFields`, `autoSave`, `cancelBehaviour`, `isInitialized`, `isLocked` — định danh/version, block graph và trạng thái.
4. **Method chính và khi nào dùng:** `Construct`, `runProcess`, `loadDeltaConditions`, `getPrePostRegistrationCollectors`, `getRegistrationConfigurationResponse` — tạo/chạy process và dựng response.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition với `TFMLogicBlockCollection`; phối hợp request/response, blocks và collectors.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Request → sửa qua block collection → document type chọn next-step/config/post → response; post gọi trong TTS.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `TFMProcess p = TFMProcess::Construct(processName); TFMResponseElement r = p.runProcess(request);` (sơ đồ; dùng process/request đã cấu hình).
8. **Lưu ý/rủi ro thường gặp:** Document type chọn nhánh; xác nhận process registration, validation và transaction trước khi chạy.

### `TFMProcessBlocksParametersEdit`
1. **Tên class:** `TFMProcessBlocksParametersEdit`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (process blocks parameters edit); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `process` (TFMProcess) — process; `classNameReplace` (ClassName) — class tên/định danh replace; `version` (Version) — phiên bản; `blockName` (Name) — block tên/định danh; `interactionClass` (TFMDrawFlowControlInteraction) — interaction class
4. **Method chính và khi nào dùng:** `parmProcess` — khi cần đọc/ghi tham số; `new` — khi cần khởi tạo/xây dựng; `parmCurrentBlockName` — khi cần đọc/ghi tham số; `setInteractionClass` — khi cần ghi/cập nhật state; `control_modified` — khi cần xem method body để xác định hành vi; `GetProcessContentForGenericParmsForBlocks` — khi cần lấy hoặc tra cứu; `GetProcessKeyForGenericParms` — khi cần lấy hoặc tra cứu; `control_EnumModified` — khi cần xem method body để xác định hành vi; … còn 7 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentParametersEdit`. Composition/member fields: `TFMProcess`, `TFMDrawFlowControlInteraction`. Dependency trong source: `TFMDocCustomFunctionFlow`, `TFMLookupMethodForEDTattribute`, `TFMAttributeHandler`, `TFMLogicBlockCollection`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmProcess, new, parmCurrentBlockName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMProcessBlocksParametersEdit instance = new TFMProcessBlocksParametersEdit(<args>);` rồi `instance.parmProcess(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMProcessCollection`
1. **Tên class:** `TFMProcessCollection`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (process collection); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `Construct` — khi cần khởi tạo/xây dựng; `getAllActiveHeaders` — khi cần lấy hoặc tra cứu; `addProcess` — khi cần ghi/cập nhật state; `processExists` — khi cần thực thi xử lý; `getProcessInfo` — khi cần lấy hoặc tra cứu; `getKeyVersionId` — khi cần lấy hoặc tra cứu; `getNewestLockedProcess` — khi cần lấy hoặc tra cứu; … còn 2 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMProcess`, `TFMReferenceDataConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua new, Construct, getAllActiveHeaders → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMProcessCollection instance = TFMProcessCollection::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMProcessCombineFields`
1. **Tên class:** `TFMProcessCombineFields`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (process combine fields); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `replacementCollector` (TFMRegistrationCollector) — replacement collector; `subCollectors` (Set) — sub collectors
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `add2AliasMap` — khi cần ghi/cập nhật state; `new` — khi cần khởi tạo/xây dựng; `parmReplacementCollector` — khi cần đọc/ghi tham số; `addSubCollector` — khi cần ghi/cập nhật state; `getSubCollectors` — khi cần lấy hoặc tra cứu; `combineCollectors` — khi cần xem method body để xác định hành vi; `combineCollectorsToOne` — khi cần xem method body để xác định hành vi; … còn 2 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMRegistrationCollector`. Dependency trong source: `TFMRegistrationCollectorText`, `TFMFormLookupHelper`, `TFMListValuesAndDataTable`, `TFMReferenceDataConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua Construct, add2AliasMap, new → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMProcessCombineFields instance = TFMProcessCombineFields::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMProcessEditHeadersFormClass`
1. **Tên class:** `TFMProcessEditHeadersFormClass`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (process edit headers form class); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `fr` (FormRun) — fr; `lb` (FormListBoxControl) — lb; `fgc` (FormGroupControl) — fgc; `collectors` (Map) — collectors; `fieldToCombineWith` (Name) — field/trường to combine with; `ignoreList` (Set) — ignore danh sách; `xmlViewer` (TFMHtmlViewerCtrl) — XML viewer; `process` (TFMProcess) — process
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `initForm` — khi cần khởi tạo/xây dựng; `selectionChange` — khi cần xem method body để xác định hành vi; `selectCollector` — khi cần xem method body để xác định hành vi; `showHeaderXML` — khi cần parse/serialize XML; `combineListBoxSelectionChange` — khi cần xem method body để xác định hành vi; `initCombineDialog` — khi cần khởi tạo/xây dựng; `OkToCombineClicked` — khi cần xem method body để xác định hành vi; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMHtmlViewerCtrl`, `TFMProcess`. Dependency trong source: `TFMReferenceDataConfiguration`, `TFMRegistrationCollector`, `TFMFormXMLFormatter`, `TFMFormLookupHelper`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua new, initForm, selectionChange → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMProcessEditHeadersFormClass instance = new TFMProcessEditHeadersFormClass(<args>);` rồi `instance.initForm(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMProcessHandler`
1. **Tên class:** `TFMProcessHandler`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (process handler); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `run` — khi cần thực thi xử lý; `getDocumentContentSubject` — khi cần lấy hoặc tra cứu; `getResultTable` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMInputHandler`. Dependency trong source: `TFMProcess`, `TFMProcessProvider`, `TFMPostResponseData`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua run, getDocumentContentSubject, getResultTable → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMProcessHandler instance = new TFMProcessHandler(<args>);` rồi `instance.run(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMProcessOverviewFormClass`
1. **Tên class:** `TFMProcessOverviewFormClass`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (process overview form class); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `currentProcess` (TFMProcess) — current process
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `currentProcess` — khi cần xem method body để xác định hành vi; `setCurrentProcess` — khi cần ghi/cập nhật state; `saveProcess` — khi cần xem method body để xác định hành vi; `saveProcessVersion` — khi cần xem method body để xác định hành vi; `deleteProcessAndVersions` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `Object`. Composition/member fields: `TFMProcess`. Dependency trong source: `TFMProcessProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua new, currentProcess, setCurrentProcess → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMProcessOverviewFormClass instance = new TFMProcessOverviewFormClass(<args>);` rồi `instance.currentProcess(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMProcessProvider`
1. **Tên class:** `TFMProcessProvider`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (process provider); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `processes` (TFMProcessCollection) — processes
4. **Method chính và khi nào dùng:** `instance` — khi cần xem method body để xác định hành vi; `constructEntityImpl` — khi cần khởi tạo/xây dựng; `getEntity` — khi cần lấy hoặc tra cứu; `setEntity` — khi cần ghi/cập nhật state; `GetAllProcessesImpl` — khi cần lấy hoặc tra cứu; `CreateProcessTemplates` — khi cần khởi tạo/xây dựng; `setDeltaLevelForCode` — khi cần ghi/cập nhật state; `version` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMCachedProvider`. Composition/member fields: `TFMProcessCollection`. Dependency trong source: `TFMProcess`, `TFMLogicBlock`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua instance, constructEntityImpl, getEntity → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMProcessProvider instance = new TFMProcessProvider(<args>);` rồi `instance.instance(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMProcessTakeImage`
1. **Tên class:** `TFMProcessTakeImage`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (process take image); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMProcess`. Dependency trong source: `TFMLogicBlockTakeImage`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua new → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMProcessTakeImage instance = new TFMProcessTakeImage(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMProvider`
1. **Tên class:** `TFMProvider`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Service/Provider (provider); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getCacheId` — khi cần lấy hoặc tra cứu; `invalidateProvider` — khi cần xem method body để xác định hành vi; `version` — khi cần xem method body để xác định hành vi; `getProviders` — khi cần lấy hoặc tra cứu; `invalidateProviders` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMVersionProvider`, `TFMDocApplicationConfiguration`, `TFMPagesProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/process/request context (tham số của method public hoặc state của instance) → xử lý chọn handler/service hoặc serialize output qua getCacheId, invalidateProvider, version → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: dùng đúng factory, cache và runtime context; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMReferenceData`
1. **Tên class:** `TFMReferenceData`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (reference data); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `key` (str) — key
4. **Method chính và khi nào dùng:** `parmKey` — khi cần đọc/ghi tham số; `appendToXML` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua parmKey, appendToXML → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMReferenceDataConfiguration`
1. **Tên class:** `TFMReferenceDataConfiguration`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (reference data configuration); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `collectors` (Map) — collectors; `id2Collector` (Map) — id2 collector; `mapSimpleValues` (Map) — map simple values; `mapCDataValues` (Map) — map c dữ liệu values; `useDynafilter` (boolean) — use dynafilter; `isHeader` (boolean) — is header; `alwaysIncludeInOutput` (boolean) — always include in output; `aliases` (Set) — aliases; `queryName` (QueryName) — query tên/định danh; `tableNames` (Map) — table names; `embeddedDataLists` (Map) — embedded dữ liệu lists; `inlinedHeaders` (Map) — inlined headers; … còn 4 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `parmQueryName` — khi cần đọc/ghi tham số; `dataOrigin` — khi cần xem method body để xác định hành vi; `findTableNamesFromCollectors` — khi cần lấy hoặc tra cứu; `makeFieldsFromQuery` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `setOriginBlockName` — khi cần ghi/cập nhật state; `setParentBlocks` — khi cần ghi/cập nhật state; `getOriginBlockName` — khi cần lấy hoặc tra cứu; … còn 29 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMReferenceData`. Dependency trong source: `TFMRegistrationCollector`, `TFMRegistrationCollectorText`, `TFMConstants`, `TFMLookupQueries`, `TFMReferenceDataFilterList`, `TFMProcessCombineFields`, `TFMGetReferenceData`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmQueryName, dataOrigin, findTableNamesFromCollectors → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMReferenceDataConfiguration instance = new TFMReferenceDataConfiguration(<args>);` rồi `instance.parmQueryName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMReferenceDataFilterList`
1. **Tên class:** `TFMReferenceDataFilterList`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (reference data filter list); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `filterIdName` (str) — bộ lọc mã định danh tên/định danh; `filterValueName` (str) — bộ lọc giá trị tên/định danh; `filterSlaveIdName` (str) — bộ lọc slave mã định danh tên/định danh; `values` (Map) — values; `primaryId` (str) — primary mã định danh
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmPrimaryId` — khi cần đọc/ghi tham số; `addValue` — khi cần ghi/cập nhật state; `parmFilterIdName` — khi cần đọc/ghi tham số; `parmFilterSlaveIdName` — khi cần đọc/ghi tham số; `parmFilterValueName` — khi cần đọc/ghi tham số; `getMap` — khi cần lấy hoặc tra cứu; `appendToXML` — khi cần ghi/cập nhật state; … còn 4 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMReferenceData`. Dependency trong source: `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua new, parmPrimaryId, addValue → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMReferenceDataFilterList instance = new TFMReferenceDataFilterList(<args>);` rồi `instance.parmPrimaryId(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMReferenceDataMethodAttribute`
1. **Tên class:** `TFMReferenceDataMethodAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (reference data method attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `pagesUsingThis` (str) — pages using this
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmPagesUsingThis` — khi cần đọc/ghi tham số; `pagesUsingFilter` — khi cần xem method body để xác định hành vi; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua new, parmPagesUsingThis, pagesUsingFilter → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMReferenceDataMethodAttribute instance = new TFMReferenceDataMethodAttribute(<args>);` rồi `instance.parmPagesUsingThis(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegexLookupHelper`
1. **Tên class:** `TFMRegexLookupHelper`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (regex lookup helper); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getAIRegexSuggestion` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMConstants`, `TFMAIResultContract`, `TFMAIResultChoicesContract`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua getAIRegexSuggestion → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegexLookupHelper instance = new TFMRegexLookupHelper(<args>);` rồi `instance.getAIRegexSuggestion(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegisterRealtimeQuantity`
1. **Tên class:** `TFMRegisterRealtimeQuantity`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (register realtime quantity); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `_DeviceID` (TFMDocumentDeviceId) — _device mã định danh; `_Type` (String20) — _type; `_OrderNumber` (Num) — _order number; `_clearOrderLines` (boolean) — _clear đơn hàng lines; `_LineNumber` (Num) — _line number; `_ItemNumber` (ItemId) — _item number
4. **Method chính và khi nào dùng:** `canBeEnqueued` — khi cần kiểm tra điều kiện; `clearOrderLines` — khi cần ghi/cập nhật state; `getReferenceDataMethods` — khi cần lấy hoặc tra cứu; `description` — khi cần xem method body để xác định hành vi; `getDocumentTypes` — khi cần lấy hoặc tra cứu; `getLine` — khi cần lấy hoặc tra cứu; `getOrder` — khi cần lấy hoặc tra cứu; `getRegistration` — khi cần lấy hoặc tra cứu; … còn 3 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentHandler`. Dependency trong source: `TFMConstants`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua canBeEnqueued, clearOrderLines, getReferenceDataMethods → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegisterRealtimeQuantity instance = new TFMRegisterRealtimeQuantity(<args>);` rồi `instance.canBeEnqueued(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollector`
1. **Tên class:** `TFMRegistrationCollector`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `id` (int) — mã định danh; `name` (str) — tên/định danh; `header` (str) — header; `label` (str) — nhãn; `help` (str) — help; `eanAI` (str) — ean ai; `defaultValue` (str) — mặc định giá trị; `locked` (boolean) — trạng thái khóa; `setEmpty` (boolean) — set empty; `optional` (boolean) — tùy chọn; `active` (boolean) — trạng thái hoạt động; `visible` (boolean) — hiển thị; … còn 22 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `ConstructFromXMLElement` — khi cần khởi tạo/xây dựng; `ConstructAttributeMap` — khi cần khởi tạo/xây dựng; `parmAcceptValuesFrom` — khi cần đọc/ghi tham số; `isAcceptingValuesFrom` — khi cần kiểm tra điều kiện; `parmDisableValueTransfer` — khi cần đọc/ghi tham số; `parmDisableMatchedSource` — khi cần đọc/ghi tham số; `parmLogicBlockConnected` — khi cần đọc/ghi tham số; `parmLogicBlockDataSource` — khi cần đọc/ghi tham số; … còn 75 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMConditions`, `TFMFieldOrigins`, `TFMDrawFlowControlInteraction`. Dependency trong source: `TFMConstants`, `TFMHelper`, `TFMRegistrationCollectorList`, `TFMReferenceDataFilterList`, `TFMFormLookupHelper`, `TFMCategoryAttribute`, `TFMIgnoreParmAttribute`, `TFMPagesProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua ConstructFromXMLElement, ConstructAttributeMap, parmAcceptValuesFrom → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectorDataTable`
1. **Tên class:** `TFMRegistrationCollectorDataTable`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector data table); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `dataTable` (str) — dữ liệu table; `dataKeyColumn` (str) — dữ liệu key column
4. **Method chính và khi nào dùng:** `parmDataTable` — khi cần đọc/ghi tham số; `parmDataKeyColumn` — khi cần đọc/ghi tham số; `getMap` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRegistrationCollector`. Dependency trong source: `TFMDataTableInterface`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua parmDataTable, parmDataKeyColumn, getMap → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegistrationCollectorDataTable instance = new TFMRegistrationCollectorDataTable(<args>);` rồi `instance.parmDataTable(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectorDate`
1. **Tên class:** `TFMRegistrationCollectorDate`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector date); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `minimumDate` (Date) — minimum ngày; `maximumDate` (Date) — maximum ngày; `defaultDate` (str) — mặc định ngày
4. **Method chính và khi nào dùng:** `parmMinDate` — khi cần đọc/ghi tham số; `parmMaxDate` — khi cần đọc/ghi tham số; `parmDefaultValue` — khi cần đọc/ghi tham số; `dataTypeIcon` — khi cần xem method body để xác định hành vi; `DateStep` — khi cần xem method body để xác định hành vi; `DateStepMap` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRegistrationCollector`. Dependency trong source: `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua parmMinDate, parmMaxDate, parmDefaultValue → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegistrationCollectorDate instance = new TFMRegistrationCollectorDate(<args>);` rồi `instance.parmMinDate(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectorDateTime`
1. **Tên class:** `TFMRegistrationCollectorDateTime`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector date time); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `minimumDate` (utcDateTime) — minimum ngày; `maximumDate` (utcDateTime) — maximum ngày; `defaultDate` (str) — mặc định ngày
4. **Method chính và khi nào dùng:** `parmMinDate` — khi cần đọc/ghi tham số; `parmMaxDate` — khi cần đọc/ghi tham số; `parmDefaultValue` — khi cần đọc/ghi tham số; `dataTypeIcon` — khi cần xem method body để xác định hành vi; `DateTimeStep` — khi cần xem method body để xác định hành vi; `DateTimeStepMap` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRegistrationCollector`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua parmMinDate, parmMaxDate, parmDefaultValue → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegistrationCollectorDateTime instance = new TFMRegistrationCollectorDateTime(<args>);` rồi `instance.parmMinDate(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectorDecimal`
1. **Tên class:** `TFMRegistrationCollectorDecimal`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector decimal); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `length` (int) — length; `performCalculation` (boolean) — perform calculation; `minimumValue` (real) — minimum giá trị; `maximumvalue` (real) — maximumvalue; `primaryInputMethod` (TFMPrimaryInputMethod) — primary input method
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmprimaryInputMethod` — khi cần đọc/ghi tham số; `parmLength` — khi cần đọc/ghi tham số; `parmPerformCalculation` — khi cần đọc/ghi tham số; `parmminValue` — khi cần đọc/ghi tham số; `parmmaxValue` — khi cần đọc/ghi tham số; `dataTypeIcon` — khi cần xem method body để xác định hành vi; `DecimalStep` — khi cần xem method body để xác định hành vi; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRegistrationCollector`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua new, parmprimaryInputMethod, parmLength → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegistrationCollectorDecimal instance = new TFMRegistrationCollectorDecimal(<args>);` rồi `instance.parmprimaryInputMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectorImage`
1. **Tên class:** `TFMRegistrationCollectorImage`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector image); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `ImageStepMap` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRegistrationCollector`. Dependency trong source: `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua ImageStepMap → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegistrationCollectorImage instance = new TFMRegistrationCollectorImage(<args>);` rồi `instance.ImageStepMap(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectorImageCapture`
1. **Tên class:** `TFMRegistrationCollectorImageCapture`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector image capture); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `ImageCaptureStepMap` — khi cần xem method body để xác định hành vi; `dataTypeIcon` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRegistrationCollector`. Dependency trong source: `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua ImageCaptureStepMap, dataTypeIcon → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegistrationCollectorImageCapture instance = new TFMRegistrationCollectorImageCapture(<args>);` rồi `instance.ImageCaptureStepMap(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectorInformation`
1. **Tên class:** `TFMRegistrationCollectorInformation`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector information); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `InformationStepMap` — khi cần xem method body để xác định hành vi; `dataTypeIcon` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRegistrationCollector`. Dependency trong source: `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua InformationStepMap, dataTypeIcon → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegistrationCollectorInformation instance = new TFMRegistrationCollectorInformation(<args>);` rồi `instance.InformationStepMap(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectorInteger`
1. **Tên class:** `TFMRegistrationCollectorInteger`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector integer); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `IntegerStep` — khi cần xem method body để xác định hành vi; `dataTypeIcon` — khi cần xem method body để xác định hành vi; `IntegerStepMap` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRegistrationCollectorDecimal`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua IntegerStep, dataTypeIcon, IntegerStepMap → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegistrationCollectorInteger instance = new TFMRegistrationCollectorInteger(<args>);` rồi `instance.IntegerStep(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectorList`
1. **Tên class:** `TFMRegistrationCollectorList`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector list); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `ListStep` — khi cần xem method body để xác định hành vi; `ListStepMap` — khi cần xem method body để xác định hành vi; `dataTypeIcon` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListValuesAndDataTable`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua ListStep, ListStepMap, dataTypeIcon → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegistrationCollectorList instance = new TFMRegistrationCollectorList(<args>);` rồi `instance.ListStep(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectorListValues`
1. **Tên class:** `TFMRegistrationCollectorListValues`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector list values); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `ListValues` (str) — danh sách values; `ListSeparator` (str) — danh sách separator
4. **Method chính và khi nào dùng:** `parmListSeparator` — khi cần đọc/ghi tham số; `parmListValues` — khi cần đọc/ghi tham số; `new` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRegistrationCollector`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua parmListSeparator, parmListValues, new → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectorMultiLine`
1. **Tên class:** `TFMRegistrationCollectorMultiLine`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector multi line); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `MultiLineStepMap` — khi cần xem method body để xác định hành vi; `dataTypeIcon` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRegistrationCollector`. Dependency trong source: `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua MultiLineStepMap, dataTypeIcon → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegistrationCollectorMultiLine instance = new TFMRegistrationCollectorMultiLine(<args>);` rồi `instance.MultiLineStepMap(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectorMultiScan`
1. **Tên class:** `TFMRegistrationCollectorMultiScan`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector multi scan); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `MultiScanStepMap` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRegistrationCollectorMultiLine`. Dependency trong source: `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua MultiScanStepMap → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegistrationCollectorMultiScan instance = new TFMRegistrationCollectorMultiScan(<args>);` rồi `instance.MultiScanStepMap(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectorQuantityByScan`
1. **Tên class:** `TFMRegistrationCollectorQuantityByScan`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector quantity by scan); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `minimumValue` (int) — minimum giá trị; `maximumValue` (int) — maximum giá trị; `editable` (boolean) — editable; `OverDeliveryValidation` (TFMOverDeliveryValidation) — over delivery validation
4. **Method chính và khi nào dùng:** `parmminValue` — khi cần đọc/ghi tham số; `parmmaxValue` — khi cần đọc/ghi tham số; `parmOverDeliveryValidation` — khi cần đọc/ghi tham số; `parmeditable` — khi cần đọc/ghi tham số; `dataTypeIcon` — khi cần xem method body để xác định hành vi; `QtyByScanStep` — khi cần xem method body để xác định hành vi; `QtyByScanStepMap` — khi cần xem method body để xác định hành vi; `getMap` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListValuesAndDataTable`. Dependency trong source: `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua parmminValue, parmmaxValue, parmOverDeliveryValidation → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegistrationCollectorQuantityByScan instance = new TFMRegistrationCollectorQuantityByScan(<args>);` rồi `instance.parmminValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectorRadioButton`
1. **Tên class:** `TFMRegistrationCollectorRadioButton`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector radio button); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `dataTypeIcon` — khi cần xem method body để xác định hành vi; `RadioButtonStep` — khi cần xem method body để xác định hành vi; `RadioButtonStepMap` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMListValuesAndDataTable`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua dataTypeIcon, RadioButtonStep, RadioButtonStepMap → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegistrationCollectorRadioButton instance = new TFMRegistrationCollectorRadioButton(<args>);` rồi `instance.dataTypeIcon(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectors`
1. **Tên class:** `TFMRegistrationCollectors`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collectors); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `collectors` (Map) — collectors; `collectorName2ID` (Map) — collector name2 mã định danh; `additionalValues` (Map) — additional values; `pagesToOpen` (Set) — pages to open; `log` (str) — log; `replaceCurrentSteps` (boolean) — replace current steps
4. **Method chính và khi nào dùng:** `parmReplaceCurrentSteps` — khi cần đọc/ghi tham số; `ConstructFromMap` — khi cần khởi tạo/xây dựng; `getPagesToOpen` — khi cần lấy hoặc tra cứu; `addOnlineStepValidationToLastStep` — khi cần ghi/cập nhật state; `addPageToOpen` — khi cần ghi/cập nhật state; `new` — khi cần khởi tạo/xây dựng; `addCollector` — khi cần ghi/cập nhật state; `addDependenciesToCollectors` — khi cần ghi/cập nhật state; … còn 12 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMRegistrationCollector`, `TFMMenuItemStateConfiguration`, `TFMRequestElement`, `TFMLogicContext`, `TFMProcess`, `TFMConstants`, `TFMConditions`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua parmReplaceCurrentSteps, ConstructFromMap, getPagesToOpen → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMRegistrationCollectors instance = TFMRegistrationCollectors::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectorSignature`
1. **Tên class:** `TFMRegistrationCollectorSignature`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector signature); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `SignatureStep` — khi cần xem method body để xác định hành vi; `SignatureStepMap` — khi cần xem method body để xác định hành vi; `dataTypeIcon` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRegistrationCollector`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua SignatureStep, SignatureStepMap, dataTypeIcon → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegistrationCollectorSignature instance = new TFMRegistrationCollectorSignature(<args>);` rồi `instance.SignatureStep(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectorSummary`
1. **Tên class:** `TFMRegistrationCollectorSummary`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector summary); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `SummaryStep` — khi cần xem method body để xác định hành vi; `SummaryStepMap` — khi cần xem method body để xác định hành vi; `dataTypeIcon` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRegistrationCollector`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua SummaryStep, SummaryStepMap, dataTypeIcon → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegistrationCollectorSummary instance = new TFMRegistrationCollectorSummary(<args>);` rồi `instance.SummaryStep(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectorText`
1. **Tên class:** `TFMRegistrationCollectorText`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector text); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `length` (int) — length; `primaryInputMethod` (TFMPrimaryInputMethod) — primary input method; `performCalculation` (boolean) — perform calculation; `searchType` (str) — search loại; `validationValues` (str) — validation values; `splitBarcodeBySeparator` (str) — split barcode by separator; `validationWarningType` (TFMOverDeliveryValidation) — validation warning loại
4. **Method chính và khi nào dùng:** `parmValidationWarningType` — khi cần đọc/ghi tham số; `parmValidationValues` — khi cần đọc/ghi tham số; `parmPerformCalculation` — khi cần đọc/ghi tham số; `parmSplitBarcodeBySeparator` — khi cần đọc/ghi tham số; `parmLength` — khi cần đọc/ghi tham số; `parmSearchType` — khi cần đọc/ghi tham số; `initFromDictType` — khi cần khởi tạo/xây dựng; `new` — khi cần khởi tạo/xây dựng; … còn 4 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRegistrationCollector`. Dependency trong source: `TFMReferenceDataConfiguration`, `TFMSearchEDTsToLookupTable`, `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua parmValidationWarningType, parmValidationValues, parmPerformCalculation → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegistrationCollectorText instance = new TFMRegistrationCollectorText(<args>);` rồi `instance.parmValidationWarningType(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationCollectorTypeAndQuantity`
1. **Tên class:** `TFMRegistrationCollectorTypeAndQuantity`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (registration collector type and quantity); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `scanBehavior` (TFMScanBehaviour) — scan behavior; `uniqueValues` (boolean) — unique values
4. **Method chính và khi nào dùng:** `parmScanBehavior` — khi cần đọc/ghi tham số; `parmUniqueValues` — khi cần đọc/ghi tham số; `TypeAndQuantity` — khi cần xem method body để xác định hành vi; `TypeAndQuantityMap` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRegistrationCollectorListValues`. Dependency trong source: `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua parmScanBehavior, parmUniqueValues, TypeAndQuantity → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegistrationCollectorTypeAndQuantity instance = new TFMRegistrationCollectorTypeAndQuantity(<args>);` rồi `instance.parmScanBehavior(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRegistrationConfigurationResponseElement`
1. **Tên class:** `TFMRegistrationConfigurationResponseElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (registration configuration response element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `collectors` (TFMRegistrationCollectors) — collectors; `cancelBehaviour` (TFMWorkflowCancelBehaviour) — cancel behaviour; `saveData` (NoYes) — save dữ liệu
4. **Method chính và khi nào dùng:** `setCollectors` — khi cần ghi/cập nhật state; `parmSaveData` — khi cần đọc/ghi tham số; `parmCancelBehaviour` — khi cần đọc/ghi tham số; `getCollectors` — khi cần lấy hoặc tra cứu; `getXML` — khi cần lấy hoặc tra cứu; `appendToXML` — khi cần ghi/cập nhật state; `appendRegistrationCollectorsToXML` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMResponseElement`. Composition/member fields: `TFMRegistrationCollectors`. Dependency trong source: `TFMConstants`, `TFMHelper`, `TFMRegistrationCollector`, `TFMMenuItemStateConfiguration`, `TFMPageMenuItemsHelper`, `TFMPagesProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua setCollectors, parmSaveData, parmCancelBehaviour → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRegistrationConfigurationResponseElement instance = new TFMRegistrationConfigurationResponseElement(<args>);` rồi `instance.setCollectors(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestAddLineElement`
1. **Tên class:** `TFMRequestAddLineElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request add line element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `parmJournalId` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestItemAndDimensionElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua parmJournalId → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestAddLineElement instance = new TFMRequestAddLineElement(<args>);` rồi `instance.parmJournalId(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestApplication`
1. **Tên class:** `TFMRequestApplication`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request application); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestApplication instance = new TFMRequestApplication(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestApplicationConfigurationElement`
1. **Tên class:** `TFMRequestApplicationConfigurationElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (request application configuration element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `configurations` (List) — configurations
4. **Method chính và khi nào dùng:** `parmConfiguration` — khi cần đọc/ghi tham số; `Configurations` — khi cần xem method body để xác định hành vi; `getHandledSubRequests` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`. Dependency trong source: `TFMRequestConfigurationElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmConfiguration, Configurations, getHandledSubRequests → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestApplicationConfigurationElement instance = new TFMRequestApplicationConfigurationElement(<args>);` rồi `instance.parmConfiguration(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestBasicElement`
1. **Tên class:** `TFMRequestBasicElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request basic element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `theOrder` (TFMRequestOrdersElement) — the đơn hàng
4. **Method chính và khi nào dùng:** `parmOrder` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`. Composition/member fields: `TFMRequestOrdersElement`. Dependency trong source: `TFMRequestLineElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua parmOrder → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestBasicElement instance = new TFMRequestBasicElement(<args>);` rồi `instance.parmOrder(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestCapabilities`
1. **Tên class:** `TFMRequestCapabilities`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request capabilities); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `installer` (str) — installer
4. **Method chính và khi nào dùng:** `parmInstaller` — khi cần đọc/ghi tham số; `checkLicenseMatchEnvironmentCombinationAllowed` — khi cần xem method body để xác định hành vi; `getHandledSubRequests` — khi cần lấy hoặc tra cứu; `updateDeviceCapabilities` — khi cần ghi/cập nhật state; `pushFieldsToDeviceCapabilities` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`. Dependency trong source: `TFMRequestApplication`, `TFMRequestDeviceElement`, `TFMRequestBasicElement`, `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua parmInstaller, checkLicenseMatchEnvironmentCombinationAllowed, getHandledSubRequests → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestCapabilities instance = new TFMRequestCapabilities(<args>);` rồi `instance.parmInstaller(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestConfigurationElement`
1. **Tên class:** `TFMRequestConfigurationElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (request configuration element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** Không có method source trực tiếp; có thể là marker/interface/empty class.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua  → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestConfigurationElement instance = new TFMRequestConfigurationElement(<args>);` rồi `instance.publicMethod(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestDeviceElement`
1. **Tên class:** `TFMRequestDeviceElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request device element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getHandledSubRequests` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`. Dependency trong source: `TFMRequestBasicElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua getHandledSubRequests → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestDeviceElement instance = new TFMRequestDeviceElement(<args>);` rồi `instance.getHandledSubRequests(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestElement`
1. **Tên class:** `TFMRequestElement`.
2. **Mục đích/chức năng chính:** Abstract DTO cho request Tasklet.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `documentType`, `contentType`, `fields`, `subNodes`, `deviceId`, `messageId`, `inventDim`, `itemId`, `logicContext`, `origXML` — payload/context/XML nguồn.
4. **Method chính và khi nào dùng:** `getSubRequest`, `getFieldValue`, `addField`, `convertToOtherRequestType`, `makeLogEntry` — đọc/chỉnh payload, đổi subtype, log.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Abstract; deserialization qua `TFMXMLDeserializer`; các request cụ thể kế thừa.
6. **Luồng sử dụng thực tế (input → xử lý → output):** XML → request subtype → dispatch theo document type → xử lý.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Dùng subtype đã đăng ký hoặc `convertToOtherRequestType(className)`.
8. **Lưu ý/rủi ro thường gặp:** Không khởi tạo base abstract; giữ đúng XML contract và document type.

### `TFMRequestExtraInfoElement`
1. **Tên class:** `TFMRequestExtraInfoElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request extra info element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `RMA_CauseId` (ReturnDispositionCodeId) — rma_cause mã định danh; `inventTransId` (InventTransId) — invent trans mã định danh
4. **Method chính và khi nào dùng:** `parmRMA_CauseId` — khi cần đọc/ghi tham số; `parmCauseId` — khi cần đọc/ghi tham số; `parmInventTransId` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`. Dependency trong source: `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua parmRMA_CauseId, parmCauseId, parmInventTransId → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestExtraInfoElement instance = new TFMRequestExtraInfoElement(<args>);` rồi `instance.parmRMA_CauseId(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestFiltersElement`
1. **Tên class:** `TFMRequestFiltersElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request filters element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `location` (InventLocationId) — location; `deliveryDate` (date) — delivery ngày; `scannedValue` (str) — scanned giá trị; `orderTypes` (TFMOrderTypes) — đơn hàng types; `initFromParmFilter` (boolean) — init from parm bộ lọc
4. **Method chính và khi nào dùng:** `parmTfmOrderTypes` — khi cần đọc/ghi tham số; `parmWarehouse` — khi cần đọc/ghi tham số; `parmDeliveryDate` — khi cần đọc/ghi tham số; `parmScannedValue` — khi cần đọc/ghi tham số; `new` — khi cần khởi tạo/xây dựng; `parmdeviceID` — khi cần đọc/ghi tham số; `parmInitFromParmFilter` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`. Dependency trong source: `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua parmTfmOrderTypes, parmWarehouse, parmDeliveryDate → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestFiltersElement instance = new TFMRequestFiltersElement(<args>);` rồi `instance.parmTfmOrderTypes(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestFinishTote`
1. **Tên class:** `TFMRequestFinishTote`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request finish tote); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `weight` (Weight) — weight; `packingBox` (WHSContainerTypeCode) — packing box; `toteId` (TFMToteId) — tote mã định danh
4. **Method chính và khi nào dùng:** `parmToteId` — khi cần đọc/ghi tham số; `parmWeight` — khi cần đọc/ghi tham số; `parmPackingBox` — khi cần đọc/ghi tham số; `parmFinishBox` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`. Dependency trong source: `TFMPostAdhocRegistration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua parmToteId, parmWeight, parmPackingBox → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestFinishTote instance = new TFMRequestFinishTote(<args>);` rồi `instance.parmToteId(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestGetOrderLinesElement`
1. **Tên class:** `TFMRequestGetOrderLinesElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request get order lines element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `BackendID` (TFMBackendId) — backend mã định danh
4. **Method chính và khi nào dùng:** `parmBackendID` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua parmBackendID → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestGetOrderLinesElement instance = new TFMRequestGetOrderLinesElement(<args>);` rồi `instance.parmBackendID(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestGetOrdersElement`
1. **Tên class:** `TFMRequestGetOrdersElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request get orders element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `filters` (TFMRequestFiltersElement) — filters
4. **Method chính và khi nào dùng:** `parmFilters` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`. Composition/member fields: `TFMRequestFiltersElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua parmFilters → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestGetOrdersElement instance = new TFMRequestGetOrdersElement(<args>);` rồi `instance.parmFilters(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestGetReferenceData`
1. **Tên class:** `TFMRequestGetReferenceData`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request get reference data); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `capabilities` (TFMRequestCapabilities) — capabilities
4. **Method chính và khi nào dùng:** `parmCapabilities` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`. Composition/member fields: `TFMRequestCapabilities`. Dependency trong source: `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua parmCapabilities → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestGetReferenceData instance = new TFMRequestGetReferenceData(<args>);` rồi `instance.parmCapabilities(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestInventDimElement`
1. **Tên class:** `TFMRequestInventDimElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request invent dim element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `fromWmsLocation` (WMSLocationId) — from wms location; `toWMSLocation` (WMSLocationId) — to wms location; `wmsLocation` (WMSLocationId) — wms location; `location` (InventLocationId) — location; `Fromlocation` (InventLocationId) — fromlocation; `Tolocation` (InventLocationId) — tolocation; `batchId` (InventBatchId) — batch mã định danh; `serialId` (InventSerialId) — serial mã định danh; `expirationDate` (TransDate) — expiration ngày; `conFigId` (EcoResItemConfigurationName) — con fig mã định danh; `color` (EcoResItemColorName) — color; `size` (EcoResItemSizeName) — size; … còn 3 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `createInventDim` — khi cần khởi tạo/xây dựng; `createFromInventDim` — khi cần khởi tạo/xây dựng; `createToInventDim` — khi cần khởi tạo/xây dựng; `parmFromWMSLocationId` — khi cần đọc/ghi tham số; `parmToWMSLocationId` — khi cần đọc/ghi tham số; `parmWMSLocationId` — khi cần đọc/ghi tham số; `parmInventLocationId` — khi cần đọc/ghi tham số; `parmFromInventLocationId` — khi cần đọc/ghi tham số; … còn 17 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`. Dependency trong source: `TFMInventDimHelper`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua createInventDim, createFromInventDim, createToInventDim → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestInventDimElement instance = new TFMRequestInventDimElement(<args>);` rồi `instance.createInventDim(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestItemAndDimensionElement`
1. **Tên class:** `TFMRequestItemAndDimensionElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request item and dimension element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `qty` (Qty) — qty; `barcodeSetupId` (BarcodeSetupId) — barcode setup mã định danh; `barcode` (BarCodeString) — barcode; `unit` (UnitOfMeasureSymbol) — unit; `lineNumber` (str) — line number; `journalId` (str) — journal mã định danh
4. **Method chính và khi nào dùng:** `parmQuantity` — khi cần đọc/ghi tham số; `parmQuantityRemaining` — khi cần đọc/ghi tham số; `parmUnitOfMeasure` — khi cần đọc/ghi tham số; `parmBarcodeSetupId` — khi cần đọc/ghi tham số; `parmBarcode` — khi cần đọc/ghi tham số; `parmLineNumber` — khi cần đọc/ghi tham số; `parmJournalId` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestInventDimElement`. Dependency trong source: `TFMPostAdhocRegistration`, `TFMConstants`, `TFMGetRegistrationConfiguration`, `TFMLookup`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua parmQuantity, parmQuantityRemaining, parmUnitOfMeasure → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestItemAndDimensionElement instance = new TFMRequestItemAndDimensionElement(<args>);` rồi `instance.parmQuantity(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestLineElement`
1. **Tên class:** `TFMRequestLineElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request line element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `lineNumber` (str) — line number; `registrations` (List) — registrations
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmLineNumber` — khi cần đọc/ghi tham số; `parmRegistration` — khi cần đọc/ghi tham số; `Registrations` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`. Dependency trong source: `TFMRequestRegistrationElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua new, parmLineNumber, parmRegistration → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestLineElement instance = new TFMRequestLineElement(<args>);` rồi `instance.parmLineNumber(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestOrdersElement`
1. **Tên class:** `TFMRequestOrdersElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request orders element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `lines` (List) — lines; `packingSlipId` (PackingSlipId) — packing slip mã định danh; `BackendID` (TFMBackendId) — backend mã định danh
4. **Method chính và khi nào dùng:** `parmLine` — khi cần đọc/ghi tham số; `new` — khi cần khởi tạo/xây dựng; `parmPackingSlip` — khi cần đọc/ghi tham số; `parmProductReceiptId` — khi cần đọc/ghi tham số; `parmBackendID` — khi cần đọc/ghi tham số; `Lines` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`. Dependency trong source: `TFMRequestLineElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua parmLine, new, parmPackingSlip → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestOrdersElement instance = new TFMRequestOrdersElement(<args>);` rồi `instance.parmLine(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestParametersElement`
1. **Tên class:** `TFMRequestParametersElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Cấu hình (request parameters element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `searchValue` (str) — search giá trị
4. **Method chính và khi nào dùng:** `parmSearchValue` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`. Dependency trong source: `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/metadata cấu hình (tham số của method public hoặc state của instance) → xử lý đọc defaults/parm, cập nhật hoặc serialize config qua parmSearchValue → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestParametersElement instance = new TFMRequestParametersElement(<args>);` rồi `instance.parmSearchValue(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp page/process/type và version XML; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestPostOrderElement`
1. **Tên class:** `TFMRequestPostOrderElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request post order element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `parseXML` — khi cần parse/serialize XML
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua parseXML → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestPostOrderElement instance = new TFMRequestPostOrderElement(<args>);` rồi `instance.parseXML(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestQuarantineElement`
1. **Tên class:** `TFMRequestQuarantineElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request quarantine element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `InventTransRefId` (InventTransRefId) — invent trans ref mã định danh; `inventQuarantineId` (InventQuarantineId) — invent quarantine mã định danh; `scrapQty` (Qty) — scrap qty
4. **Method chính và khi nào dùng:** `parmScrapQuantity` — khi cần đọc/ghi tham số; `parmInventTransRefId` — khi cần đọc/ghi tham số; `parmInventQuarantineId` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestItemAndDimensionElement`. Dependency trong source: `TFMPostAdhocRegistration`, `TFMConstants`, `TFMLookup`, `TFMGetRegistrationConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua parmScrapQuantity, parmInventTransRefId, parmInventQuarantineId → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestQuarantineElement instance = new TFMRequestQuarantineElement(<args>);` rồi `instance.parmScrapQuantity(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestRegistrationElement`
1. **Tên class:** `TFMRequestRegistrationElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request registration element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `actionType` (TFMActionTypes) — action loại; `toLocation` (str) — to location; `batchId` (InventBatchId) — batch mã định danh; `serialId` (InventSerialId) — serial mã định danh; `qty` (InventQty) — qty; `unit` (UnitOfMeasureSymbol) — unit; `expirationDate` (TransDate) — expiration ngày; `inventDimIssue` (InventDim) — invent dim issue; `inventDimReceipt` (InventDim) — invent dim receipt; `extraInfo` (TFMRequestExtraInfoElement) — extra info; `toteId` (TFMToteId) — tote mã định danh
4. **Method chính và khi nào dùng:** `parmExtraInfo` — khi cần đọc/ghi tham số; `ExtraInfo` — khi cần xem method body để xác định hành vi; `parmActionType` — khi cần đọc/ghi tham số; `parmFromBin` — khi cần đọc/ghi tham số; `parmFromLocation` — khi cần đọc/ghi tham số; `parmToBin` — khi cần đọc/ghi tham số; `parmLotNumber` — khi cần đọc/ghi tham số; `parmExpirationDate` — khi cần đọc/ghi tham số; … còn 7 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`. Composition/member fields: `TFMRequestExtraInfoElement`. Dependency trong source: `TFMInventDimSetup`, `TFMInventDimHelper`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua parmExtraInfo, ExtraInfo, parmActionType → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestRegistrationElement instance = new TFMRequestRegistrationElement(<args>);` rồi `instance.parmExtraInfo(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestSearchElement`
1. **Tên class:** `TFMRequestSearchElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request search element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `parms` (TFMRequestParametersElement) — parms; `type` (TFMOrderTypes) — loại
4. **Method chính và khi nào dùng:** `parmType` — khi cần đọc/ghi tham số; `parmParameters` — khi cần đọc/ghi tham số
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`. Composition/member fields: `TFMRequestParametersElement`. Dependency trong source: `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua parmType, parmParameters → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestSearchElement instance = new TFMRequestSearchElement(<args>);` rồi `instance.parmType(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMRequestWarehouseElement`
1. **Tên class:** `TFMRequestWarehouseElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (request warehouse element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `siteId` (InventSiteId) — site mã định danh; `locationId` (InventLocationId) — location mã định danh; `wmsLocationId` (WMSLocationId) — wms location mã định danh
4. **Method chính và khi nào dùng:** `parmLocation` — khi cần đọc/ghi tham số; `parmWmsLocationId` — khi cần đọc/ghi tham số; `parmWarehouse` — khi cần đọc/ghi tham số; `parmInventLocationId` — khi cần đọc/ghi tham số; `getSite` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMRequestElement`. Dependency trong source: `TFMLookup`, `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua parmLocation, parmWmsLocationId, parmWarehouse → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMRequestWarehouseElement instance = new TFMRequestWarehouseElement(<args>);` rồi `instance.parmLocation(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMResourceLookupFormClass`
1. **Tên class:** `TFMResourceLookupFormClass`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Form/UI (resource lookup form class); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `setupTempTable` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMDocGetMedia`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input Args, record và control state (tham số của method public hoặc state của instance) → xử lý form/helper xử lý UI hoặc cấu hình qua new, setupTempTable → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMResourceLookupFormClass instance = new TFMResourceLookupFormClass(<args>);` rồi `instance.setupTempTable(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: caller context, form lifecycle, permissions và null buffers; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMResponseElement`
1. **Tên class:** `TFMResponseElement`.
2. **Mục đích/chức năng chính:** DTO response và serializer cho thiết bị Tasklet.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `responseText`, `innerXML`, `originalRequest`, `deviceId`, `pageId`, `commands` — payload và context request/device/page.
4. **Method chính và khi nào dùng:** `getXML`, `appendToXML`, `addCommandResponse`, `parmInnerXML`, `parmOriginalRequest` — dựng và serialize response.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Giữ request gốc (`TFMRequestElement`); được process/search/handler trả về.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Kết quả xử lý → populate response/command → XML về thiết bị.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Serialize response cuối qua `getXML()` trong handler phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Giữ device/page/original-request context và tuân XML contract client.

### `TFMSearchCustomer`
1. **Tên class:** `TFMSearchCustomer`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (search customer); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `CustomerSearch` — khi cần xem method body để xác định hành vi; `performSearch` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMSearchHandler`. Dependency trong source: `TFMReferenceDataConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua CustomerSearch, performSearch → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMSearchCustomer instance = new TFMSearchCustomer(<args>);` rồi `instance.CustomerSearch(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMSearchEDTsToLookupTable`
1. **Tên class:** `TFMSearchEDTsToLookupTable`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (search ed ts to lookup table); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `EDTs2Tables` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua EDTs2Tables → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMSearchEDTsToLookupTable instance = new TFMSearchEDTsToLookupTable(<args>);` rồi `instance.EDTs2Tables(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMSearchGenericTable`
1. **Tên class:** `TFMSearchGenericTable`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (search generic table); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `performSearch` — khi cần thực thi xử lý; `makeQuery` — khi cần xem method body để xác định hành vi; `makeKeyFieldQuery` — khi cần xem method body để xác định hành vi; `getFieldsForQuery` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMSearchHandler`. Dependency trong source: `TFMConstants`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua performSearch, makeQuery, makeKeyFieldQuery → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMSearchGenericTable instance = new TFMSearchGenericTable(<args>);` rồi `instance.performSearch(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMSearchHandler`
1. **Tên class:** `TFMSearchHandler`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (search handler); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `idUsed` (Set) — mã định danh used; `request` (TFMRequestSearchElement) — request; `response` (TFMSearchResponseElement) — response
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `getResponse` — khi cần lấy hoặc tra cứu; `performSearch` — khi cần thực thi xử lý; `parmSearchRequest` — khi cần đọc/ghi tham số; `addDefaultSearchField` — khi cần ghi/cập nhật state; `getSearchHandlerFromType` — khi cần lấy hoặc tra cứu; `addResult` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMRequestSearchElement`, `TFMSearchResponseElement`. Dependency trong source: `TFMRegistrationCollectorText`, `TFMConstants`, `TFMSearchTypeAttribute`, `TFMSearchGenericTable`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua new, getResponse, performSearch → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMSearchItem`
1. **Tên class:** `TFMSearchItem`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (search item); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `ItemSearch` — khi cần xem method body để xác định hành vi; `performSearch` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMSearchHandler`. Dependency trong source: `TFMConstants`, `TFMReferenceDataConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua ItemSearch, performSearch → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMSearchItem instance = new TFMSearchItem(<args>);` rồi `instance.ItemSearch(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMSearchLicensePlate`
1. **Tên class:** `TFMSearchLicensePlate`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (search license plate); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `addResult` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMSearchGenericTable`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua addResult → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMSearchLicensePlate instance = new TFMSearchLicensePlate(<args>);` rồi `instance.addResult(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMSearchResponseElement`
1. **Tên class:** `TFMSearchResponseElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (search response element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `Ids` (Map) — ids; `request` (TFMRequestSearchElement) — request; `displayLines1` (Map) — display lines1; `displayLines2` (Map) — display lines2; `displayLines3` (Map) — display lines3; `imageIds` (Map) — image ids
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmSearchRequest` — khi cần đọc/ghi tham số; `addResponse` — khi cần ghi/cập nhật state; `appendToXML` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMResponseElement`. Composition/member fields: `TFMRequestSearchElement`. Dependency trong source: `TFMXMLFormatSearch`, `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua new, parmSearchRequest, addResponse → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMSearchResponseElement instance = new TFMSearchResponseElement(<args>);` rồi `instance.parmSearchRequest(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMSearchService`
1. **Tên class:** `TFMSearchService`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (search service); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `idUsed` (Set) — mã định danh used
4. **Method chính và khi nào dùng:** `process` — khi cần thực thi xử lý; `description` — khi cần xem method body để xác định hành vi; `LocalItemSearch` — khi cần xem method body để xác định hành vi; `getDocumentContentSubject` — khi cần lấy hoặc tra cứu; `doSearch` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentHandler`. Dependency trong source: `TFMConstants`, `TFMRequestSearchElement`, `TFMSearchHandler`, `TFMReferenceDataConfiguration`, `TFMRegistrationCollectorText`, `TFMRegistrationCollector`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua process, description, LocalItemSearch → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMSearchService instance = new TFMSearchService(<args>);` rồi `instance.process(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMSearchTypeAttribute`
1. **Tên class:** `TFMSearchTypeAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (search type attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `orderType` (TFMOrderTypes) — đơn hàng loại
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmCacheKey` — khi cần đọc/ghi tham số; `parmType` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua new, parmCacheKey, parmType → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMSearchTypeAttribute instance = new TFMSearchTypeAttribute(<args>);` rồi `instance.parmCacheKey(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMSearchVendor`
1. **Tên class:** `TFMSearchVendor`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (search vendor); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `VendorSearch` — khi cần xem method body để xác định hành vi; `performSearch` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMSearchHandler`. Dependency trong source: `TFMReferenceDataConfiguration`, `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua VendorSearch, performSearch → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMSearchVendor instance = new TFMSearchVendor(<args>);` rồi `instance.VendorSearch(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMService`
1. **Tên class:** `TFMService`.
2. **Mục đích/chức năng chính:** Adapter lấy XML và workflow từ page order list.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `orderlistPage` — page context.
4. **Method chính và khi nào dùng:** `Construct`, `getXML`, `getWorkflow` — tạo service, serialize page và lấy workflow.
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition với `TFMPage`; `getWorkflow` dùng `TFMPageOrderListConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Order-list page → service → XML/workflow.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** `TFMService s = TFMService::Construct(orderListPage); Xml xml = s.getXML();`.
8. **Lưu ý/rủi ro thường gặp:** Page phải tương thích với order-list configuration.

### `TFMServiceProvider`
1. **Tên class:** `TFMServiceProvider`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Service/Provider (service provider); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getServices` — khi cần lấy hoặc tra cứu; `getAllServicesXML` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMPages`, `TFMPagesProvider`, `TFMPage`, `TFMPageOrderList`, `TFMPageOrderListConfiguration`, `TFMService`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/process/request context (tham số của method public hoặc state của instance) → xử lý chọn handler/service hoặc serialize output qua getServices, getAllServicesXML → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMServiceProvider instance = new TFMServiceProvider(<args>);` rồi `instance.getServices(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: dùng đúng factory, cache và runtime context; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMShowDataResults`
1. **Tên class:** `TFMShowDataResults`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (show data results); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `dataResult` (Map) — dữ liệu result; `htmlViewer` (TFMHtmlViewerCtrl) — html viewer; `fieldsGroup` (FormTabPageControl) — fields group
4. **Method chính và khi nào dùng:** `ShowResults` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `selectionChanged` — khi cần xem method body để xác định hành vi; `showAllFields` — khi cần xem method body để xác định hành vi; `populateGroup` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMHtmlViewerCtrl`. Dependency trong source: `TFMFormXMLFormatter`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua ShowResults, new, selectionChanged → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMShowDataResults instance = new TFMShowDataResults(<args>);` rồi `instance.ShowResults(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMStepsSuccessionGraph`
1. **Tên class:** `TFMStepsSuccessionGraph`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (steps succession graph); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `workflowId` (TFMWorkflowName) — workflow mã định danh; `ancestors` (Map) — ancestors; `treeNodes` (Map) — tree nodes; `graph` (TFMGraphGeneric) — graph
4. **Method chính và khi nào dùng:** `buildTree` — khi cần khởi tạo/xây dựng; `init` — khi cần khởi tạo/xây dựng; `mouseClick` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `draw` — khi cần xem method body để xác định hành vi; `htmlViewer` — khi cần xem method body để xác định hành vi; `construct` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMGraphGeneric`. Dependency trong source: `TFMGraphTreeNodeWorkflow`, `TFMWorkflowBlock`, `TFMRegistrationCollector`, `TFMConstants`, `TFMHtmlViewerCtrl`, `TFMGraphWorkflow`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua buildTree, init, mouseClick → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMStepsSuccessionGraph instance = TFMStepsSuccessionGraph::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMSystemStartupEvent`
1. **Tên class:** `TFMSystemStartupEvent`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (system startup event); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `onSystemStartup` — khi cần xem method body để xác định hành vi; `onSessionStartup` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMVersionProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua onSystemStartup, onSessionStartup → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMSystemStartupEvent instance = new TFMSystemStartupEvent(<args>);` rồi `instance.onSystemStartup(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMTableNameAttribute`
1. **Tên class:** `TFMTableNameAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (table name attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `tableName` (TableName) — table tên/định danh; `orderType` (TFMOrderTypes) — đơn hàng loại
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmCacheKey` — khi cần đọc/ghi tham số; `parmTableName` — khi cần đọc/ghi tham số; `parmOrderType` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua new, parmCacheKey, parmTableName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMTableNameAttribute instance = new TFMTableNameAttribute(<args>);` rồi `instance.parmCacheKey(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMTableRelationCollection`
1. **Tên class:** `TFMTableRelationCollection`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (table relation collection); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `relations` (Map) — relations
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `addTableRelation` — khi cần ghi/cập nhật state; `ParseSuperCondensed` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMTableRelationHierarchyElement`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua new, addTableRelation, ParseSuperCondensed → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMTableRelationCollection instance = new TFMTableRelationCollection(<args>);` rồi `instance.addTableRelation(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMTableRelationHierarchyElement`
1. **Tên class:** `TFMTableRelationHierarchyElement`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (table relation hierarchy element); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `tableName` (TableName) — table tên/định danh; `tableField` (FieldName) — table field/trường; `nestedTable` (TFMTableRelationHierarchyElement) — nested table; `relationFieldName` (FieldName) — relation field/trường tên/định danh
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmTableName` — khi cần đọc/ghi tham số; `parmRelationFieldName` — khi cần đọc/ghi tham số; `addNestedTable` — khi cần ghi/cập nhật state; `endTable` — khi cần xem method body để xác định hành vi; `findValue` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMTableRelationHierarchyElement`. Dependency trong source: `TFMGenericDataHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua new, parmTableName, parmRelationFieldName → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMTableRelationHierarchyElement instance = new TFMTableRelationHierarchyElement(<args>);` rồi `instance.parmTableName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMTableRelationsProvider`
1. **Tên class:** `TFMTableRelationsProvider`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Service/Provider (table relations provider); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `collection` (TFMTableRelationCollection) — collection
4. **Method chính và khi nào dùng:** `instance` — khi cần xem method body để xác định hành vi; `getAllRelationsImpl` — khi cần lấy hoặc tra cứu; `InitTableRelationCollection` — khi cần khởi tạo/xây dựng; `invalidateProvider` — khi cần xem method body để xác định hành vi; `version` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMProvider`. Composition/member fields: `TFMTableRelationCollection`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/process/request context (tham số của method public hoặc state của instance) → xử lý chọn handler/service hoặc serialize output qua instance, getAllRelationsImpl, InitTableRelationCollection → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMTableRelationsProvider instance = new TFMTableRelationsProvider(<args>);` rồi `instance.instance(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: dùng đúng factory, cache và runtime context; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMTablesProvider`
1. **Tên class:** `TFMTablesProvider`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Service/Provider (tables provider); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `tablesAllowed` (Map) — tables allowed
4. **Method chính và khi nào dùng:** `instance` — khi cần xem method body để xác định hành vi; `new` — khi cần khởi tạo/xây dựng; `isTableAllowed` — khi cần kiểm tra điều kiện
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/process/request context (tham số của method public hoặc state của instance) → xử lý chọn handler/service hoặc serialize output qua instance, new, isTableAllowed → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMTablesProvider instance = new TFMTablesProvider(<args>);` rồi `instance.instance(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: dùng đúng factory, cache và runtime context; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMTestCollectorsInitialization`
1. **Tên class:** `TFMTestCollectorsInitialization`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Collector nhập liệu (test collectors initialization); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `testCollectorInitialization` — khi cần xem method body để xác định hành vi; `copyCollector` — khi cần xem method body để xác định hành vi; `copyCollectors` — khi cần xem method body để xác định hành vi; `setup` — khi cần ghi/cập nhật state; `tearDown` — khi cần xem method body để xác định hành vi; `setupTestCase` — khi cần ghi/cập nhật state; `teardownTestCase` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysTestCase`. Dependency trong source: `TFMLogicComponentDimensions`, `TFMRegistrationCollectors`, `TFMRegistrationCollector`, `TFMFormLookupHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input EDT/DictField/XML và thuộc tính field (tham số của method public hoặc state của instance) → xử lý tạo collector/step, áp dụng validation rồi nhận giá trị qua testCollectorInitialization, copyCollector, copyCollectors → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMTestCollectorsInitialization instance = new TFMTestCollectorsInitialization(<args>);` rồi `instance.testCollectorInitialization(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: khớp subtype, required/optional, barcode, dimension và validation; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMTestEndpoint`
1. **Tên class:** `TFMTestEndpoint`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (test endpoint); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `main` — khi cần xem method body để xác định hành vi; `importFromText` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMDocumentConnector`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua main, importFromText → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMTestEndpoint instance = new TFMTestEndpoint(<args>);` rồi `instance.main(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMTranslationDeclarantInterface`
1. **Tên class:** `TFMTranslationDeclarantInterface`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Metadata/Extension (translation declarant interface); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `addTranslations` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input class/method/table metadata (tham số của method public hoặc state của instance) → xử lý attribute/reflection/provider đăng ký hoặc tra cứu implementation qua addTranslations → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: tên type/attribute và visibility là runtime contract; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMTranslationLookupCreationProcessBatch`
1. **Tên class:** `TFMTranslationLookupCreationProcessBatch`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (translation lookup creation process batch); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `dlgLabelFiles` (DialogField) — dlg nhãn files; `dlgLabelValue` (str) — dlg nhãn giá trị
4. **Method chính và khi nào dùng:** `dialog` — khi cần xem method body để xác định hành vi; `getFromDialog` — khi cần lấy hoặc tra cứu; `pack` — khi cần xem method body để xác định hành vi; `unpack` — khi cần xem method body để xác định hành vi; `run` — khi cần thực thi xử lý; `showQueryValues` — khi cần xem method body để xác định hành vi; `construct` — khi cần khởi tạo/xây dựng; `description` — khi cần xem method body để xác định hành vi; … còn 3 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `RunBaseBatch`. Dependency trong source: `TFMFormLookupHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua dialog, getFromDialog, pack → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMTranslationLookupCreationProcessBatch instance = TFMTranslationLookupCreationProcessBatch::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMTranslationProvider`
1. **Tên class:** `TFMTranslationProvider`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Service/Provider (translation provider); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `idToTFDeviceLabelID` (Map) — mã định danh to tf thiết bị nhãn mã định danh
4. **Method chính và khi nào dùng:** `instance` — khi cần xem method body để xác định hành vi; `resetProvider` — khi cần xem method body để xác định hành vi; `getEntity` — khi cần lấy hoặc tra cứu; `setEntity` — khi cần ghi/cập nhật state; `constructEntityImpl` — khi cần khởi tạo/xây dựng; `version` — khi cần xem method body để xác định hành vi; `getTranslation` — khi cần lấy hoặc tra cứu; `translateStrings` — khi cần xem method body để xác định hành vi; … còn 10 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMCachedProvider`. Dependency trong source: `TFMPagesProvider`, `TFMDocLocalization`, `TFMTranslationDeclarantInterface`, `TFMHelper`, `TFMConstants`, `TFMAIResultContract`, `TFMAIResultChoicesContract`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/process/request context (tham số của method public hoặc state của instance) → xử lý chọn handler/service hoặc serialize output qua instance, resetProvider, getEntity → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMTranslationProvider instance = new TFMTranslationProvider(<args>);` rồi `instance.instance(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: dùng đúng factory, cache và runtime context; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMUnlockOrder`
1. **Tên class:** `TFMUnlockOrder`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Warehouse/Business (unlock order); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `type` (TFMOrderTypes) — loại; `backendId` (Str) — backend mã định danh; `backendNum` (Num) — backend num; `backendType` (Str) — backend loại
4. **Method chính và khi nào dùng:** `description` — khi cần xem method body để xác định hành vi; `getDocumentContentSubject` — khi cần lấy hoặc tra cứu; `process` — khi cần thực thi xử lý
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMDocumentHandler`. Dependency trong source: `TFMConstants`, `TFMBackendIDInstance`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input request cùng order/warehouse/inventory context (tham số của method public hoặc state của instance) → xử lý tra cứu/validate/thực hiện nghiệp vụ rồi response/state qua description, getDocumentContentSubject, process → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMUnlockOrder instance = new TFMUnlockOrder(<args>);` rồi `instance.description(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: company, warehouse, inventDim, quantity, reservation và transaction; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMValidationDocumentTypeAttribute`
1. **Tên class:** `TFMValidationDocumentTypeAttribute`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (validation document type attribute); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `methodName` (MethodName) — method tên/định danh; `docId` (TFMDocumentTypeId) — doc mã định danh
4. **Method chính và khi nào dùng:** `new` — khi cần khởi tạo/xây dựng; `parmMethodName` — khi cần đọc/ghi tham số; `parmDocumentType` — khi cần đọc/ghi tham số; `parmCacheKey` — khi cần đọc/ghi tham số; `useSingleton` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `SysAttribute`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua new, parmMethodName, parmDocumentType → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMValidationDocumentTypeAttribute instance = new TFMValidationDocumentTypeAttribute(<args>);` rồi `instance.parmMethodName(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMVersion`
1. **Tên class:** `TFMVersion`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Khác/Utility (version); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `versionStr` (str) — phiên bản str; `Publisher` (str) — publisher; `versionName` (str) — phiên bản tên/định danh
4. **Method chính và khi nào dùng:** `Construct` — khi cần khởi tạo/xây dựng; `new` — khi cần khởi tạo/xây dựng; `modelForClass` — khi cần xem method body để xác định hành vi; `populateGroupWithExtensions` — khi cần xem method body để xác định hành vi; `extensionModels` — khi cần xem method body để xác định hành vi; `getModelVersion` — khi cần lấy hoặc tra cứu; `getVersionName` — khi cần lấy hoặc tra cứu; `getModelPublisher` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMDocumentHandler`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input tham số theo signature public (tham số của method public hoặc state của instance) → xử lý thực thi helper hoặc method của class qua Construct, new, modelForClass → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ theo factory: `TFMVersion instance = TFMVersion::Construct(<args>);` rồi gọi method phù hợp; thay `<args>` theo signature thật.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: mục đích suy luận; xem method body trước khi tích hợp; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMVersionProvider`
1. **Tên class:** `TFMVersionProvider`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Service/Provider (version provider); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getCurrentVersion` — khi cần lấy hoặc tra cứu; `getBaseVersionID` — khi cần lấy hoặc tra cứu; `reset` — khi cần xem method body để xác định hành vi; `resetBaseVersion` — khi cần xem method body để xác định hành vi; `getBaseVersionStrKey` — khi cần lấy hoặc tra cứu; `getBaseVersionValue` — khi cần lấy hoặc tra cứu; `getProviderVersions` — khi cần lấy hoặc tra cứu
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `xApplication`. Dependency trong source: `TFMDocLocalization`, `TFMProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input page/process/request context (tham số của method public hoặc state của instance) → xử lý chọn handler/service hoặc serialize output qua getCurrentVersion, getBaseVersionID, reset → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMVersionProvider instance = new TFMVersionProvider(<args>);` rồi `instance.getCurrentVersion(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: dùng đúng factory, cache và runtime context; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMWorkflowBlock`
1. **Tên class:** `TFMWorkflowBlock`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (workflow block); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `steps` — khi cần xem method body để xác định hành vi; `AdditionalValues` — khi cần ghi/cập nhật state; `dynamicSteps` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua steps, AdditionalValues, dynamicSteps → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMWorkflowBlock instance = new TFMWorkflowBlock(<args>);` rồi `instance.steps(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMWorkflowBlockDimensions`
1. **Tên class:** `TFMWorkflowBlockDimensions`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (workflow block dimensions); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `steps` — khi cần xem method body để xác định hành vi; `AdditionalValues` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMWorkflowBlock`. Dependency trong source: `TFMRegistrationCollectorText`, `TFMConstants`, `TFMRegistrationCollectorDate`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua steps, AdditionalValues → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMWorkflowBlockDimensions instance = new TFMWorkflowBlockDimensions(<args>);` rồi `instance.steps(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMWorkflowBlockProductDimensions`
1. **Tên class:** `TFMWorkflowBlockProductDimensions`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (workflow block product dimensions); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `dynamicSteps` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMWorkflowBlock`. Dependency trong source: `TFMHelper`, `TFMInventDimSetup`, `TFMRegistrationCollectorList`, `TFMInventDimHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua dynamicSteps → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMWorkflowBlockProductDimensions instance = new TFMWorkflowBlockProductDimensions(<args>);` rồi `instance.dynamicSteps(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMWorkflowBlockQuantity`
1. **Tên class:** `TFMWorkflowBlockQuantity`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (workflow block quantity); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `steps` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMWorkflowBlock`. Dependency trong source: `TFMRegistrationCollectorDecimal`, `TFMConstants`, `TFMRegistrationCollectorQuantityByScan`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua steps → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMWorkflowBlockQuantity instance = new TFMWorkflowBlockQuantity(<args>);` rồi `instance.steps(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMWorkflowBlockVendorBatch`
1. **Tên class:** `TFMWorkflowBlockVendorBatch`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (workflow block vendor batch); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `dynamicSteps` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMWorkflowBlock`. Dependency trong source: `TFMInventDimSetup`, `TFMRegistrationCollectorList`, `TFMRegistrationCollectorDate`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua dynamicSteps → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMWorkflowBlockVendorBatch instance = new TFMWorkflowBlockVendorBatch(<args>);` rồi `instance.dynamicSteps(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMWorkflowDefinition`
1. **Tên class:** `TFMWorkflowDefinition`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (workflow definition); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `makeEntry` — khi cần xem method body để xác định hành vi; `makeWorkflow` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua makeEntry, makeWorkflow → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMWorkflowDefinitionStandard`
1. **Tên class:** `TFMWorkflowDefinitionStandard`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (workflow definition standard); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `makeWorkflow` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMWorkflowDefinition`. Dependency trong source: `TFMConstants`, `TFMWorkflowBlockDimensions`, `TFMWorkflowBlockQuantity`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua makeWorkflow → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMWorkflowDefinitionStandard instance = new TFMWorkflowDefinitionStandard(<args>);` rồi `instance.makeWorkflow(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMWorkflowProvider`
1. **Tên class:** `TFMWorkflowProvider`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (workflow provider); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `invalidateProvider` — khi cần xem method body để xác định hành vi; `loadDefaultWorkflows` — khi cần xem method body để xác định hành vi; `getAllWorkflowsXML` — khi cần lấy hoặc tra cứu; `version` — khi cần xem method body để xác định hành vi; `formatDateForVersion` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua invalidateProvider, loadDefaultWorkflows, getAllWorkflowsXML → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMWorkflowProvider instance = new TFMWorkflowProvider(<args>);` rồi `instance.invalidateProvider(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMWorkflowValidation`
1. **Tên class:** `TFMWorkflowValidation`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (workflow validation); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `validationType` — khi cần xem method body để xác định hành vi; `label` — khi cần xem method body để xác định hành vi; `isValidationLevelAllowed` — khi cần kiểm tra điều kiện; `isValidateEmptyValueAllowed` — khi cần kiểm tra điều kiện; `FindValidationClass` — khi cần lấy hoặc tra cứu; `allowValidationLevel` — khi cần xem method body để xác định hành vi; `allowValidateEmptyValue` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Không thấy quan hệ class nội bộ qua base/member/reference trong source đã quét.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua validationType, label, isValidationLevelAllowed → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Không khởi tạo abstract/interface trực tiếp; dùng implementation/provider cụ thể rồi gọi method public phù hợp.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMWorkflowValidationBatchNumber`
1. **Tên class:** `TFMWorkflowValidationBatchNumber`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (workflow validation batch number); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `validationType` — khi cần xem method body để xác định hành vi; `label` — khi cần xem method body để xác định hành vi; `isValidationLevelAllowed` — khi cần kiểm tra điều kiện
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMWorkflowValidation`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua validationType, label, isValidationLevelAllowed → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMWorkflowValidationBatchNumber instance = new TFMWorkflowValidationBatchNumber(<args>);` rồi `instance.validationType(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMWorkflowValidationFromLocation`
1. **Tên class:** `TFMWorkflowValidationFromLocation`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (workflow validation from location); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `validationType` — khi cần xem method body để xác định hành vi; `label` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMWorkflowValidation`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua validationType, label → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMWorkflowValidationFromLocation instance = new TFMWorkflowValidationFromLocation(<args>);` rồi `instance.validationType(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMWorkflowValidationQuantity`
1. **Tên class:** `TFMWorkflowValidationQuantity`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (workflow validation quantity); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `validationType` — khi cần xem method body để xác định hành vi; `label` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMWorkflowValidation`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua validationType, label → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMWorkflowValidationQuantity instance = new TFMWorkflowValidationQuantity(<args>);` rồi `instance.validationType(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMWorkflowValidationSerialNumber`
1. **Tên class:** `TFMWorkflowValidationSerialNumber`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (workflow validation serial number); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `validationType` — khi cần xem method body để xác định hành vi; `label` — khi cần xem method body để xác định hành vi; `isValidationLevelAllowed` — khi cần kiểm tra điều kiện; `isValidateEmptyValueAllowed` — khi cần kiểm tra điều kiện
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMWorkflowValidation`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua validationType, label, isValidationLevelAllowed → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMWorkflowValidationSerialNumber instance = new TFMWorkflowValidationSerialNumber(<args>);` rồi `instance.validationType(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMWorkflowValidationToLocation`
1. **Tên class:** `TFMWorkflowValidationToLocation`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Workflow/Process/Logic/Validation (workflow validation to location); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `validationType` — khi cần xem method body để xác định hành vi; `label` — khi cần xem method body để xác định hành vi
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMWorkflowValidation`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input workflow/process, request và state hiện tại (tham số của method public hoặc state của instance) → xử lý chạy block/step/validation rồi trả next step/config/post result qua validationType, label → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMWorkflowValidationToLocation instance = new TFMWorkflowValidationToLocation(<args>);` rồi `instance.validationType(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: block order, trạng thái process và TTS/posting; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMWorkLogForm`
1. **Tên class:** `TFMWorkLogForm`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Form/UI (work log form); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `sessionId` (TFMProcessSessionID) — session mã định danh; `collectors` (TFMRegistrationCollectors) — collectors; `specialCollectors` (TFMRegistrationCollectors) — special collectors; `entries` (Map) — entries; `collectorsMap` (Map) — collectors map; `results` (Map) — results; `resultStatus` (Map) — result trạng thái; `additionalValuesMap` (Map) — additional values map; `drawFlowControl` (TFMDrawFlowControl) — draw flow control; `currentlyPickedRecord` (int64) — currently picked record; `headers` (TFMReferenceDataConfiguration) — headers; `htmlViewer` (TFMHtmlViewerCtrl) — html viewer; … còn 7 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `updateSessionId` — khi cần ghi/cập nhật state; `QueueRecordPicked` — khi cần xem method body để xác định hành vi; `populateGroup` — khi cần xem method body để xác định hành vi; `getHeaders` — khi cần lấy hoặc tra cứu; `new` — khi cần khởi tạo/xây dựng; `addFilters` — khi cần ghi/cập nhật state; `fieldModified` — khi cần xem method body để xác định hành vi; `fieldDescModified` — khi cần xem method body để xác định hành vi; … còn 13 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMRegistrationCollectors`, `TFMDrawFlowControl`, `TFMReferenceDataConfiguration`, `TFMHtmlViewerCtrl`. Dependency trong source: `TFMfieldFromNameCreator`, `TFMDrawFlowControlInteractionWorkLog`, `TFMRequestElement`, `TFMConstants`, `TFMXMLDeserializer`, `TFMPage`, `TFMPagesProvider`, `TFMPageOrderLinesConfiguration`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input Args, record và control state (tham số của method public hoặc state của instance) → xử lý form/helper xử lý UI hoặc cấu hình qua updateSessionId, QueueRecordPicked, populateGroup → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMWorkLogForm instance = new TFMWorkLogForm(<args>);` rồi `instance.updateSessionId(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: caller context, form lifecycle, permissions và null buffers; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMXMLDeserializer`
1. **Tên class:** `TFMXMLDeserializer`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm XML/Serialization (xml deserializer); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `getXmlDocument` — khi cần lấy hoặc tra cứu; `DeserializeRequestString` — khi cần parse/serialize XML; `DeserializeRequest` — khi cần parse/serialize XML; `convertRequestClass` — khi cần xem method body để xác định hành vi; `convertRequestClassDirect` — khi cần xem method body để xác định hành vi; `findClass` — khi cần lấy hoặc tra cứu; `addFieldsToClass` — khi cần ghi/cập nhật state; `addValueToRequest` — khi cần ghi/cập nhật state; … còn 2 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Dependency trong source: `TFMRequestElement`, `TFMConstants`, `TFMDocumentConnector`, `TFMDocumentTypeAttribute`, `TFMGetRegistrationConfiguration`, `TFMRequestBasicElement`, `TFMFormLookupHelper`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/document/format (tham số của method public hoặc state của instance) → xử lý parse hoặc build typed structure rồi serialize qua getXmlDocument, DeserializeRequestString, DeserializeRequest → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMXMLDeserializer instance = new TFMXMLDeserializer(<args>);` rồi `instance.getXmlDocument(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: namespace, encoding, escaping, optional nodes, version; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMXMLFormat`
1. **Tên class:** `TFMXMLFormat`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm XML/Serialization (xml format); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `common` (Common) — common; `resultXml` (XmlDocument) — result XML; `orderType` (TFMOrderTypes) — đơn hàng loại; `pageName` (TFMPageID) — page tên/định danh; `imageID` (str) — image mã định danh; `sorting` (str) — sorting; `displayLine1` (str) — display line1; `displayLine2` (str) — display line2; `displayLine3` (str) — display line3; `displayLine4` (str) — display line4; `displayLine5` (str) — display line5; `fieldsToAdd` (Map) — fields to add; … còn 8 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `parmDeviceId` — khi cần đọc/ghi tham số; `dataSource` — khi cần xem method body để xác định hành vi; `parmFieldsToAddMap` — khi cần đọc/ghi tham số; `addFieldToOutput` — khi cần ghi/cập nhật state; `getPage` — khi cần lấy hoặc tra cứu; `addMenuItemsConfigurationIfExists` — khi cần ghi/cập nhật state; `addMenuItemsConfiguration` — khi cần ghi/cập nhật state; `appendMenuItemConfigurationToXML` — khi cần ghi/cập nhật state; … còn 27 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Composition/member fields: `TFMPage`. Dependency trong source: `TFMPagesProvider`, `TFMMenuItemStateConfiguration`, `TFMConstants`, `TFMHelper`, `TFMTablesProvider`, `TFMListCustomComponent`, `TFMList`, `TFMListsProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/document/format (tham số của method public hoặc state của instance) → xử lý parse hoặc build typed structure rồi serialize qua parmDeviceId, dataSource, parmFieldsToAddMap → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMXMLFormat instance = new TFMXMLFormat(<args>);` rồi `instance.parmDeviceId(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: namespace, encoding, escaping, optional nodes, version; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMXMLFormatLookup`
1. **Tên class:** `TFMXMLFormatLookup`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm XML/Serialization (xml format lookup); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `inventDim` (InventDim) — invent dim; `collectors` (TFMRegistrationCollectors) — collectors; `additionalValues` (Map) — additional values; `barcode` (str) — barcode
4. **Method chính và khi nào dùng:** `setRegistrationCollector` — khi cần ghi/cập nhật state; `setAdditionalValues` — khi cần ghi/cập nhật state; `convertFieldsToMap` — khi cần xem method body để xác định hành vi; `setXML` — khi cần ghi/cập nhật state; `appendToXML` — khi cần ghi/cập nhật state; `addToLineElement` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMXMLFormat`. Composition/member fields: `TFMRegistrationCollectors`. Dependency trong source: `TFMConstants`, `TFMRegistrationCollector`, `TFMRegistrationConfigurationResponseElement`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/document/format (tham số của method public hoặc state của instance) → xử lý parse hoặc build typed structure rồi serialize qua setRegistrationCollector, setAdditionalValues, convertFieldsToMap → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMXMLFormatLookup instance = new TFMXMLFormatLookup(<args>);` rồi `instance.setRegistrationCollector(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: namespace, encoding, escaping, optional nodes, version; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMXMLFormatLookupAttachments`
1. **Tên class:** `TFMXMLFormatLookupAttachments`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm XML/Serialization (xml format lookup attachments); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `setValues` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMXMLFormatLookup`. Dependency trong source: `TFMTableNameAttribute`, `TFMHelper`, `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/document/format (tham số của method public hoặc state của instance) → xử lý parse hoặc build typed structure rồi serialize qua setValues → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMXMLFormatLookupAttachments instance = new TFMXMLFormatLookupAttachments(<args>);` rồi `instance.setValues(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: namespace, encoding, escaping, optional nodes, version; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMXmlFormatLookupWorklog`
1. **Tên class:** `TFMXmlFormatLookupWorklog`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm XML/Serialization (xml format lookup worklog); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `setValues` — khi cần ghi/cập nhật state
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMXMLFormatLookup`. Dependency trong source: `TFMHelper`, `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/document/format (tham số của method public hoặc state của instance) → xử lý parse hoặc build typed structure rồi serialize qua setValues → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMXmlFormatLookupWorklog instance = new TFMXmlFormatLookupWorklog(<args>);` rồi `instance.setValues(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: namespace, encoding, escaping, optional nodes, version; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMXMLFormatOrderLines`
1. **Tên class:** `TFMXMLFormatOrderLines`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm XML/Serialization (xml format order lines); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `orderBackendId` (str) — đơn hàng backend mã định danh; `lineNumber` (str) — line number; `fromBin` (str) — from bin; `toBin` (str) — to bin; `itemNumber` (str) — mặt hàng number; `description` (str) — mô tả; `registerSerialNumber` (boolean) — register serial number; `registerBatchNumber` (boolean) — register batch number; `serialNumber` (str) — serial number; `lotNumber` (str) — lot number; `quantity` (str) — số lượng; `registeredQuantity` (str) — registered số lượng; … còn 10 field khai báo trực tiếp
4. **Method chính và khi nào dùng:** `addBarcode` — khi cần ghi/cập nhật state; `getOrdersElement` — khi cần lấy hoặc tra cứu; `initFromCommon` — khi cần khởi tạo/xây dựng; `setInventDim` — khi cần ghi/cập nhật state; `setCachedXML` — khi cần ghi/cập nhật state; `convertFieldsToMap` — khi cần xem method body để xác định hành vi; `getAdditionalValuesFromWorkflow` — khi cần lấy hoặc tra cứu; `setXML` — khi cần ghi/cập nhật state; … còn 3 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMXMLFormat`. Composition/member fields: `TFMInventDimSetup`. Dependency trong source: `TFMConstants`, `TFMHelper`, `TFMPageOrderLinesConfiguration`, `TFMService`, `TFMWorkflowBlock`, `TFMServiceProvider`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/document/format (tham số của method public hoặc state của instance) → xử lý parse hoặc build typed structure rồi serialize qua addBarcode, getOrdersElement, initFromCommon → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMXMLFormatOrderLines instance = new TFMXMLFormatOrderLines(<args>);` rồi `instance.addBarcode(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: namespace, encoding, escaping, optional nodes, version; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMXMLFormatOrders`
1. **Tên class:** `TFMXMLFormatOrders`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm XML/Serialization (xml format orders); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** `backendId` (str) — backend mã định danh; `status` (str) — trạng thái; `headerLabel1` (str) — header label1; `headerLabel2` (str) — header label2; `headerValue1` (str) — header value1; `headerValue2` (str) — header value2
4. **Method chính và khi nào dùng:** `setValues` — khi cần ghi/cập nhật state; `clearValues` — khi cần ghi/cập nhật state; `parmHeaderValue1` — khi cần đọc/ghi tham số; `parmHeaderValue2` — khi cần đọc/ghi tham số; `parmHeaderLabel1` — khi cần đọc/ghi tham số; `parmHeaderLabel2` — khi cần đọc/ghi tham số; `convertFieldsToMap` — khi cần xem method body để xác định hành vi; `setXML` — khi cần ghi/cập nhật state; … còn 1 method trong source
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMXMLFormat`. Dependency trong source: `TFMConstants`, `TFMHelper`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/document/format (tham số của method public hoặc state của instance) → xử lý parse hoặc build typed structure rồi serialize qua setValues, clearValues, parmHeaderValue1 → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMXMLFormatOrders instance = new TFMXMLFormatOrders(<args>);` rồi `instance.setValues(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: namespace, encoding, escaping, optional nodes, version; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

### `TFMXMLFormatSearch`
1. **Tên class:** `TFMXMLFormatSearch`.
2. **Mục đích/chức năng chính:** Mục đích suy luận từ tên: class phục vụ nhóm Request/Response/Search (xml format search); xác nhận bằng source body/call site.
3. **Thuộc tính quan trọng (ý nghĩa từng field):** Không có field instance trực tiếp trong declaration trích được.
4. **Method chính và khi nào dùng:** `appendToXML` — khi cần ghi/cập nhật state; `setValues` — khi cần ghi/cập nhật state; `parmImageId` — khi cần đọc/ghi tham số; `setXML` — khi cần ghi/cập nhật state; `convertFieldsToMap` — khi cần xem method body để xác định hành vi; `initFromCommon` — khi cần khởi tạo/xây dựng
5. **Quan hệ với class khác (kế thừa/composition/dependency):** Kế thừa: `TFMXmlFormat`. Dependency trong source: `TFMConstants`.
6. **Luồng sử dụng thực tế (input → xử lý → output):** Sơ đồ suy luận theo nhóm: input XML/device request và document type (tham số của method public hoặc state của instance) → xử lý parse/dispatch/search rồi tạo response qua appendToXML, setValues, parmImageId → output/side effect theo method return và body; cần xác minh tại source.
7. **Ví dụ khởi tạo và sử dụng ngắn gọn:** Sơ đồ, không bảo đảm compile-ready: `TFMXMLFormatSearch instance = new TFMXMLFormatSearch(<args>);` rồi `instance.appendToXML(...)`; kiểm tra constructor/visibility trước khi dùng.
8. **Lưu ý/rủi ro thường gặp:** Suy luận theo nhóm: giữ XML contract, node/field, device/message context; validate input; xác nhận precondition, null handling và side effect trong method body trước khi tích hợp.

