import 'package:dio/dio.dart';
import 'package:novel_starter/utils/config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:novel_starter/utils/utils.dart';

class ApiService {
  Dio dio;
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  ApiService() : dio = Dio(BaseOptions(
    baseUrl: Config.apiBaseUrl,
    connectTimeout: Duration(milliseconds: 5000),
    receiveTimeout: Duration(milliseconds: 3000),
  )) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // SecureStorage에서 AccessToken을 가져옵니다
        final token = await _storage.read(key: Config.secureStorageAccessTokenKey);
        if (token != null) {
          // 요청 헤더에 AccessToken을 추가
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options); // 계속 진행
      },
      onResponse: (response, handler) {
        return handler.next(response); // 응답 처리
      },
      onError: (DioException e, handler) {
        // 오류 처리
        return handler.next(e); // 오류 처리
      },
    ));
  }

  Future<Response> get(String endpoint) async {
    try {
      return await dio.get(endpoint);
    } catch (e) {
      rethrow; // 에러 처리
    }
  }

  Future<Response> post(String endpoint, dynamic data) async {
    try {
      return await dio.post(endpoint, data: data);
    } catch (e) {
      rethrow; // 에러 처리
    }
  }
}