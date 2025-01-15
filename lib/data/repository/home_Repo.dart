import 'package:dio/dio.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class HomeRepo {
  final DioClient dioClient;

  HomeRepo({required this.dioClient});

  Future<ApiResponse> orderHomeRepo(String status,page) async {
    try {
      Response response = await dioClient.get(
          (status=='new')?'${AppURL.kOrdersURI}?status[0]=$status&limit=10&page=$page':
          '${AppURL.kOrdersURI}?status[1]=$status&limit=10&page=$page');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}