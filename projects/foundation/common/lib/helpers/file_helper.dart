import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

/// File operations helper for FridgeMate
class FileHelper {
  FileHelper._();

  // ============================================
  // Directory Operations
  // ============================================

  /// Get application documents directory
  static Future<Directory> getDocumentsDirectory() async {
    return await getApplicationDocumentsDirectory();
  }

  /// Get application support directory
  static Future<Directory> getSupportDirectory() async {
    return await getApplicationSupportDirectory();
  }

  /// Get temporary directory
  static Future<Directory> getTemporaryDirectory() async {
    return await getTemporaryDirectory();
  }

  /// Get cache directory
  static Future<Directory> getCacheDirectory() async {
    return await getTemporaryDirectory();
  }

  /// Create directory if it doesn't exist
  static Future<Directory> createDirectoryIfNotExists(String dirPath) async {
    final directory = Directory(dirPath);
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    return directory;
  }

  /// Get or create app-specific directory
  static Future<Directory> getAppDirectory(String subPath) async {
    final documentsDir = await getDocumentsDirectory();
    final appDir = Directory(
      path.join(documentsDir.path, 'FridgeMate', subPath),
    );
    return await createDirectoryIfNotExists(appDir.path);
  }

  // ============================================
  // File Operations
  // ============================================

  /// Check if file exists
  static Future<bool> fileExists(String filePath) async {
    return await File(filePath).exists();
  }

  /// Check if directory exists
  static Future<bool> directoryExists(String dirPath) async {
    return await Directory(dirPath).exists();
  }

  /// Get file size in bytes
  static Future<int> getFileSize(String filePath) async {
    final file = File(filePath);
    if (await file.exists()) {
      return await file.length();
    }
    return 0;
  }

  /// Get file extension
  static String getFileExtension(String filePath) {
    return path.extension(filePath).toLowerCase();
  }

  /// Get file name without extension
  static String getFileNameWithoutExtension(String filePath) {
    return path.basenameWithoutExtension(filePath);
  }

  /// Get file name with extension
  static String getFileName(String filePath) {
    return path.basename(filePath);
  }

  /// Get directory path
  static String getDirectoryPath(String filePath) {
    return path.dirname(filePath);
  }

  /// Copy file
  static Future<File> copyFile(
    String sourcePath,
    String destinationPath,
  ) async {
    final sourceFile = File(sourcePath);

    // Create destination directory if it doesn't exist
    await createDirectoryIfNotExists(path.dirname(destinationPath));

    return await sourceFile.copy(destinationPath);
  }

  /// Move file
  static Future<File> moveFile(
    String sourcePath,
    String destinationPath,
  ) async {
    final sourceFile = File(sourcePath);

    // Create destination directory if it doesn't exist
    await createDirectoryIfNotExists(path.dirname(destinationPath));

    return await sourceFile.rename(destinationPath);
  }

  /// Delete file
  static Future<void> deleteFile(String filePath) async {
    final file = File(filePath);
    if (await file.exists()) {
      await file.delete();
    }
  }

  /// Delete directory and all its contents
  static Future<void> deleteDirectory(String dirPath) async {
    final directory = Directory(dirPath);
    if (await directory.exists()) {
      await directory.delete(recursive: true);
    }
  }

  // ============================================
  // File Reading & Writing
  // ============================================

  /// Read file as string
  static Future<String> readFileAsString(String filePath) async {
    final file = File(filePath);
    return await file.readAsString();
  }

  /// Read file as bytes
  static Future<Uint8List> readFileAsBytes(String filePath) async {
    final file = File(filePath);
    return await file.readAsBytes();
  }

  /// Read file as lines
  static Future<List<String>> readFileAsLines(String filePath) async {
    final file = File(filePath);
    return await file.readAsLines();
  }

  /// Write string to file
  static Future<File> writeStringToFile(String filePath, String content) async {
    final file = File(filePath);

    // Create directory if it doesn't exist
    await createDirectoryIfNotExists(path.dirname(filePath));

    return await file.writeAsString(content);
  }

  /// Write bytes to file
  static Future<File> writeBytesToFile(String filePath, Uint8List bytes) async {
    final file = File(filePath);

    // Create directory if it doesn't exist
    await createDirectoryIfNotExists(path.dirname(filePath));

    return await file.writeAsBytes(bytes);
  }

  /// Append string to file
  static Future<File> appendStringToFile(
    String filePath,
    String content,
  ) async {
    final file = File(filePath);
    return await file.writeAsString(content, mode: FileMode.append);
  }

  // ============================================
  // File Validation
  // ============================================

  /// Check if file is image
  static bool isImageFile(String filePath) {
    final extension = getFileExtension(filePath);
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

  /// Check if file is video
  static bool isVideoFile(String filePath) {
    final extension = getFileExtension(filePath);
    const videoExtensions = [
      '.mp4',
      '.avi',
      '.mov',
      '.wmv',
      '.flv',
      '.webm',
      '.mkv',
    ];
    return videoExtensions.contains(extension);
  }

  /// Check if file is audio
  static bool isAudioFile(String filePath) {
    final extension = getFileExtension(filePath);
    const audioExtensions = ['.mp3', '.wav', '.flac', '.aac', '.ogg', '.wma'];
    return audioExtensions.contains(extension);
  }

  /// Check if file is document
  static bool isDocumentFile(String filePath) {
    final extension = getFileExtension(filePath);
    const documentExtensions = [
      '.pdf',
      '.doc',
      '.docx',
      '.txt',
      '.rtf',
      '.xls',
      '.xlsx',
      '.ppt',
      '.pptx',
    ];
    return documentExtensions.contains(extension);
  }

  /// Validate file size
  static bool isValidFileSize(String filePath, int maxSizeInBytes) {
    final file = File(filePath);
    return file.existsSync() && file.lengthSync() <= maxSizeInBytes;
  }

  // ============================================
  // File Path Operations
  // ============================================

  /// Generate unique file name
  static String generateUniqueFileName(String originalPath) {
    final directory = getDirectoryPath(originalPath);
    final extension = getFileExtension(originalPath);
    final baseName = getFileNameWithoutExtension(originalPath);

    int counter = 1;
    String newPath = originalPath;

    while (File(newPath).existsSync()) {
      newPath = path.join(directory, '${baseName}_$counter$extension');
      counter++;
    }

    return newPath;
  }

  /// Sanitize file name
  static String sanitizeFileName(String fileName) {
    // Remove invalid characters
    final sanitized = fileName.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_');

    // Remove leading/trailing spaces and dots
    return sanitized.trim().replaceAll(RegExp(r'^\.+|\.+$'), '');
  }

  /// Get relative path
  static String getRelativePath(String filePath, String basePath) {
    return path.relative(filePath, from: basePath);
  }

  /// Join paths
  static String joinPaths(List<String> paths) {
    return path.joinAll(paths);
  }

  // ============================================
  // Directory Listing
  // ============================================

  /// List files in directory
  static Future<List<FileSystemEntity>> listFiles(String dirPath) async {
    final directory = Directory(dirPath);
    if (await directory.exists()) {
      return await directory.list().toList();
    }
    return [];
  }

  /// List files with specific extension
  static Future<List<File>> listFilesWithExtension(
    String dirPath,
    String extension,
  ) async {
    final entities = await listFiles(dirPath);
    final files = <File>[];

    for (final entity in entities) {
      if (entity is File && getFileExtension(entity.path) == extension) {
        files.add(entity);
      }
    }

    return files;
  }

  /// List directories
  static Future<List<Directory>> listDirectories(String dirPath) async {
    final entities = await listFiles(dirPath);
    final directories = <Directory>[];

    for (final entity in entities) {
      if (entity is Directory) {
        directories.add(entity);
      }
    }

    return directories;
  }

  // ============================================
  // File System Info
  // ============================================

  /// Get directory size
  static Future<int> getDirectorySize(String dirPath) async {
    final directory = Directory(dirPath);
    if (!await directory.exists()) return 0;

    int totalSize = 0;
    await for (final entity in directory.list(recursive: true)) {
      if (entity is File) {
        totalSize += await entity.length();
      }
    }

    return totalSize;
  }

  /// Get file count in directory
  static Future<int> getFileCount(String dirPath) async {
    final directory = Directory(dirPath);
    if (!await directory.exists()) return 0;

    int count = 0;
    await for (final entity in directory.list(recursive: true)) {
      if (entity is File) {
        count++;
      }
    }

    return count;
  }

  /// Get directory count in directory
  static Future<int> getDirectoryCount(String dirPath) async {
    final directory = Directory(dirPath);
    if (!await directory.exists()) return 0;

    int count = 0;
    await for (final entity in directory.list(recursive: true)) {
      if (entity is Directory) {
        count++;
      }
    }

    return count;
  }

  // ============================================
  // File Operations for FridgeMate
  // ============================================

  /// Get images directory
  static Future<Directory> getImagesDirectory() async {
    return await getAppDirectory('images');
  }

  /// Get documents directory
  static Future<Directory> getDocumentsAppDirectory() async {
    return await getAppDirectory('documents');
  }

  /// Get cache directory
  static Future<Directory> getCacheAppDirectory() async {
    return await getAppDirectory('cache');
  }

  /// Get backup directory
  static Future<Directory> getBackupDirectory() async {
    return await getAppDirectory('backup');
  }

  /// Get temp directory
  static Future<Directory> getTempAppDirectory() async {
    return await getAppDirectory('temp');
  }

  /// Save image file
  static Future<File> saveImageFile(
    Uint8List imageBytes,
    String fileName,
  ) async {
    final imagesDir = await getImagesDirectory();
    final filePath = path.join(imagesDir.path, sanitizeFileName(fileName));
    return await writeBytesToFile(filePath, imageBytes);
  }

  /// Save document file
  static Future<File> saveDocumentFile(String content, String fileName) async {
    final documentsDir = await getDocumentsAppDirectory();
    final filePath = path.join(documentsDir.path, sanitizeFileName(fileName));
    return await writeStringToFile(filePath, content);
  }

  /// Clean up old files
  static Future<void> cleanupOldFiles(String dirPath, Duration maxAge) async {
    final directory = Directory(dirPath);
    if (!await directory.exists()) return;

    final cutoffTime = DateTime.now().subtract(maxAge);

    await for (final entity in directory.list(recursive: true)) {
      if (entity is File) {
        final stat = await entity.stat();
        if (stat.modified.isBefore(cutoffTime)) {
          await entity.delete();
        }
      }
    }
  }

  /// Get file info
  static Future<Map<String, dynamic>> getFileInfo(String filePath) async {
    final file = File(filePath);
    if (!await file.exists()) {
      return {'exists': false, 'path': filePath};
    }

    final stat = await file.stat();
    return {
      'exists': true,
      'path': filePath,
      'size': stat.size,
      'modified': stat.modified,
      'accessed': stat.accessed,
      'type': stat.type,
      'extension': getFileExtension(filePath),
      'name': getFileName(filePath),
      'nameWithoutExtension': getFileNameWithoutExtension(filePath),
    };
  }
}
