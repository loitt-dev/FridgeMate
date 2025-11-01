/// Regular expression constants for FridgeMate
class RegexConstants {
  RegexConstants._();

  // ============================================
  // Email Validation
  // ============================================

  /// Standard email regex
  static const String email = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  /// Strict email regex (more validation)
  static const String emailStrict =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  // ============================================
  // Phone Number Validation
  // ============================================

  /// Vietnamese phone number (10-11 digits)
  static const String phoneVietnamese = r'^(0|\+84)[0-9]{9,10}$';

  /// International phone number
  static const String phoneInternational = r'^\+[1-9]\d{1,14}$';

  /// General phone number (digits only)
  static const String phoneDigits = r'^[0-9]{10,11}$';

  // ============================================
  // Password Validation
  // ============================================

  /// Password with at least 8 characters, 1 uppercase, 1 lowercase, 1 number
  static const String passwordStrong =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d@$!%*?&]{8,}$';

  /// Password with at least 8 characters, 1 letter, 1 number
  static const String passwordMedium =
      r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d@$!%*?&]{8,}$';

  /// Password with at least 8 characters
  static const String passwordBasic = r'^.{8,}$';

  // ============================================
  // Vietnamese Text
  // ============================================

  /// Vietnamese characters (including accented)
  static const String vietnameseText =
      r'[a-zA-ZàáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđĐ\s]+';

  /// Vietnamese name (letters, spaces, hyphens)
  static const String vietnameseName =
      r'^[a-zA-ZàáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđĐ\s\-]+$';

  // ============================================
  // Numbers & Currency
  // ============================================

  /// Positive integer
  static const String positiveInteger = r'^[1-9]\d*$';

  /// Non-negative integer (including 0)
  static const String nonNegativeInteger = r'^\d+$';

  /// Decimal number
  static const String decimal = r'^\d+(\.\d+)?$';

  /// Positive decimal
  static const String positiveDecimal = r'^[1-9]\d*(\.\d+)?$';

  /// Vietnamese currency format
  static const String vietnameseCurrency = r'^\d{1,3}(,\d{3})*(\.\d+)?$';

  // ============================================
  // Date & Time
  // ============================================

  /// Date format DD/MM/YYYY
  static const String dateDDMMYYYY =
      r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$';

  /// Date format YYYY-MM-DD
  static const String dateYYYYMMDD =
      r'^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$';

  /// Time format HH:MM
  static const String timeHHMM = r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$';

  /// DateTime format DD/MM/YYYY HH:MM
  static const String dateTimeDDMMYYYYHHMM =
      r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}\s([01]?[0-9]|2[0-3]):[0-5][0-9]$';

  // ============================================
  // Vietnamese ID & Documents
  // ============================================

  /// Vietnamese ID card number
  static const String vietnameseIdCard = r'^[0-9]{9,12}$';

  /// Vietnamese passport
  static const String vietnamesePassport = r'^[A-Z]{1,2}[0-9]{6,7}$';

  /// Vietnamese driver's license
  static const String vietnameseDriversLicense = r'^[0-9]{12}$';

  // ============================================
  // Barcode & QR Code
  // ============================================

  /// EAN-13 barcode
  static const String ean13 = r'^[0-9]{13}$';

  /// EAN-8 barcode
  static const String ean8 = r'^[0-9]{8}$';

  /// UPC-A barcode
  static const String upcA = r'^[0-9]{12}$';

  /// UPC-E barcode
  static const String upcE = r'^[0-9]{6,8}$';

  /// General barcode (8-14 digits)
  static const String barcode = r'^[0-9]{8,14}$';

  // ============================================
  // URL & Web
  // ============================================

  /// HTTP/HTTPS URL
  static const String url =
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$';

  /// Domain name
  static const String domain =
      r'^[a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?(\.[a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)*$';

  /// IP address
  static const String ipAddress =
      r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$';

  // ============================================
  // File & Path
  // ============================================

  /// File name (alphanumeric, spaces, hyphens, underscores)
  static const String fileName = r'^[a-zA-Z0-9\s\-_\.]+$';

  /// File extension
  static const String fileExtension = r'^\.[a-zA-Z0-9]+$';

  /// Image file extension
  static const String imageExtension = r'\.(jpg|jpeg|png|gif|webp|bmp|svg)$';

  /// Video file extension
  static const String videoExtension = r'\.(mp4|avi|mov|wmv|flv|webm|mkv)$';

  /// Audio file extension
  static const String audioExtension = r'\.(mp3|wav|flac|aac|ogg|wma)$';

  /// Document file extension
  static const String documentExtension =
      r'\.(pdf|doc|docx|txt|rtf|xls|xlsx|ppt|pptx)$';

  // ============================================
  // Social Media & Username
  // ============================================

  /// Username (alphanumeric, underscores, hyphens)
  static const String username = r'^[a-zA-Z0-9_-]{3,30}$';

  /// Hashtag
  static const String hashtag = r'^#[a-zA-Z0-9_]+$';

  /// Mention
  static const String mention = r'^@[a-zA-Z0-9_]+$';

  // ============================================
  // Address & Location
  // ============================================

  /// Vietnamese address
  static const String vietnameseAddress =
      r'^[a-zA-Z0-9àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđĐ\s\.,\/\-]+$';

  /// Postal code (Vietnamese)
  static const String vietnamesePostalCode = r'^[0-9]{5,6}$';

  /// Coordinates (latitude, longitude)
  static const String coordinates =
      r'^-?([1-8]?[0-9](\.[0-9]+)?|90(\.0+)?),\s*-?((1[0-7][0-9])|([1-9]?[0-9]))(\.[0-9]+)?$';

  // ============================================
  // Special Characters & Formatting
  // ============================================

  /// Alphanumeric only
  static const String alphanumeric = r'^[a-zA-Z0-9]+$';

  /// Letters only
  static const String lettersOnly = r'^[a-zA-Z]+$';

  /// Numbers only
  static const String numbersOnly = r'^[0-9]+$';

  /// No special characters (letters, numbers, spaces)
  static const String noSpecialChars = r'^[a-zA-Z0-9\s]+$';

  /// Slug (URL-friendly)
  static const String slug = r'^[a-z0-9]+(?:-[a-z0-9]+)*$';

  /// UUID
  static const String uuid =
      r'^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$';

  // ============================================
  // Vietnamese Specific
  // ============================================

  /// Vietnamese bank account number
  static const String vietnameseBankAccount = r'^[0-9]{9,19}$';

  /// Vietnamese tax code
  static const String vietnameseTaxCode = r'^[0-9]{10,13}$';

  /// Vietnamese business license
  static const String vietnameseBusinessLicense = r'^[0-9]{10}$';

  // ============================================
  // Food & Medicine Specific
  // ============================================

  /// Food item name
  static const String foodItemName =
      r'^[a-zA-Z0-9àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđĐ\s\-\&\(\)]+$';

  /// Medicine name
  static const String medicineName =
      r'^[a-zA-Z0-9àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđĐ\s\-\&\(\)]+$';

  /// Recipe name
  static const String recipeName =
      r'^[a-zA-Z0-9àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđĐ\s\-\&\(\)]+$';

  /// Category name
  static const String categoryName =
      r'^[a-zA-Z0-9àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđĐ\s\-\&\(\)]+$';

  // ============================================
  // Validation Helpers
  // ============================================

  /// Get regex pattern by name
  static String getPattern(String patternName) {
    switch (patternName.toLowerCase()) {
      case 'email':
        return email;
      case 'phone':
        return phoneVietnamese;
      case 'password':
        return passwordMedium;
      case 'username':
        return username;
      case 'vietnamese_name':
        return vietnameseName;
      case 'positive_integer':
        return positiveInteger;
      case 'decimal':
        return decimal;
      case 'date_dd_mm_yyyy':
        return dateDDMMYYYY;
      case 'time_hh_mm':
        return timeHHMM;
      case 'vietnamese_id':
        return vietnameseIdCard;
      case 'barcode':
        return barcode;
      case 'url':
        return url;
      case 'filename':
        return fileName;
      case 'hashtag':
        return hashtag;
      case 'mention':
        return mention;
      case 'alphanumeric':
        return alphanumeric;
      case 'slug':
        return slug;
      case 'uuid':
        return uuid;
      default:
        throw ArgumentError('Unknown pattern: $patternName');
    }
  }

  /// Check if string matches pattern
  static bool matches(String input, String pattern) {
    return RegExp(pattern).hasMatch(input);
  }

  /// Check if string matches pattern by name
  static bool matchesPattern(String input, String patternName) {
    return matches(input, getPattern(patternName));
  }
}
