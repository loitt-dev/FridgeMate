/// Hệ thống typography cho FridgeMate tuân theo nguyên tắc thiết kế Material 3
///
/// Lớp này định nghĩa tất cả các kích thước font được sử dụng trong toàn bộ ứng dụng FridgeMate
/// để đảm bảo typography nhất quán và dễ đọc.
class AppFontSize {
  // ============================================
  // KÍCH THƯỚC DISPLAY TEXT - Cho tiêu đề lớn
  // ============================================
  static const double displayLarge = 57.0; // Text hero, tiêu đề chính
  static const double displayMedium = 45.0; // Tiêu đề phần
  static const double displaySmall = 36.0; // Tiêu đề trang

  // ============================================
  // KÍCH THƯỚC HEADLINE - Cho tiêu đề phần
  // ============================================
  static const double headlineLarge = 32.0; // Tiêu đề phần chính
  static const double headlineMedium = 28.0; // Tiêu đề phần phụ
  static const double headlineSmall = 24.0; // Tiêu đề card, tiêu đề danh sách

  // ============================================
  // KÍCH THƯỚC TITLE - Cho tiêu đề card và danh sách
  // ============================================
  static const double titleLarge = 22.0; // Tiêu đề card, tiêu đề dialog
  static const double titleMedium = 16.0; // Tiêu đề item trong danh sách
  static const double titleSmall = 14.0; // Tiêu đề card nhỏ

  // ============================================
  // KÍCH THƯỚC BODY TEXT - Cho nội dung chính
  // ============================================
  static const double bodyLarge = 16.0; // Text nội dung chính
  static const double bodyMedium = 14.0; // Nội dung phụ
  static const double bodySmall = 12.0; // Chú thích, metadata

  // ============================================
  // KÍCH THƯỚC LABEL - Cho nhãn form và nút
  // ============================================
  static const double labelLarge = 14.0; // Text nút, nhãn form
  static const double labelMedium = 12.0; // Nút nhỏ, chip
  static const double labelSmall = 11.0; // Nhãn nhỏ, badge

  // ============================================
  // KÍCH THƯỚC RIÊNG CHO FRIDGEMATE
  // ============================================

  // Dành cho item và công thức
  static const double itemName = 16.0; // Tên item trong card
  static const double itemDescription = 14.0; // Mô tả item
  static const double itemMetadata = 12.0; // Ngày hết hạn, số lượng
  static const double itemPrice = 14.0; // Thông tin giá

  // Dành cho công thức
  static const double recipeTitle = 18.0; // Tiêu đề card công thức
  static const double recipeDescription = 14.0; // Mô tả công thức
  static const double recipeTime = 12.0; // Thời gian nấu
  static const double recipeServings = 12.0; // Thông tin khẩu phần

  // Dành cho danh sách mua sắm
  static const double shoppingItem = 16.0; // Item trong danh sách mua sắm
  static const double shoppingQuantity = 14.0; // Số lượng
  static const double shoppingPrice = 14.0; // Tổng giá

  // Điều hướng và phần tử UI
  static const double appBar = 20.0; // Tiêu đề app bar
  static const double bottomNav = 12.0; // Nhãn bottom navigation
  static const double tabLabel = 14.0; // Nhãn tab
  static const double drawerItem = 16.0; // Item trong drawer menu

  // Phần tử form
  static const double input = 16.0; // Trường nhập text
  static const double inputLabel = 14.0; // Nhãn trường form
  static const double inputHint = 14.0; // Gợi ý nhập
  static const double inputError = 12.0; // Thông báo lỗi

  // Phần tử tương tác
  static const double button = 14.0; // Text nút
  static const double chip = 12.0; // Nhãn chip
  static const double badge = 10.0; // Text badge
  static const double tooltip = 12.0; // Text tooltip

  // Trạng thái và phản hồi
  static const double caption = 10.0; // Chú thích nhỏ
  static const double overline = 10.0; // Text overline
  static const double error = 12.0; // Thông báo lỗi
  static const double success = 12.0; // Thông báo thành công
  static const double warning = 12.0; // Thông báo cảnh báo

  // Trường hợp đặc biệt
  static const double hero = 48.0; // Text hero trên landing
  static const double splash = 24.0; // Text splash screen
  static const double onboarding = 18.0; // Text onboarding
}
