/// String extensions for FridgeMate
extension StringExtensions on String {
  /// Capitalize first letter
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Capitalize first letter of each word
  String get capitalizeWords {
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  /// Check if string is null or empty
  bool get isNullOrEmpty => isEmpty;

  /// Check if string is not null and not empty
  bool get isNotNullOrEmpty => isNotEmpty;

  /// Check if string is null or blank (empty or only whitespace)
  bool get isNullOrBlank => trim().isEmpty;

  /// Check if string is not null and not blank
  bool get isNotNullOrBlank => trim().isNotEmpty;

  /// Remove Vietnamese accents
  String removeVietnameseAccents() {
    const vietnamese =
        'àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ';
    const english =
        'aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiioooooooooooooooouuuuuuuuuuuyyyyy';

    String result = this;
    for (int i = 0; i < vietnamese.length; i++) {
      result = result.replaceAll(vietnamese[i], english[i]);
    }
    return result;
  }

  /// Convert to slug (URL-friendly string)
  String toSlug() {
    return toLowerCase()
        .removeVietnameseAccents()
        .replaceAll(RegExp(r'[^a-z0-9\s-]'), '')
        .replaceAll(RegExp(r'\s+'), '-')
        .replaceAll(RegExp(r'-+'), '-')
        .trim();
  }

  /// Truncate string to specified length
  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength - suffix.length)}$suffix';
  }

  /// Remove all whitespace
  String removeWhitespace() {
    return replaceAll(RegExp(r'\s+'), '');
  }

  /// Check if string contains only digits
  bool get isNumeric {
    return RegExp(r'^\d+$').hasMatch(this);
  }

  /// Check if string is a valid email
  bool get isValidEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  /// Check if string is a valid phone number (Vietnamese format)
  bool get isValidPhone {
    return RegExp(r'^[0-9]{10,11}$').hasMatch(this);
  }

  /// Check if string is a valid Vietnamese phone number
  bool get isValidVietnamesePhone {
    return RegExp(r'^(0|\+84)[0-9]{9,10}$').hasMatch(this);
  }

  /// Extract numbers from string
  String extractNumbers() {
    return replaceAll(RegExp(r'[^\d]'), '');
  }

  /// Extract letters from string
  String extractLetters() {
    return replaceAll(RegExp(r'[^a-zA-Z]'), '');
  }

  /// Extract alphanumeric characters from string
  String extractAlphanumeric() {
    return replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
  }

  /// Check if string starts with any of the given prefixes
  bool startsWithAny(List<String> prefixes) {
    return prefixes.any((prefix) => startsWith(prefix));
  }

  /// Check if string ends with any of the given suffixes
  bool endsWithAny(List<String> suffixes) {
    return suffixes.any((suffix) => endsWith(suffix));
  }

  /// Check if string contains any of the given substrings
  bool containsAny(List<String> substrings) {
    return substrings.any((substring) => contains(substring));
  }

  /// Check if string contains all of the given substrings
  bool containsAll(List<String> substrings) {
    return substrings.every((substring) => contains(substring));
  }

  /// Replace multiple characters at once
  String replaceMultiple(Map<String, String> replacements) {
    String result = this;
    replacements.forEach((oldValue, newValue) {
      result = result.replaceAll(oldValue, newValue);
    });
    return result;
  }

  /// Split string into chunks of specified size
  List<String> chunk(int size) {
    final chunks = <String>[];
    for (int i = 0; i < length; i += size) {
      chunks.add(substring(i, i + size > length ? length : i + size));
    }
    return chunks;
  }

  /// Count occurrences of substring
  int countOccurrences(String substring) {
    int count = 0;
    int index = 0;
    while ((index = indexOf(substring, index)) != -1) {
      count++;
      index += substring.length;
    }
    return count;
  }

  /// Check if string is palindrome
  bool get isPalindrome {
    final cleaned = toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    return cleaned == cleaned.split('').reversed.join('');
  }

  /// Get initials from name
  String get initials {
    return split(' ')
        .where((word) => word.isNotEmpty)
        .map((word) => word[0].toUpperCase())
        .join('');
  }

  /// Convert to title case (first letter of each word capitalized)
  String get titleCase {
    return split(' ')
        .map(
          (word) => word.isEmpty
              ? word
              : word[0].toUpperCase() + word.substring(1).toLowerCase(),
        )
        .join(' ');
  }

  /// Convert to sentence case (first letter capitalized, rest lowercase)
  String get sentenceCase {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Check if string is a valid URL
  bool get isValidUrl {
    try {
      final uri = Uri.parse(this);
      return uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
    } catch (e) {
      return false;
    }
  }

  /// Check if string is a valid Vietnamese ID card number
  bool get isValidVietnameseIdCard {
    return RegExp(r'^[0-9]{9,12}$').hasMatch(this);
  }

  /// Check if string is a valid barcode
  bool get isValidBarcode {
    return RegExp(r'^[0-9]{8,14}$').hasMatch(this);
  }

  /// Format as Vietnamese currency
  String toVietnameseCurrency() {
    final number = double.tryParse(this);
    if (number == null) return this;

    final formatter = RegExp(r'(\d)(?=(\d{3})+(?!\d))');
    return '${number.toStringAsFixed(0).replaceAllMapped(formatter, (match) => '${match[1]},')} ₫';
  }

  /// Remove HTML tags
  String removeHtmlTags() {
    return replaceAll(RegExp(r'<[^>]*>'), '');
  }

  /// Escape HTML characters
  String escapeHtml() {
    return replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#x27;');
  }

  /// Unescape HTML characters
  String unescapeHtml() {
    return replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#x27;', "'");
  }
}
