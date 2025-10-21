class ValidationUtils {
  // Email validation
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }
  
  // Phone number validation (Vietnamese format)
  static bool isValidPhoneNumber(String phoneNumber) {
    final phoneRegex = RegExp(r'^(0|\+84)[0-9]{9,10}$');
    return phoneRegex.hasMatch(phoneNumber.replaceAll(' ', ''));
  }
  
  // Password validation
  static bool isValidPassword(String password) {
    // At least 8 characters, 1 uppercase, 1 lowercase, 1 number
    final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d@$!%*?&]{8,}$');
    return passwordRegex.hasMatch(password);
  }
  
  // Name validation
  static bool isValidName(String name) {
    return name.trim().length >= 2 && name.trim().length <= 50;
  }
  
  // URL validation
  static bool isValidUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
    } catch (e) {
      return false;
    }
  }
  
  // Date validation
  static bool isValidDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return date.isBefore(DateTime.now().add(const Duration(days: 365)));
    } catch (e) {
      return false;
    }
  }
  
  // Number validation
  static bool isValidNumber(String number) {
    return double.tryParse(number) != null;
  }
  
  // Integer validation
  static bool isValidInteger(String integer) {
    return int.tryParse(integer) != null;
  }
  
  // Positive number validation
  static bool isValidPositiveNumber(String number) {
    final parsed = double.tryParse(number);
    return parsed != null && parsed > 0;
  }
  
  // Non-negative number validation
  static bool isValidNonNegativeNumber(String number) {
    final parsed = double.tryParse(number);
    return parsed != null && parsed >= 0;
  }
  
  // Text length validation
  static bool isValidTextLength(String text, {int minLength = 1, int maxLength = 1000}) {
    return text.length >= minLength && text.length <= maxLength;
  }
  
  // Required field validation
  static bool isRequired(String? value) {
    return value != null && value.trim().isNotEmpty;
  }
  
  // Credit card validation (Luhn algorithm)
  static bool isValidCreditCard(String cardNumber) {
    final digits = cardNumber.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 13 || digits.length > 19) return false;
    
    int sum = 0;
    bool alternate = false;
    
    for (int i = digits.length - 1; i >= 0; i--) {
      int digit = int.parse(digits[i]);
      
      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit = (digit % 10) + 1;
        }
      }
      
      sum += digit;
      alternate = !alternate;
    }
    
    return sum % 10 == 0;
  }
  
  // Vietnamese ID card validation
  static bool isValidVietnameseIdCard(String idCard) {
    final idRegex = RegExp(r'^[0-9]{9,12}$');
    return idRegex.hasMatch(idCard);
  }
  
  // Vietnamese tax code validation
  static bool isValidVietnameseTaxCode(String taxCode) {
    final taxRegex = RegExp(r'^[0-9]{10,13}$');
    return taxRegex.hasMatch(taxCode);
  }
  
  // File extension validation
  static bool isValidFileExtension(String fileName, List<String> allowedExtensions) {
    final extension = fileName.split('.').last.toLowerCase();
    return allowedExtensions.contains(extension);
  }
  
  // File size validation
  static bool isValidFileSize(int fileSizeInBytes, int maxSizeInMB) {
    final maxSizeInBytes = maxSizeInMB * 1024 * 1024;
    return fileSizeInBytes <= maxSizeInBytes;
  }
  
  // Image file validation
  static bool isValidImageFile(String fileName) {
    const allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp'];
    return isValidFileExtension(fileName, allowedExtensions);
  }
  
  // Video file validation
  static bool isValidVideoFile(String fileName) {
    const allowedExtensions = ['mp4', 'avi', 'mov', 'wmv', 'flv', 'webm'];
    return isValidFileExtension(fileName, allowedExtensions);
  }
  
  // Audio file validation
  static bool isValidAudioFile(String fileName) {
    const allowedExtensions = ['mp3', 'wav', 'aac', 'flac', 'ogg'];
    return isValidFileExtension(fileName, allowedExtensions);
  }
  
  // Document file validation
  static bool isValidDocumentFile(String fileName) {
    const allowedExtensions = ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt'];
    return isValidFileExtension(fileName, allowedExtensions);
  }
  
  // Color validation (hex format)
  static bool isValidHexColor(String color) {
    final colorRegex = RegExp(r'^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$');
    return colorRegex.hasMatch(color);
  }
  
  // IP address validation
  static bool isValidIpAddress(String ip) {
    final ipRegex = RegExp(r'^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$');
    return ipRegex.hasMatch(ip);
  }
  
  // MAC address validation
  static bool isValidMacAddress(String mac) {
    final macRegex = RegExp(r'^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$');
    return macRegex.hasMatch(mac);
  }
  
  // UUID validation
  static bool isValidUuid(String uuid) {
    final uuidRegex = RegExp(r'^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$', caseSensitive: false);
    return uuidRegex.hasMatch(uuid);
  }
  
  // ISBN validation
  static bool isValidIsbn(String isbn) {
    final cleanIsbn = isbn.replaceAll(RegExp(r'[-\s]'), '');
    if (cleanIsbn.length == 10) {
      return _isValidIsbn10(cleanIsbn);
    } else if (cleanIsbn.length == 13) {
      return _isValidIsbn13(cleanIsbn);
    }
    return false;
  }
  
  static bool _isValidIsbn10(String isbn) {
    if (isbn.length != 10) return false;
    
    int sum = 0;
    for (int i = 0; i < 9; i++) {
      if (!RegExp(r'[0-9]').hasMatch(isbn[i])) return false;
      sum += int.parse(isbn[i]) * (10 - i);
    }
    
    final checkDigit = isbn[9];
    if (checkDigit == 'X') {
      sum += 10;
    } else if (RegExp(r'[0-9]').hasMatch(checkDigit)) {
      sum += int.parse(checkDigit);
    } else {
      return false;
    }
    
    return sum % 11 == 0;
  }
  
  static bool _isValidIsbn13(String isbn) {
    if (isbn.length != 13) return false;
    
    int sum = 0;
    for (int i = 0; i < 12; i++) {
      if (!RegExp(r'[0-9]').hasMatch(isbn[i])) return false;
      sum += int.parse(isbn[i]) * (i % 2 == 0 ? 1 : 3);
    }
    
    final checkDigit = int.parse(isbn[12]);
    return (10 - (sum % 10)) % 10 == checkDigit;
  }
}
