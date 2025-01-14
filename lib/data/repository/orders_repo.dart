import 'package:dio/dio.dart';
import 'dart:io';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/body/LoginBody.dart';
import '../model/body/orders_body.dart';
import '../model/body/register_body.dart';
import '../model/body/calculate_order_cost_body.dart';
import '../model/response/base/api_response.dart';
import 'SaveUserData.dart';

class OrdersRepo {
  final DioClient dioClient;
  final SaveUserData saveUserData;
  OrdersRepo({required this.dioClient, required this.saveUserData});

  Future<ApiResponse>calculateOrderCostRepo(CalculateOrderCost calculateOrderCost) async {
    try {
      Response response = await dioClient.post(
        AppURL.kCalculateOrderCost,
        data: calculateOrderCost.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse>ordersRepo(OrdersBody ordersBody) async {
    try {
      Response response = await dioClient.post(
        AppURL.kOrders,
        data: ordersBody.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse>paymentRepo(int orderId) async {
    try {
      Response response = await dioClient.get("${AppURL.kPayment}${orderId}");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
