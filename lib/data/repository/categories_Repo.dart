import 'package:dio/dio.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class CategoriesRepo {
  final DioClient dioClient;

  CategoriesRepo({required this.dioClient});

  Future<ApiResponse> categoriesRepo() async {
    try {
      Response response = await dioClient.get(AppURL.kCategoriesURI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}