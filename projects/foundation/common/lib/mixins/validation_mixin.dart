import 'package:flutter/material.dart';
import '../constants/regex_constants.dart';

/// Mixin for handling validation in widgets
mixin ValidationMixin<T extends StatefulWidget> on State<T> {
  final Map<String, String?> _validationErrors = {};
  final Map<String, TextEditingController> _controllers = {};

  // ============================================
  // Validation State Management
  // ============================================

  /// Get validation error for field
  String? getValidationError(String fieldName) {
    return _validationErrors[fieldName];
  }

  /// Set validation error for field
  void setValidationError(String fieldName, String? error) {
    if (mounted) {
      setState(() {
        if (error == null) {
          _validationErrors.remove(fieldName);
        } else {
          _validationErrors[fieldName] = error;
        }
      });
    }
  }

  /// Clear all validation errors
  void clearValidationErrors() {
    if (mounted) {
      setState(() {
        _validationErrors.clear();
      });
    }
  }

  /// Clear validation error for specific field
  void clearValidationError(String fieldName) {
    setValidationError(fieldName, null);
  }

  /// Check if field has validation error
  bool hasValidationError(String fieldName) {
    return _validationErrors.containsKey(fieldName) &&
        _validationErrors[fieldName] != null;
  }

  /// Check if any validation errors exist
  bool get hasValidationErrors => _validationErrors.isNotEmpty;

  // ============================================
  // Text Controller Management
  // ============================================

  /// Get or create text controller for field
  TextEditingController getController(String fieldName) {
    if (!_controllers.containsKey(fieldName)) {
      _controllers[fieldName] = TextEditingController();
    }
    return _controllers[fieldName]!;
  }

  /// Set text controller for field
  void setController(String fieldName, TextEditingController controller) {
    _controllers[fieldName] = controller;
  }

  /// Get text value for field
  String getTextValue(String fieldName) {
    return getController(fieldName).text;
  }

  /// Set text value for field
  void setTextValue(String fieldName, String value) {
    getController(fieldName).text = value;
  }

  /// Clear text value for field
  void clearTextValue(String fieldName) {
    getController(fieldName).clear();
  }

  // ============================================
  // Basic Validation Methods
  // ============================================

  /// Validate required field
  String? validateRequired(String? value, {String? fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? 'Trường này'} không được để trống';
    }
    return null;
  }

  /// Validate minimum length
  String? validateMinLength(String? value, int minLength, {String? fieldName}) {
    if (value == null || value.length < minLength) {
      return '${fieldName ?? 'Trường này'} phải có ít nhất $minLength ký tự';
    }
    return null;
  }

  /// Validate maximum length
  String? validateMaxLength(String? value, int maxLength, {String? fieldName}) {
    if (value != null && value.length > maxLength) {
      return '${fieldName ?? 'Trường này'} không được vượt quá $maxLength ký tự';
    }
    return null;
  }

  /// Validate exact length
  String? validateExactLength(
    String? value,
    int exactLength, {
    String? fieldName,
  }) {
    if (value != null && value.length != exactLength) {
      return '${fieldName ?? 'Trường này'} phải có đúng $exactLength ký tự';
    }
    return null;
  }

  /// Validate email format
  String? validateEmail(String? value, {String? fieldName}) {
    if (value != null && value.isNotEmpty) {
      if (!RegExp(RegexConstants.email).hasMatch(value)) {
        return '${fieldName ?? 'Email'} không đúng định dạng';
      }
    }
    return null;
  }

  /// Validate phone number
  String? validatePhone(String? value, {String? fieldName}) {
    if (value != null && value.isNotEmpty) {
      if (!RegExp(RegexConstants.phoneVietnamese).hasMatch(value)) {
        return '${fieldName ?? 'Số điện thoại'} không đúng định dạng';
      }
    }
    return null;
  }

  /// Validate password
  String? validatePassword(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'Mật khẩu'} không được để trống';
    }
    if (value.length < 8) {
      return '${fieldName ?? 'Mật khẩu'} phải có ít nhất 8 ký tự';
    }
    return null;
  }

  /// Validate password confirmation
  String? validatePasswordConfirmation(
    String? value,
    String? password, {
    String? fieldName,
  }) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'Xác nhận mật khẩu'} không được để trống';
    }
    if (value != password) {
      return '${fieldName ?? 'Xác nhận mật khẩu'} không khớp';
    }
    return null;
  }

  /// Validate numeric value
  String? validateNumeric(String? value, {String? fieldName}) {
    if (value != null && value.isNotEmpty) {
      if (double.tryParse(value) == null) {
        return '${fieldName ?? 'Trường này'} phải là số';
      }
    }
    return null;
  }

  /// Validate positive number
  String? validatePositiveNumber(String? value, {String? fieldName}) {
    final numericError = validateNumeric(value, fieldName: fieldName);
    if (numericError != null) return numericError;

    if (value != null && value.isNotEmpty) {
      final number = double.tryParse(value);
      if (number != null && number <= 0) {
        return '${fieldName ?? 'Trường này'} phải lớn hơn 0';
      }
    }
    return null;
  }

  /// Validate range
  String? validateRange(
    String? value,
    double min,
    double max, {
    String? fieldName,
  }) {
    final numericError = validateNumeric(value, fieldName: fieldName);
    if (numericError != null) return numericError;

    if (value != null && value.isNotEmpty) {
      final number = double.tryParse(value);
      if (number != null && (number < min || number > max)) {
        return '${fieldName ?? 'Trường này'} phải từ $min đến $max';
      }
    }
    return null;
  }

  // ============================================
  // Advanced Validation Methods
  // ============================================

  /// Validate Vietnamese name
  String? validateVietnameseName(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'Tên'} không được để trống';
    }
    if (!RegExp(RegexConstants.vietnameseName).hasMatch(value)) {
      return '${fieldName ?? 'Tên'} chỉ được chứa chữ cái, khoảng trắng và dấu gạch ngang';
    }
    return null;
  }

  /// Validate Vietnamese ID card
  String? validateVietnameseIdCard(String? value, {String? fieldName}) {
    if (value != null && value.isNotEmpty) {
      if (!RegExp(RegexConstants.vietnameseIdCard).hasMatch(value)) {
        return '${fieldName ?? 'CMND/CCCD'} không đúng định dạng';
      }
    }
    return null;
  }

  /// Validate URL
  String? validateUrl(String? value, {String? fieldName}) {
    if (value != null && value.isNotEmpty) {
      if (!RegExp(RegexConstants.url).hasMatch(value)) {
        return '${fieldName ?? 'URL'} không đúng định dạng';
      }
    }
    return null;
  }

  /// Validate date
  String? validateDate(String? value, {String? fieldName}) {
    if (value != null && value.isNotEmpty) {
      if (!RegExp(RegexConstants.dateDDMMYYYY).hasMatch(value)) {
        return '${fieldName ?? 'Ngày'} không đúng định dạng (dd/MM/yyyy)';
      }
    }
    return null;
  }

  /// Validate time
  String? validateTime(String? value, {String? fieldName}) {
    if (value != null && value.isNotEmpty) {
      if (!RegExp(RegexConstants.timeHHMM).hasMatch(value)) {
        return '${fieldName ?? 'Giờ'} không đúng định dạng (HH:mm)';
      }
    }
    return null;
  }

  // ============================================
  // Custom Validation Methods
  // ============================================

  /// Validate with custom function
  String? validateCustom(String? value, String? Function(String?) validator) {
    return validator(value);
  }

  /// Validate with regex pattern
  String? validatePattern(String? value, String pattern, String errorMessage) {
    if (value != null && value.isNotEmpty) {
      if (!RegExp(pattern).hasMatch(value)) {
        return errorMessage;
      }
    }
    return null;
  }

  /// Validate with regex pattern name
  String? validatePatternName(
    String? value,
    String patternName,
    String errorMessage,
  ) {
    if (value != null && value.isNotEmpty) {
      if (!RegExp(RegexConstants.getPattern(patternName)).hasMatch(value)) {
        return errorMessage;
      }
    }
    return null;
  }

  // ============================================
  // Field Validation
  // ============================================

  /// Validate field with multiple validators
  String? validateField(
    String fieldName,
    List<String? Function(String?)> validators,
  ) {
    final value = getTextValue(fieldName);

    for (final validator in validators) {
      final error = validator(value);
      if (error != null) {
        return error;
      }
    }

    return null;
  }

  /// Validate and set error for field
  bool validateAndSetError(
    String fieldName,
    List<String? Function(String?)> validators,
  ) {
    final error = validateField(fieldName, validators);
    setValidationError(fieldName, error);
    return error == null;
  }

  /// Validate all fields
  bool validateAllFields(
    Map<String, List<String? Function(String?)>> fieldValidators,
  ) {
    bool isValid = true;

    for (final entry in fieldValidators.entries) {
      final fieldName = entry.key;
      final validators = entry.value;

      if (!validateAndSetError(fieldName, validators)) {
        isValid = false;
      }
    }

    return isValid;
  }

  // ============================================
  // Form Validation
  // ============================================

  /// Validate form
  bool validateForm(
    Map<String, List<String? Function(String?)>> fieldValidators,
  ) {
    clearValidationErrors();
    return validateAllFields(fieldValidators);
  }

  /// Get form data
  Map<String, String> getFormData(List<String> fieldNames) {
    final formData = <String, String>{};

    for (final fieldName in fieldNames) {
      formData[fieldName] = getTextValue(fieldName);
    }

    return formData;
  }

  /// Set form data
  void setFormData(Map<String, String> formData) {
    for (final entry in formData.entries) {
      setTextValue(entry.key, entry.value);
    }
  }

  /// Clear form
  void clearForm(List<String> fieldNames) {
    for (final fieldName in fieldNames) {
      clearTextValue(fieldName);
    }
    clearValidationErrors();
  }

  // ============================================
  // Validation UI Helpers
  // ============================================

  /// Build text field with validation
  Widget buildValidatedTextField({
    required String fieldName,
    String? label,
    String? hint,
    TextInputType? keyboardType,
    bool obscureText = false,
    List<String? Function(String?)>? validators,
    Widget? suffixIcon,
    Widget? prefixIcon,
    int? maxLines,
    int? maxLength,
  }) {
    return TextFormField(
      controller: getController(fieldName),
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        errorText: getValidationError(fieldName),
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) {
        if (validators != null) {
          validateAndSetError(fieldName, validators);
        }
      },
    );
  }

  /// Build dropdown with validation
  Widget buildValidatedDropdown<T>({
    required String fieldName,
    required List<DropdownMenuItem<T>> items,
    String? label,
    String? hint,
    T? value,
    void Function(T?)? onChanged,
  }) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        errorText: getValidationError(fieldName),
        border: const OutlineInputBorder(),
      ),
    );
  }

  // ============================================
  // Cleanup
  // ============================================

  @override
  void dispose() {
    // Dispose all controllers
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    _controllers.clear();
    _validationErrors.clear();
    super.dispose();
  }
}
