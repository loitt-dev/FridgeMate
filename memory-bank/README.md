# FridgeMate Memory Bank

## Tổng Quan

Memory Bank là hệ thống quản lý kiến thức và ngữ cảnh dự án FridgeMate. Nó cung cấp thông tin chi tiết về dự án, tiến độ, và các quyết định kỹ thuật để hỗ trợ quá trình phát triển.

## Cấu Trúc Thư Mục

```
memory-bank/
├── README.md                 # Tài liệu này
├── projectbrief.md          # Tổng quan dự án và mục tiêu
├── techContext.md           # Ngữ cảnh kỹ thuật và kiến trúc
├── productContext.md        # Ngữ cảnh sản phẩm và tính năng
├── systemPatterns.md        # Patterns và conventions
├── activeContext.md         # Trạng thái hiện tại của dự án
├── progress.md              # Theo dõi tiến độ chi tiết
├── tasks.md                 # Danh sách công việc hiện tại
├── style-guide.md           # Hướng dẫn code style và best practices
├── creative/                # Tài liệu creative phase
├── reflection/              # Tài liệu reflection phase
└── archive/                 # Lưu trữ các task đã hoàn thành
```

## Các File Cốt Lõi

### 1. projectbrief.md
- **Mục đích**: Tổng quan dự án, mục tiêu, và roadmap
- **Nội dung**: 
  - Tổng quan sản phẩm
  - Mục tiêu chính (Phase 1-5)
  - Đối tượng người dùng
  - Giá trị cốt lõi
  - Thành công định nghĩa

### 2. techContext.md
- **Mục đích**: Ngữ cảnh kỹ thuật và kiến trúc hệ thống
- **Nội dung**:
  - Kiến trúc tổng thể (Clean Architecture)
  - Stack công nghệ (Flutter, Dart, GetIt, Riverpod)
  - Cấu trúc module
  - Patterns & conventions
  - Development workflow

### 3. productContext.md
- **Mục đích**: Ngữ cảnh sản phẩm và tính năng
- **Nội dung**:
  - Tính năng chính (Phase 1)
  - User journey
  - User personas
  - Success metrics
  - Competitive analysis

### 4. systemPatterns.md
- **Mục đích**: Patterns và conventions được sử dụng
- **Nội dung**:
  - Architectural patterns (Clean Architecture, Repository, Use Case)
  - Design patterns (DI, Factory, Observer)
  - Data patterns (DTO, Entity Mapping)
  - UI patterns (MVVM, Widget Composition)
  - Error handling patterns
  - Testing patterns

### 5. activeContext.md
- **Mục đích**: Trạng thái hiện tại của dự án
- **Nội dung**:
  - Phase hiện tại (Phase 1)
  - Module status
  - Development focus
  - Technical debt
  - Next steps

### 6. progress.md
- **Mục đích**: Theo dõi tiến độ chi tiết
- **Nội dung**:
  - Overall progress (70%)
  - Module progress
  - Feature progress
  - Development milestones
  - Quality metrics
  - Risk assessment

### 7. tasks.md
- **Mục đích**: Danh sách công việc hiện tại
- **Nội dung**:
  - Active tasks với priority
  - Testing tasks
  - Documentation tasks
  - Blocked tasks
  - Completed tasks

### 8. style-guide.md
- **Mục đích**: Hướng dẫn code style và best practices
- **Nội dung**:
  - Dart/Flutter conventions
  - Architecture patterns
  - UI/UX guidelines
  - Error handling
  - Testing guidelines
  - Performance guidelines
  - Accessibility guidelines
  - Security guidelines

## Thư Mục Chuyên Biệt

### creative/
Lưu trữ tài liệu từ creative phase:
- `creative-[feature_name].md`: Tài liệu thiết kế cho từng tính năng
- UI/UX mockups và wireframes
- Design decisions và rationale

### reflection/
Lưu trữ tài liệu từ reflection phase:
- `reflection-[task_id].md`: Phản ánh về từng task
- Lessons learned
- Improvement suggestions

### archive/
Lưu trữ các task đã hoàn thành:
- `archive-[task_id].md`: Tài liệu hoàn chỉnh của task
- Implementation details
- Final results và metrics

## Cách Sử Dụng

### 1. Khi Bắt Đầu Task Mới
- Đọc `activeContext.md` để hiểu trạng thái hiện tại
- Kiểm tra `tasks.md` để xem công việc cần làm
- Tham khảo `style-guide.md` cho coding standards

### 2. Khi Cần Hiểu Kiến Trúc
- Đọc `techContext.md` để hiểu kiến trúc tổng thể
- Tham khảo `systemPatterns.md` cho patterns cụ thể
- Xem `projectbrief.md` để hiểu mục tiêu dự án

### 3. Khi Cần Hiểu Sản Phẩm
- Đọc `productContext.md` để hiểu tính năng và user journey
- Xem `activeContext.md` để biết phase hiện tại
- Kiểm tra `progress.md` để theo dõi tiến độ

### 4. Khi Hoàn Thành Task
- Cập nhật `progress.md` với tiến độ mới
- Cập nhật `tasks.md` với trạng thái task
- Tạo reflection document trong `reflection/`
- Archive task trong `archive/`

## Quy Tắc Cập Nhật

### 1. Cập Nhật Thường Xuyên
- `tasks.md`: Cập nhật hàng ngày
- `progress.md`: Cập nhật hàng tuần
- `activeContext.md`: Cập nhật khi có thay đổi lớn

### 2. Cập Nhật Khi Hoàn Thành
- `progress.md`: Cập nhật completion status
- `tasks.md`: Move completed tasks
- Tạo archive document

### 3. Cập Nhật Khi Có Thay Đổi
- `techContext.md`: Khi thay đổi kiến trúc
- `productContext.md`: Khi thay đổi tính năng
- `systemPatterns.md`: Khi thêm patterns mới

## Lưu Ý Quan Trọng

1. **Tính Nhất Quán**: Đảm bảo thông tin giữa các file nhất quán
2. **Cập Nhật Kịp Thời**: Cập nhật thông tin ngay khi có thay đổi
3. **Chi Tiết Đầy Đủ**: Cung cấp đủ thông tin để hiểu context
4. **Dễ Đọc**: Sử dụng format markdown rõ ràng
5. **Tổ Chức Tốt**: Giữ cấu trúc thư mục gọn gàng

## Liên Kết Với Development

Memory Bank được thiết kế để hỗ trợ quá trình phát triển:

- **Planning**: Sử dụng `projectbrief.md` và `productContext.md`
- **Architecture**: Tham khảo `techContext.md` và `systemPatterns.md`
- **Implementation**: Tuân theo `style-guide.md`
- **Tracking**: Cập nhật `progress.md` và `tasks.md`
- **Reflection**: Sử dụng `reflection/` và `archive/`

## Hỗ Trợ

Nếu cần hỗ trợ về Memory Bank:
1. Đọc tài liệu này trước
2. Kiểm tra các file liên quan
3. Cập nhật thông tin nếu cần thiết
4. Liên hệ team lead nếu có vấn đề
