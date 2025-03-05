import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/clients/api_client.dart';
import 'package:novel_starter/utils/config.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(Config.apiBaseUrl);
});