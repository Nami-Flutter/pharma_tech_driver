import 'package:dio/dio.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/body/contactUsBody.dart';
import '../model/response/base/api_response.dart';

class SettingRepo {
  final DioClient dioClient;

  SettingRepo({required this.dioClient});


  Future<ApiResponse> myFavoriteProductRepo() async {
    try {
      Response response =
          await dioClient.get(AppURL.kMyFavoriteURI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> settingRepo() async {
    try {
      Response response =
          await dioClient.get(AppURL.kSettingURI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> pointsRepo() async {
    try {
      Response response =
          await dioClient.get(AppURL.kPointsURI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> contactUs(ContactUsBody contactUsBody) async {
    try {
      Response response = await dioClient.post(AppURL.kContactUsURL,data: contactUsBody.toJson(),);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}


