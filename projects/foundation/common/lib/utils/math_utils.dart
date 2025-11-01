import 'dart:math' as math;

/// Math utilities for FridgeMate
class MathUtils {
  MathUtils._();

  /// Clamp value between min and max
  static double clamp(double value, double min, double max) {
    return math.max(min, math.min(max, value));
  }

  /// Clamp integer value between min and max
  static int clampInt(int value, int min, int max) {
    return math.max(min, math.min(max, value));
  }

  /// Round to specified decimal places
  static double roundToDecimals(double value, int decimalPlaces) {
    final multiplier = math.pow(10, decimalPlaces);
    return (value * multiplier).round() / multiplier;
  }

  /// Calculate percentage
  static double calculatePercentage(double part, double total) {
    if (total == 0) return 0;
    return (part / total) * 100;
  }

  /// Calculate percentage change
  static double calculatePercentageChange(double oldValue, double newValue) {
    if (oldValue == 0) return 0;
    return ((newValue - oldValue) / oldValue) * 100;
  }

  /// Calculate average
  static double calculateAverage(List<double> values) {
    if (values.isEmpty) return 0;
    return values.reduce((a, b) => a + b) / values.length;
  }

  /// Calculate median
  static double calculateMedian(List<double> values) {
    if (values.isEmpty) return 0;
    final sorted = List<double>.from(values)..sort();
    final middle = sorted.length ~/ 2;

    if (sorted.length % 2 == 1) {
      return sorted[middle];
    } else {
      return (sorted[middle - 1] + sorted[middle]) / 2;
    }
  }

  /// Calculate standard deviation
  static double calculateStandardDeviation(List<double> values) {
    if (values.length < 2) return 0;

    final mean = calculateAverage(values);
    final variance =
        values
            .map((value) => math.pow(value - mean, 2))
            .reduce((a, b) => a + b) /
        values.length;

    return math.sqrt(variance);
  }

  /// Calculate distance between two points
  static double calculateDistance(double x1, double y1, double x2, double y2) {
    return math.sqrt(math.pow(x2 - x1, 2) + math.pow(y2 - y1, 2));
  }

  /// Calculate BMI
  static double calculateBMI(double weightKg, double heightM) {
    if (heightM == 0) return 0;
    return weightKg / math.pow(heightM, 2);
  }

  /// Calculate calories from macronutrients
  static double calculateCalories({
    required double protein,
    required double carbs,
    required double fat,
  }) {
    // Protein: 4 cal/g, Carbs: 4 cal/g, Fat: 9 cal/g
    return (protein * 4) + (carbs * 4) + (fat * 9);
  }

  /// Calculate macronutrient percentage
  static Map<String, double> calculateMacroPercentages({
    required double protein,
    required double carbs,
    required double fat,
  }) {
    final totalCalories = calculateCalories(
      protein: protein,
      carbs: carbs,
      fat: fat,
    );

    if (totalCalories == 0) {
      return {'protein': 0, 'carbs': 0, 'fat': 0};
    }

    return {
      'protein': (protein * 4 / totalCalories) * 100,
      'carbs': (carbs * 4 / totalCalories) * 100,
      'fat': (fat * 9 / totalCalories) * 100,
    };
  }

  /// Convert temperature
  static double convertTemperature(
    double value, {
    required String from,
    required String to,
  }) {
    if (from == to) return value;

    // Convert to Celsius first
    double celsius = value;
    switch (from.toUpperCase()) {
      case 'F':
        celsius = (value - 32) * 5 / 9;
        break;
      case 'K':
        celsius = value - 273.15;
        break;
    }

    // Convert from Celsius to target
    switch (to.toUpperCase()) {
      case 'C':
        return celsius;
      case 'F':
        return (celsius * 9 / 5) + 32;
      case 'K':
        return celsius + 273.15;
      default:
        return value;
    }
  }

  /// Convert weight
  static double convertWeight(
    double value, {
    required String from,
    required String to,
  }) {
    if (from == to) return value;

    // Convert to grams first
    double grams = value;
    switch (from.toLowerCase()) {
      case 'kg':
        grams = value * 1000;
        break;
      case 'lb':
        grams = value * 453.592;
        break;
      case 'oz':
        grams = value * 28.3495;
        break;
    }

    // Convert from grams to target
    switch (to.toLowerCase()) {
      case 'g':
        return grams;
      case 'kg':
        return grams / 1000;
      case 'lb':
        return grams / 453.592;
      case 'oz':
        return grams / 28.3495;
      default:
        return value;
    }
  }

  /// Convert volume
  static double convertVolume(
    double value, {
    required String from,
    required String to,
  }) {
    if (from == to) return value;

    // Convert to milliliters first
    double ml = value;
    switch (from.toLowerCase()) {
      case 'l':
        ml = value * 1000;
        break;
      case 'cup':
        ml = value * 236.588;
        break;
      case 'tbsp':
        ml = value * 14.7868;
        break;
      case 'tsp':
        ml = value * 4.92892;
        break;
    }

    // Convert from milliliters to target
    switch (to.toLowerCase()) {
      case 'ml':
        return ml;
      case 'l':
        return ml / 1000;
      case 'cup':
        return ml / 236.588;
      case 'tbsp':
        return ml / 14.7868;
      case 'tsp':
        return ml / 4.92892;
      default:
        return value;
    }
  }

  /// Generate random number between min and max
  static int randomInt(int min, int max) {
    return min + math.Random().nextInt(max - min + 1);
  }

  /// Generate random double between min and max
  static double randomDouble(double min, double max) {
    return min + math.Random().nextDouble() * (max - min);
  }

  /// Check if number is even
  static bool isEven(int number) {
    return number % 2 == 0;
  }

  /// Check if number is odd
  static bool isOdd(int number) {
    return number % 2 != 0;
  }

  /// Calculate factorial
  static int factorial(int n) {
    if (n < 0)
      throw ArgumentError('Factorial is not defined for negative numbers');
    if (n == 0 || n == 1) return 1;

    int result = 1;
    for (int i = 2; i <= n; i++) {
      result *= i;
    }
    return result;
  }

  /// Calculate greatest common divisor
  static int gcd(int a, int b) {
    while (b != 0) {
      final temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  /// Calculate least common multiple
  static int lcm(int a, int b) {
    return (a * b) ~/ gcd(a, b);
  }
}
