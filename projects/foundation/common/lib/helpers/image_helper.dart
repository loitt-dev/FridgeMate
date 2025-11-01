import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

/// Image operations helper for FridgeMate
class ImageHelper {
  ImageHelper._();

  static final ImagePicker _picker = ImagePicker();

  // ============================================
  // Image Picker
  // ============================================

  /// Pick image from gallery
  static Future<XFile?> pickImageFromGallery({
    int quality = 50,
    int? maxWidth,
    int? maxHeight,
  }) async {
    try {
      return await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: quality,
        maxWidth: maxWidth?.toDouble(),
        maxHeight: maxHeight?.toDouble(),
      );
    } catch (e) {
      return null;
    }
  }

  /// Pick image from camera
  static Future<XFile?> pickImageFromCamera({
    int quality = 50,
    int? maxWidth,
    int? maxHeight,
  }) async {
    try {
      return await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: quality,
        maxWidth: maxWidth?.toDouble(),
        maxHeight: maxHeight?.toDouble(),
      );
    } catch (e) {
      return null;
    }
  }

  /// Pick multiple images from gallery
  static Future<List<XFile>> pickMultipleImages({
    int quality = 50,
    int? maxWidth,
    int? maxHeight,
    int? limit,
  }) async {
    try {
      final images = await _picker.pickMultiImage(
        imageQuality: quality,
        maxWidth: maxWidth?.toDouble(),
        maxHeight: maxHeight?.toDouble(),
        limit: limit,
      );
      return images;
    } catch (e) {
      return [];
    }
  }

  // ============================================
  // Image Processing
  // ============================================

  /// Get image file size
  static Future<int> getImageFileSize(String imagePath) async {
    final file = File(imagePath);
    if (await file.exists()) {
      return await file.length();
    }
    return 0;
  }

  /// Check if image file is valid
  static Future<bool> isValidImageFile(String imagePath) async {
    final file = File(imagePath);
    if (!await file.exists()) return false;

    // Check file extension
    final extension = path.extension(imagePath).toLowerCase();
    const validExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.webp', '.bmp'];
    if (!validExtensions.contains(extension)) return false;

    // Check file size (max 10MB)
    final fileSize = await getImageFileSize(imagePath);
    if (fileSize > 10 * 1024 * 1024) return false;

    return true;
  }

  /// Compress image file
  static Future<File?> compressImageFile(
    String imagePath, {
    int quality = 80,
    int? maxWidth,
    int? maxHeight,
  }) async {
    try {
      final file = File(imagePath);
      if (!await file.exists()) return null;

      // For now, return the original file
      // In a real implementation, you would use image compression library
      return file;
    } catch (e) {
      return null;
    }
  }

  /// Resize image file
  static Future<File?> resizeImageFile(
    String imagePath, {
    required int width,
    required int height,
  }) async {
    try {
      final file = File(imagePath);
      if (!await file.exists()) return null;

      // For now, return the original file
      // In a real implementation, you would use image resizing library
      return file;
    } catch (e) {
      return null;
    }
  }

  // ============================================
  // Image Storage
  // ============================================

  /// Save image to app directory
  static Future<File?> saveImageToAppDirectory(
    XFile imageFile, {
    String? customName,
    String subDirectory = 'images',
  }) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final imagesDir = Directory(
        path.join(appDir.path, 'FridgeMate', subDirectory),
      );

      if (!await imagesDir.exists()) {
        await imagesDir.create(recursive: true);
      }

      final fileName = customName ?? path.basename(imageFile.path);
      final sanitizedFileName = _sanitizeFileName(fileName);
      final filePath = path.join(imagesDir.path, sanitizedFileName);

      final file = File(filePath);
      await file.writeAsBytes(await imageFile.readAsBytes());

      return file;
    } catch (e) {
      return null;
    }
  }

  /// Save image bytes to app directory
  static Future<File?> saveImageBytesToAppDirectory(
    Uint8List imageBytes, {
    required String fileName,
    String subDirectory = 'images',
  }) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final imagesDir = Directory(
        path.join(appDir.path, 'FridgeMate', subDirectory),
      );

      if (!await imagesDir.exists()) {
        await imagesDir.create(recursive: true);
      }

      final sanitizedFileName = _sanitizeFileName(fileName);
      final filePath = path.join(imagesDir.path, sanitizedFileName);

      final file = File(filePath);
      await file.writeAsBytes(imageBytes);

      return file;
    } catch (e) {
      return null;
    }
  }

  /// Get image from app directory
  static Future<File?> getImageFromAppDirectory(
    String fileName, {
    String subDirectory = 'images',
  }) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final filePath = path.join(
        appDir.path,
        'FridgeMate',
        subDirectory,
        fileName,
      );
      final file = File(filePath);

      if (await file.exists()) {
        return file;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Delete image from app directory
  static Future<bool> deleteImageFromAppDirectory(
    String fileName, {
    String subDirectory = 'images',
  }) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final filePath = path.join(
        appDir.path,
        'FridgeMate',
        subDirectory,
        fileName,
      );
      final file = File(filePath);

      if (await file.exists()) {
        await file.delete();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // ============================================
  // Image Lists
  // ============================================

  /// Get all images from app directory
  static Future<List<File>> getAllImagesFromAppDirectory({
    String subDirectory = 'images',
  }) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final imagesDir = Directory(
        path.join(appDir.path, 'FridgeMate', subDirectory),
      );

      if (!await imagesDir.exists()) {
        return [];
      }

      final files = await imagesDir.list().toList();
      final imageFiles = <File>[];

      for (final file in files) {
        if (file is File && _isImageFile(file.path)) {
          imageFiles.add(file);
        }
      }

      return imageFiles;
    } catch (e) {
      return [];
    }
  }

  /// Get image count in app directory
  static Future<int> getImageCountInAppDirectory({
    String subDirectory = 'images',
  }) async {
    final images = await getAllImagesFromAppDirectory(
      subDirectory: subDirectory,
    );
    return images.length;
  }

  // ============================================
  // Image Utilities
  // ============================================

  /// Generate unique image file name
  static String generateUniqueImageFileName(String originalName) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final extension = path.extension(originalName);
    final nameWithoutExtension = path.basenameWithoutExtension(originalName);

    return '${nameWithoutExtension}_$timestamp$extension';
  }

  /// Get image file extension
  static String getImageFileExtension(String imagePath) {
    return path.extension(imagePath).toLowerCase();
  }

  /// Check if file is image
  static bool _isImageFile(String filePath) {
    final extension = getImageFileExtension(filePath);
    const imageExtensions = [
      '.jpg',
      '.jpeg',
      '.png',
      '.gif',
      '.webp',
      '.bmp',
      '.svg',
    ];
    return imageExtensions.contains(extension);
  }

  /// Sanitize file name
  static String _sanitizeFileName(String fileName) {
    // Remove invalid characters
    final sanitized = fileName.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_');

    // Remove leading/trailing spaces and dots
    return sanitized.trim().replaceAll(RegExp(r'^\.+|\.+$'), '');
  }

  // ============================================
  // Image Cache
  // ============================================

  /// Clear image cache
  static Future<void> clearImageCache() async {
    try {
      final tempDir = await getTemporaryDirectory();
      final cacheDir = Directory(path.join(tempDir.path, 'image_cache'));

      if (await cacheDir.exists()) {
        await cacheDir.delete(recursive: true);
      }
    } catch (e) {
      // Handle error silently
    }
  }

  /// Get image cache size
  static Future<int> getImageCacheSize() async {
    try {
      final tempDir = await getTemporaryDirectory();
      final cacheDir = Directory(path.join(tempDir.path, 'image_cache'));

      if (!await cacheDir.exists()) {
        return 0;
      }

      int totalSize = 0;
      await for (final entity in cacheDir.list(recursive: true)) {
        if (entity is File) {
          totalSize += await entity.length();
        }
      }

      return totalSize;
    } catch (e) {
      return 0;
    }
  }

  // ============================================
  // Image Validation
  // ============================================

  /// Validate image file
  static Future<Map<String, dynamic>> validateImageFile(
    String imagePath,
  ) async {
    final result = <String, dynamic>{
      'isValid': false,
      'errors': <String>[],
      'fileSize': 0,
      'extension': '',
      'path': imagePath,
    };

    try {
      final file = File(imagePath);

      // Check if file exists
      if (!await file.exists()) {
        result['errors'].add('File không tồn tại');
        return result;
      }

      // Check file size
      final fileSize = await file.length();
      result['fileSize'] = fileSize;

      if (fileSize > 10 * 1024 * 1024) {
        // 10MB
        result['errors'].add('File quá lớn (tối đa 10MB)');
      }

      if (fileSize == 0) {
        result['errors'].add('File rỗng');
      }

      // Check file extension
      final extension = getImageFileExtension(imagePath);
      result['extension'] = extension;

      const validExtensions = [
        '.jpg',
        '.jpeg',
        '.png',
        '.gif',
        '.webp',
        '.bmp',
      ];
      if (!validExtensions.contains(extension)) {
        result['errors'].add('Định dạng file không được hỗ trợ');
      }

      // If no errors, file is valid
      if (result['errors'].isEmpty) {
        result['isValid'] = true;
      }
    } catch (e) {
      result['errors'].add('Lỗi khi kiểm tra file: ${e.toString()}');
    }

    return result;
  }

  // ============================================
  // Image for FridgeMate
  // ============================================

  /// Save food image
  static Future<File?> saveFoodImage(
    XFile imageFile, {
    String? customName,
  }) async {
    return await saveImageToAppDirectory(
      imageFile,
      customName: customName,
      subDirectory: 'food_images',
    );
  }

  /// Save medicine image
  static Future<File?> saveMedicineImage(
    XFile imageFile, {
    String? customName,
  }) async {
    return await saveImageToAppDirectory(
      imageFile,
      customName: customName,
      subDirectory: 'medicine_images',
    );
  }

  /// Save recipe image
  static Future<File?> saveRecipeImage(
    XFile imageFile, {
    String? customName,
  }) async {
    return await saveImageToAppDirectory(
      imageFile,
      customName: customName,
      subDirectory: 'recipe_images',
    );
  }

  /// Save profile image
  static Future<File?> saveProfileImage(
    XFile imageFile, {
    String? customName,
  }) async {
    return await saveImageToAppDirectory(
      imageFile,
      customName: customName,
      subDirectory: 'profile_images',
    );
  }

  /// Get food images
  static Future<List<File>> getFoodImages() async {
    return await getAllImagesFromAppDirectory(subDirectory: 'food_images');
  }

  /// Get medicine images
  static Future<List<File>> getMedicineImages() async {
    return await getAllImagesFromAppDirectory(subDirectory: 'medicine_images');
  }

  /// Get recipe images
  static Future<List<File>> getRecipeImages() async {
    return await getAllImagesFromAppDirectory(subDirectory: 'recipe_images');
  }

  /// Get profile images
  static Future<List<File>> getProfileImages() async {
    return await getAllImagesFromAppDirectory(subDirectory: 'profile_images');
  }
}
