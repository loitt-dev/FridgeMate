import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Mixin để handle validation
///
/// Cung cấp:
/// - Form validation
/// - Field validation
/// - Validation error handling
mixin ValidationMixin<T> on StateNotifier<T> {
  /// Validation errors map
  Map<String, String> _validationErrors = {};

  /// Get validation errors
  Map<String, String> get validationErrors =>
      Map.unmodifiable(_validationErrors);

  /// Check if has validation errors
  bool get hasValidationErrors => _validationErrors.isNotEmpty;

  /// Get error for specific field
  String? getFieldError(String fieldName) => _validationErrors[fieldName];

  /// Set validation error for field
  void setFieldError(String fieldName, String error) {
    _validationErrors[fieldName] = error;
    // Trigger state update
    _onValidationErrorsChanged();
  }

  /// Clear validation error for field
  void clearFieldError(String fieldName) {
    _validationErrors.remove(fieldName);
    _onValidationErrorsChanged();
  }

  /// Clear all validation errors
  void clearAllValidationErrors() {
    _validationErrors.clear();
    _onValidationErrorsChanged();
  }

  /// Set multiple validation errors
  void setValidationErrors(Map<String, String> errors) {
    _validationErrors = Map.from(errors);
    _onValidationErrorsChanged();
  }

  /// Called when validation errors change
  void _onValidationErrorsChanged() {
    // Override trong concrete ViewModels để handle state update
  }

  /// Validate field
  bool validateField(
    String fieldName,
    String value,
    List<ValidationRule> rules,
  ) {
    clearFieldError(fieldName);

    for (final rule in rules) {
      final error = rule.validate(value);
      if (error != null) {
        setFieldError(fieldName, error);
        return false;
      }
    }

    return true;
  }

  /// Validate form
  bool validateForm(
    Map<String, String> formData,
    Map<String, List<ValidationRule>> rules,
  ) {
    clearAllValidationErrors();
    bool isValid = true;

    for (final entry in rules.entries) {
      final fieldName = entry.key;
      final fieldRules = entry.value;
      final value = formData[fieldName] ?? '';

      if (!validateField(fieldName, value, fieldRules)) {
        isValid = false;
      }
    }

    return isValid;
  }

  /// Validate required field
  bool validateRequired(String fieldName, String value) {
    return validateField(fieldName, value, [ValidationRule.required()]);
  }

  /// Validate email
  bool validateEmail(String fieldName, String value) {
    return validateField(fieldName, value, [ValidationRule.email()]);
  }

  /// Validate phone number
  bool validatePhone(String fieldName, String value) {
    return validateField(fieldName, value, [ValidationRule.phone()]);
  }

  /// Validate password
  bool validatePassword(String fieldName, String value) {
    return validateField(fieldName, value, [ValidationRule.password()]);
  }

  /// Validate min length
  bool validateMinLength(String fieldName, String value, int minLength) {
    return validateField(fieldName, value, [
      ValidationRule.minLength(minLength),
    ]);
  }

  /// Validate max length
  bool validateMaxLength(String fieldName, String value, int maxLength) {
    return validateField(fieldName, value, [
      ValidationRule.maxLength(maxLength),
    ]);
  }

  /// Validate number
  bool validateNumber(String fieldName, String value) {
    return validateField(fieldName, value, [ValidationRule.number()]);
  }

  /// Validate positive number
  bool validatePositiveNumber(String fieldName, String value) {
    return validateField(fieldName, value, [ValidationRule.positiveNumber()]);
  }
}

/// Validation rule class
class ValidationRule {
  final bool Function(String value)? validator;
  final String errorMessage;

  const ValidationRule({required this.validator, required this.errorMessage});

  /// Validate value
  String? validate(String value) {
    if (validator == null) return null;
    return validator!(value) ? null : errorMessage;
  }

  /// Required field validation
  factory ValidationRule.required({String? message}) {
    return ValidationRule(
      validator: (value) => value.trim().isNotEmpty,
      errorMessage: message ?? 'Trường này là bắt buộc',
    );
  }

  /// Email validation
  factory ValidationRule.email({String? message}) {
    return ValidationRule(
      validator: (value) {
        if (value.isEmpty) return true; // Allow empty if not required
        return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
      },
      errorMessage: message ?? 'Email không hợp lệ',
    );
  }

  /// Phone validation
  factory ValidationRule.phone({String? message}) {
    return ValidationRule(
      validator: (value) {
        if (value.isEmpty) return true; // Allow empty if not required
        return RegExp(r'^[0-9]{10,11}$').hasMatch(value.replaceAll(' ', ''));
      },
      errorMessage: message ?? 'Số điện thoại không hợp lệ',
    );
  }

  /// Password validation
  factory ValidationRule.password({String? message}) {
    return ValidationRule(
      validator: (value) => value.length >= 6,
      errorMessage: message ?? 'Mật khẩu phải có ít nhất 6 ký tự',
    );
  }

  /// Min length validation
  factory ValidationRule.minLength(int minLength, {String? message}) {
    return ValidationRule(
      validator: (value) => value.length >= minLength,
      errorMessage: message ?? 'Phải có ít nhất $minLength ký tự',
    );
  }

  /// Max length validation
  factory ValidationRule.maxLength(int maxLength, {String? message}) {
    return ValidationRule(
      validator: (value) => value.length <= maxLength,
      errorMessage: message ?? 'Không được vượt quá $maxLength ký tự',
    );
  }

  /// Number validation
  factory ValidationRule.number({String? message}) {
    return ValidationRule(
      validator: (value) {
        if (value.isEmpty) return true; // Allow empty if not required
        return double.tryParse(value) != null;
      },
      errorMessage: message ?? 'Phải là số',
    );
  }

  /// Positive number validation
  factory ValidationRule.positiveNumber({String? message}) {
    return ValidationRule(
      validator: (value) {
        if (value.isEmpty) return true; // Allow empty if not required
        final number = double.tryParse(value);
        return number != null && number > 0;
      },
      errorMessage: message ?? 'Phải là số dương',
    );
  }

  /// Custom validation
  factory ValidationRule.custom(
    bool Function(String value) validator, {
    required String errorMessage,
  }) {
    return ValidationRule(validator: validator, errorMessage: errorMessage);
  }
}
