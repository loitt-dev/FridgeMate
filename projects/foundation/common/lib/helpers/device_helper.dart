import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

/// Device information helper for FridgeMate
class DeviceHelper {
  DeviceHelper._();

  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  // ============================================
  // Device Information
  // ============================================

  /// Get device information
  static Future<Map<String, dynamic>> getDeviceInfo() async {
    try {
      if (Platform.isAndroid) {
        return await _getAndroidDeviceInfo();
      } else if (Platform.isIOS) {
        return await _getIOSDeviceInfo();
      } else if (Platform.isWindows) {
        return await _getWindowsDeviceInfo();
      } else if (Platform.isMacOS) {
        return await _getMacOSDeviceInfo();
      } else if (Platform.isLinux) {
        return await _getLinuxDeviceInfo();
      } else {
        return {'platform': 'unknown', 'error': 'Unsupported platform'};
      }
    } catch (e) {
      return {'platform': 'unknown', 'error': e.toString()};
    }
  }

  /// Get Android device info
  static Future<Map<String, dynamic>> _getAndroidDeviceInfo() async {
    final androidInfo = await _deviceInfo.androidInfo;

    return {
      'platform': 'android',
      'model': androidInfo.model,
      'brand': androidInfo.brand,
      'manufacturer': androidInfo.manufacturer,
      'device': androidInfo.device,
      'product': androidInfo.product,
      'hardware': androidInfo.hardware,
      'androidId': androidInfo.id,
      'version': {
        'release': androidInfo.version.release,
        'sdkInt': androidInfo.version.sdkInt,
        'codename': androidInfo.version.codename,
        'incremental': androidInfo.version.incremental,
      },
      'board': androidInfo.board,
      'bootloader': androidInfo.bootloader,
      'display': androidInfo.display,
      'fingerprint': androidInfo.fingerprint,
      'host': androidInfo.host,
      'tags': androidInfo.tags,
      'type': androidInfo.type,
      'isPhysicalDevice': androidInfo.isPhysicalDevice,
      'systemFeatures': androidInfo.systemFeatures,
    };
  }

  /// Get iOS device info
  static Future<Map<String, dynamic>> _getIOSDeviceInfo() async {
    final iosInfo = await _deviceInfo.iosInfo;

    return {
      'platform': 'ios',
      'name': iosInfo.name,
      'systemName': iosInfo.systemName,
      'systemVersion': iosInfo.systemVersion,
      'model': iosInfo.model,
      'localizedModel': iosInfo.localizedModel,
      'identifierForVendor': iosInfo.identifierForVendor,
      'isPhysicalDevice': iosInfo.isPhysicalDevice,
      'utsname': {
        'sysname': iosInfo.utsname.sysname,
        'nodename': iosInfo.utsname.nodename,
        'release': iosInfo.utsname.release,
        'version': iosInfo.utsname.version,
        'machine': iosInfo.utsname.machine,
      },
    };
  }

  /// Get Windows device info
  static Future<Map<String, dynamic>> _getWindowsDeviceInfo() async {
    final windowsInfo = await _deviceInfo.windowsInfo;

    return {
      'platform': 'windows',
      'numberOfCores': windowsInfo.numberOfCores,
      'computerName': windowsInfo.computerName,
      'systemMemoryInMegabytes': windowsInfo.systemMemoryInMegabytes,
      'userName': windowsInfo.userName,
      'majorVersion': windowsInfo.majorVersion,
      'minorVersion': windowsInfo.minorVersion,
      'buildNumber': windowsInfo.buildNumber,
      'platformId': windowsInfo.platformId,
      'csdVersion': windowsInfo.csdVersion,
      'servicePackMajor': windowsInfo.servicePackMajor,
      'servicePackMinor': windowsInfo.servicePackMinor,
      'suitMask': windowsInfo.suitMask,
      'productType': windowsInfo.productType,
      'reserved': windowsInfo.reserved,
      'buildLab': windowsInfo.buildLab,
      'buildLabEx': windowsInfo.buildLabEx,
      'digitalProductId': windowsInfo.digitalProductId,
      'displayVersion': windowsInfo.displayVersion,
      'editionId': windowsInfo.editionId,
      'installDateFromRegistry': windowsInfo.installDate,
      'productId': windowsInfo.productId,
      'productName': windowsInfo.productName,
      'registeredOwner': windowsInfo.registeredOwner,
      'releaseId': windowsInfo.releaseId,
      'deviceId': windowsInfo.deviceId,
    };
  }

  /// Get macOS device info
  static Future<Map<String, dynamic>> _getMacOSDeviceInfo() async {
    final macosInfo = await _deviceInfo.macOsInfo;

    return {
      'platform': 'macos',
      'computerName': macosInfo.computerName,
      'hostName': macosInfo.hostName,
      'arch': macosInfo.arch,
      'model': macosInfo.model,
      'kernelVersion': macosInfo.kernelVersion,
      'majorVersion': macosInfo.majorVersion,
      'minorVersion': macosInfo.minorVersion,
      'patchVersion': macosInfo.patchVersion,
      'osRelease': macosInfo.osRelease,
      'activeCPUs': macosInfo.activeCPUs,
      'memorySize': macosInfo.memorySize,
      'cpuFrequency': macosInfo.cpuFrequency,
      'systemGUID': macosInfo.systemGUID,
    };
  }

  /// Get Linux device info
  static Future<Map<String, dynamic>> _getLinuxDeviceInfo() async {
    final linuxInfo = await _deviceInfo.linuxInfo;

    return {
      'platform': 'linux',
      'name': linuxInfo.name,
      'version': linuxInfo.version,
      'id': linuxInfo.id,
      'idLike': linuxInfo.idLike,
      'versionCodename': linuxInfo.versionCodename,
      'versionId': linuxInfo.versionId,
      'prettyName': linuxInfo.prettyName,
      'buildId': linuxInfo.buildId,
      'variant': linuxInfo.variant,
      'variantId': linuxInfo.variantId,
      'machineId': linuxInfo.machineId,
    };
  }

  // ============================================
  // Platform Detection
  // ============================================

  /// Check if running on Android
  static bool get isAndroid => Platform.isAndroid;

  /// Check if running on iOS
  static bool get isIOS => Platform.isIOS;

  /// Check if running on Windows
  static bool get isWindows => Platform.isWindows;

  /// Check if running on macOS
  static bool get isMacOS => Platform.isMacOS;

  /// Check if running on Linux
  static bool get isLinux => Platform.isLinux;

  /// Check if running on mobile
  static bool get isMobile => Platform.isAndroid || Platform.isIOS;

  /// Check if running on desktop
  static bool get isDesktop =>
      Platform.isWindows || Platform.isMacOS || Platform.isLinux;

  /// Check if running on web
  static bool get isWeb =>
      Platform.isWindows && Platform.environment.containsKey('FLUTTER_WEB');

  // ============================================
  // Device Capabilities
  // ============================================

  /// Check if device has camera
  static Future<bool> hasCamera() async {
    try {
      // This would require camera plugin
      // For now, return true for mobile devices
      return isMobile;
    } catch (e) {
      return false;
    }
  }

  /// Check if device has GPS
  static Future<bool> hasGPS() async {
    try {
      // This would require location plugin
      // For now, return true for mobile devices
      return isMobile;
    } catch (e) {
      return false;
    }
  }

  /// Check if device has internet connection
  static Future<bool> hasInternetConnection() async {
    try {
      // This would require connectivity plugin
      // For now, return true
      return true;
    } catch (e) {
      return false;
    }
  }

  // ============================================
  // Device Performance
  // ============================================

  /// Get device performance level
  static Future<String> getDevicePerformanceLevel() async {
    try {
      final deviceInfo = await getDeviceInfo();

      if (isMobile) {
        return _getMobilePerformanceLevel(deviceInfo);
      } else if (isDesktop) {
        return _getDesktopPerformanceLevel(deviceInfo);
      } else {
        return 'unknown';
      }
    } catch (e) {
      return 'unknown';
    }
  }

  /// Get mobile performance level
  static String _getMobilePerformanceLevel(Map<String, dynamic> deviceInfo) {
    if (isAndroid) {
      final sdkInt = deviceInfo['version']?['sdkInt'] ?? 0;
      if (sdkInt >= 30) return 'high';
      if (sdkInt >= 23) return 'medium';
      return 'low';
    } else if (isIOS) {
      final systemVersion = deviceInfo['systemVersion'] ?? '';
      final version = double.tryParse(systemVersion.split('.').first) ?? 0;
      if (version >= 15) return 'high';
      if (version >= 12) return 'medium';
      return 'low';
    }
    return 'unknown';
  }

  /// Get desktop performance level
  static String _getDesktopPerformanceLevel(Map<String, dynamic> deviceInfo) {
    if (isWindows) {
      final memory = deviceInfo['systemMemoryInMegabytes'] ?? 0;
      if (memory >= 8192) return 'high';
      if (memory >= 4096) return 'medium';
      return 'low';
    } else if (isMacOS) {
      final memory = deviceInfo['memorySize'] ?? 0;
      if (memory >= 8192) return 'high';
      if (memory >= 4096) return 'medium';
      return 'low';
    }
    return 'unknown';
  }

  // ============================================
  // Device Utilities
  // ============================================

  /// Get device identifier
  static Future<String> getDeviceIdentifier() async {
    try {
      final deviceInfo = await getDeviceInfo();

      if (isAndroid) {
        return deviceInfo['androidId'] ?? 'unknown_android';
      } else if (isIOS) {
        return deviceInfo['identifierForVendor'] ?? 'unknown_ios';
      } else if (isWindows) {
        return deviceInfo['deviceId'] ?? 'unknown_windows';
      } else if (isMacOS) {
        return deviceInfo['systemGUID'] ?? 'unknown_macos';
      } else if (isLinux) {
        return deviceInfo['machineId'] ?? 'unknown_linux';
      } else {
        return 'unknown_device';
      }
    } catch (e) {
      return 'error_device';
    }
  }

  /// Get device model
  static Future<String> getDeviceModel() async {
    try {
      final deviceInfo = await getDeviceInfo();

      if (isAndroid) {
        return '${deviceInfo['brand']} ${deviceInfo['model']}';
      } else if (isIOS) {
        return deviceInfo['model'] ?? 'Unknown iOS Device';
      } else if (isWindows) {
        return deviceInfo['computerName'] ?? 'Unknown Windows Device';
      } else if (isMacOS) {
        return deviceInfo['model'] ?? 'Unknown macOS Device';
      } else if (isLinux) {
        return deviceInfo['name'] ?? 'Unknown Linux Device';
      } else {
        return 'Unknown Device';
      }
    } catch (e) {
      return 'Unknown Device';
    }
  }

  /// Get OS version
  static Future<String> getOSVersion() async {
    try {
      final deviceInfo = await getDeviceInfo();

      if (isAndroid) {
        return deviceInfo['version']?['release'] ?? 'Unknown';
      } else if (isIOS) {
        return deviceInfo['systemVersion'] ?? 'Unknown';
      } else if (isWindows) {
        return '${deviceInfo['majorVersion']}.${deviceInfo['minorVersion']}';
      } else if (isMacOS) {
        return '${deviceInfo['majorVersion']}.${deviceInfo['minorVersion']}.${deviceInfo['patchVersion']}';
      } else if (isLinux) {
        return deviceInfo['version'] ?? 'Unknown';
      } else {
        return 'Unknown';
      }
    } catch (e) {
      return 'Unknown';
    }
  }

  /// Get device summary
  static Future<Map<String, String>> getDeviceSummary() async {
    try {
      final deviceInfo = await getDeviceInfo();
      final performanceLevel = await getDevicePerformanceLevel();

      return {
        'platform': deviceInfo['platform'] ?? 'unknown',
        'model': await getDeviceModel(),
        'osVersion': await getOSVersion(),
        'identifier': await getDeviceIdentifier(),
        'performance': performanceLevel,
        'isPhysicalDevice':
            deviceInfo['isPhysicalDevice']?.toString() ?? 'unknown',
      };
    } catch (e) {
      return {
        'platform': 'unknown',
        'model': 'Unknown Device',
        'osVersion': 'Unknown',
        'identifier': 'error_device',
        'performance': 'unknown',
        'isPhysicalDevice': 'unknown',
      };
    }
  }

  // ============================================
  // Device for FridgeMate
  // ============================================

  /// Check if device supports barcode scanning
  static Future<bool> supportsBarcodeScanning() async {
    return await hasCamera();
  }

  /// Check if device supports image recognition
  static Future<bool> supportsImageRecognition() async {
    return await hasCamera();
  }

  /// Check if device supports location services
  static Future<bool> supportsLocationServices() async {
    return await hasGPS();
  }

  /// Get recommended image quality for device
  static Future<int> getRecommendedImageQuality() async {
    final performanceLevel = await getDevicePerformanceLevel();

    switch (performanceLevel) {
      case 'high':
        return 90;
      case 'medium':
        return 75;
      case 'low':
        return 50;
      case 'unknown':
        return 75;
      default:
        return 75;
    }
  }

  /// Get recommended cache size for device
  static Future<int> getRecommendedCacheSize() async {
    final performanceLevel = await getDevicePerformanceLevel();

    switch (performanceLevel) {
      case 'high':
        return 100 * 1024 * 1024; // 100MB
      case 'medium':
        return 50 * 1024 * 1024; // 50MB
      case 'low':
        return 25 * 1024 * 1024; // 25MB
      case 'unknown':
        return 50 * 1024 * 1024; // 50MB
      default:
        return 50 * 1024 * 1024; // 50MB
    }
  }

  /// Check if device is suitable for offline mode
  static Future<bool> isSuitableForOfflineMode() async {
    final performanceLevel = await getDevicePerformanceLevel();
    return performanceLevel != 'low';
  }
}
