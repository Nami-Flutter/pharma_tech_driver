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
  Future<ApiResponse> oneOrderRepo(String orderId) async {
    try {
      Response response = await dioClient.get(
          '${AppURL.kOneOrdersURI}?delegate_order_id=$orderId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> updateOrderRepo(String orderId,status) async {
    try {
      Response response = await dioClient.post(AppURL.kUpdateOrderStatusURI,data: FormData.fromMap(
          {
            "delegate_order_id":orderId,
            "status":status,
          }));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> notificationsRepo( page) async {
    try {
      Response response = await dioClient.get(
          '${AppURL.kNotificationsURI}?limit=10&page=$page');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> getNotificationsCountRepo( page) async {
    try {
      Response response = await dioClient.get(AppURL.kGetNotificationsCountURI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> deleteNotificationRepo(String id) async {
    try {
      Response response = await dioClient.post(AppURL.kDeleteNotificationsURI + id);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> deleteAllNotificationRepo() async {
    try {
      Response response = await dioClient.post(AppURL.kDeleteAllNotificationsURI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}