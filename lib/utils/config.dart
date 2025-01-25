import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get apiBaseUrl {
    return dotenv.env['BASE_URL'] ?? 'https://default.example.com';
  }

  static String get apiTestUrl {
    return dotenv.env['TEST_URL'] ?? 'https://default.example.com';
  }

  static String get secureStorageAccessTokenKey {
    return dotenv.env['SECURE_STORAGE_AT_KEY'] ?? 'key';
  }
}