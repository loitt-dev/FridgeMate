/// Date and time constants for FridgeMate
class DateConstants {
  DateConstants._();

  // ============================================
  // Date Formats
  // ============================================

  /// Vietnamese date format
  static const String vietnameseDateFormat = 'dd/MM/yyyy';

  /// Vietnamese date and time format
  static const String vietnameseDateTimeFormat = 'dd/MM/yyyy HH:mm';

  /// Vietnamese time format
  static const String vietnameseTimeFormat = 'HH:mm';

  /// ISO date format
  static const String isoDateFormat = 'yyyy-MM-dd';

  /// ISO date time format
  static const String isoDateTimeFormat = 'yyyy-MM-ddTHH:mm:ss';

  /// ISO date time with timezone
  static const String isoDateTimeWithTimezoneFormat = 'yyyy-MM-ddTHH:mm:ssZ';

  /// Display date format (for UI)
  static const String displayDateFormat = 'dd MMM yyyy';

  /// Display date time format (for UI)
  static const String displayDateTimeFormat = 'dd MMM yyyy, HH:mm';

  /// Short date format
  static const String shortDateFormat = 'dd/MM';

  /// Long date format
  static const String longDateFormat = 'EEEE, dd MMMM yyyy';

  /// Month year format
  static const String monthYearFormat = 'MM/yyyy';

  /// Year format
  static const String yearFormat = 'yyyy';

  // ============================================
  // Time Formats
  // ============================================

  /// 12-hour time format
  static const String time12HourFormat = 'h:mm a';

  /// 24-hour time format
  static const String time24HourFormat = 'HH:mm';

  /// Time with seconds
  static const String timeWithSecondsFormat = 'HH:mm:ss';

  /// Time with milliseconds
  static const String timeWithMillisecondsFormat = 'HH:mm:ss.SSS';

  // ============================================
  // Vietnamese Day Names
  // ============================================

  static const List<String> vietnameseDayNames = [
    'Chủ nhật',
    'Thứ hai',
    'Thứ ba',
    'Thứ tư',
    'Thứ năm',
    'Thứ sáu',
    'Thứ bảy',
  ];

  static const List<String> vietnameseDayNamesShort = [
    'CN',
    'T2',
    'T3',
    'T4',
    'T5',
    'T6',
    'T7',
  ];

  // ============================================
  // Vietnamese Month Names
  // ============================================

  static const List<String> vietnameseMonthNames = [
    'Tháng 1',
    'Tháng 2',
    'Tháng 3',
    'Tháng 4',
    'Tháng 5',
    'Tháng 6',
    'Tháng 7',
    'Tháng 8',
    'Tháng 9',
    'Tháng 10',
    'Tháng 11',
    'Tháng 12',
  ];

  static const List<String> vietnameseMonthNamesShort = [
    'T1',
    'T2',
    'T3',
    'T4',
    'T5',
    'T6',
    'T7',
    'T8',
    'T9',
    'T10',
    'T11',
    'T12',
  ];

  // ============================================
  // Vietnamese Season Names
  // ============================================

  static const List<String> vietnameseSeasonNames = [
    'Mùa xuân',
    'Mùa hè',
    'Mùa thu',
    'Mùa đông',
  ];

  // ============================================
  // Relative Time Strings
  // ============================================

  static const String justNow = 'Vừa xong';
  static const String minutesAgo = 'phút trước';
  static const String hoursAgo = 'giờ trước';
  static const String daysAgo = 'ngày trước';
  static const String weeksAgo = 'tuần trước';
  static const String monthsAgo = 'tháng trước';
  static const String yearsAgo = 'năm trước';

  static const String inMinutes = 'trong phút';
  static const String inHours = 'trong giờ';
  static const String inDays = 'trong ngày';
  static const String inWeeks = 'trong tuần';
  static const String inMonths = 'trong tháng';
  static const String inYears = 'trong năm';

  // ============================================
  // Expiry Related
  // ============================================

  static const String expired = 'Đã hết hạn';
  static const String expiringToday = 'Hết hạn hôm nay';
  static const String expiringTomorrow = 'Hết hạn ngày mai';
  static const String expiringSoon = 'Sắp hết hạn';
  static const String notExpiring = 'Chưa hết hạn';

  static const String daysUntilExpiry = 'ngày nữa hết hạn';
  static const String hoursUntilExpiry = 'giờ nữa hết hạn';
  static const String minutesUntilExpiry = 'phút nữa hết hạn';

  // ============================================
  // Duration Strings
  // ============================================

  static const String second = 'giây';
  static const String seconds = 'giây';
  static const String minute = 'phút';
  static const String minutes = 'phút';
  static const String hour = 'giờ';
  static const String hours = 'giờ';
  static const String day = 'ngày';
  static const String days = 'ngày';
  static const String week = 'tuần';
  static const String weeks = 'tuần';
  static const String month = 'tháng';
  static const String months = 'tháng';
  static const String year = 'năm';
  static const String years = 'năm';

  // ============================================
  // Cooking Time
  // ============================================

  static const String cookingTime = 'Thời gian nấu';
  static const String prepTime = 'Thời gian chuẩn bị';
  static const String totalTime = 'Tổng thời gian';
  static const String restingTime = 'Thời gian nghỉ';

  // ============================================
  // Vietnamese Holidays
  // ============================================

  static const Map<String, String> vietnameseHolidays = {
    '01-01': 'Tết Dương lịch',
    '30-04': 'Ngày Giải phóng miền Nam',
    '01-05': 'Ngày Quốc tế Lao động',
    '02-09': 'Ngày Quốc khánh',
  };

  static const Map<String, String> vietnameseLunarHolidays = {
    '01-01': 'Tết Nguyên đán',
    '03-03': 'Tết Hàn thực',
    '05-05': 'Tết Đoan ngọ',
    '07-07': 'Tết Thất tịch',
    '07-15': 'Tết Trung nguyên',
    '08-15': 'Tết Trung thu',
    '09-09': 'Tết Trùng cửu',
    '10-10': 'Tết Thường tân',
    '12-23': 'Tết Táo quân',
  };

  // ============================================
  // Weekday Constants
  // ============================================

  static const int monday = 1;
  static const int tuesday = 2;
  static const int wednesday = 3;
  static const int thursday = 4;
  static const int friday = 5;
  static const int saturday = 6;
  static const int sunday = 7;

  static const List<int> weekdays = [1, 2, 3, 4, 5];
  static const List<int> weekends = [6, 7];

  // ============================================
  // Month Constants
  // ============================================

  static const int january = 1;
  static const int february = 2;
  static const int march = 3;
  static const int april = 4;
  static const int may = 5;
  static const int june = 6;
  static const int july = 7;
  static const int august = 8;
  static const int september = 9;
  static const int october = 10;
  static const int november = 11;
  static const int december = 12;

  static const List<int> springMonths = [3, 4, 5];
  static const List<int> summerMonths = [6, 7, 8];
  static const List<int> autumnMonths = [9, 10, 11];
  static const List<int> winterMonths = [12, 1, 2];

  // ============================================
  // Quarter Constants
  // ============================================

  static const int q1 = 1;
  static const int q2 = 2;
  static const int q3 = 3;
  static const int q4 = 4;

  static const Map<int, List<int>> quarters = {
    1: [1, 2, 3],
    2: [4, 5, 6],
    3: [7, 8, 9],
    4: [10, 11, 12],
  };

  // ============================================
  // Time Constants
  // ============================================

  static const int secondsInMinute = 60;
  static const int minutesInHour = 60;
  static const int hoursInDay = 24;
  static const int daysInWeek = 7;
  static const int daysInMonth = 30;
  static const int daysInYear = 365;
  static const int daysInLeapYear = 366;

  static const int millisecondsInSecond = 1000;
  static const int millisecondsInMinute = 60000;
  static const int millisecondsInHour = 3600000;
  static const int millisecondsInDay = 86400000;

  // ============================================
  // Age Groups
  // ============================================

  static const String infant = 'Trẻ sơ sinh';
  static const String toddler = 'Trẻ mới biết đi';
  static const String child = 'Trẻ em';
  static const String teenager = 'Thiếu niên';
  static const String adult = 'Người lớn';
  static const String senior = 'Người cao tuổi';

  static const Map<String, List<int>> ageGroups = {
    infant: [0, 1],
    toddler: [2, 4],
    child: [5, 12],
    teenager: [13, 19],
    adult: [20, 64],
    senior: [65, 120],
  };

  // ============================================
  // Food Expiry Periods
  // ============================================

  static const Map<String, int> foodExpiryDays = {
    'Thịt tươi': 3,
    'Cá tươi': 2,
    'Rau củ': 7,
    'Trái cây': 5,
    'Sữa': 7,
    'Phô mai': 30,
    'Bánh mì': 3,
    'Đồ đông lạnh': 90,
  };

  // ============================================
  // Medicine Expiry Periods
  // ============================================

  static const Map<String, int> medicineExpiryDays = {
    'Thuốc viên': 365,
    'Thuốc nước': 180,
    'Thuốc mỡ': 365,
    'Thuốc tiêm': 30,
    'Vitamin': 730,
  };

  // ============================================
  // Notification Intervals
  // ============================================

  static const Duration expiryWarningInterval = Duration(hours: 24);
  static const Duration expiryCheckInterval = Duration(hours: 6);
  static const Duration syncInterval = Duration(minutes: 30);
  static const Duration backupInterval = Duration(hours: 12);
}
