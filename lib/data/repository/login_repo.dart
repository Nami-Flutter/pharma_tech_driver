// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import '../app_urls/app_url.dart';
// import '../datasource/remote/dio/dio_client.dart';
// import '../datasource/remote/exception/api_error_handler.dart';
// import '../model/body/LoginBody.dart';
// import '../model/response/base/api_response.dart';
// import 'SaveUserData.dart';
//
// class AuthRepo {
//   final DioClient dioClient;
//   final SaveUserData saveUserData;
//   AuthRepo({required this.dioClient, required this.saveUserData});
//
//   Future<ApiResponse> login(LoginBody loginBody) async {
//     try {
//       Response response = await dioClient.post(
//         AppURL.kLoginURI,
//         data: loginBody.toJson(),
//       );
//       saveUserData.userData(response);
//       print('${saveUserData.getUserData().isEmpty}');
//       return ApiResponse.withSuccess(response);
//     } catch (e) {
//       return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//     }
//   }
//   // Future<ApiResponse> registerRepo(RegisterBody registerBody) async {
//   //   try {
//   //     Response response = await dioClient.post(
//   //       AppURL.kRegisterURI,
//   //       data: FormData.fromMap({
//   //         "name": registerBody.name,
//   //         "email": registerBody.email,
//   //         "logo":  registerBody.logoImage == null ? null : await MultipartFile.fromFile(registerBody.logoImage!.path),
//   //         "password":  registerBody.password,
//   //         "city_id":  registerBody.cityId,
//   //         "neighbor_id":  registerBody.neighborId,
//   //         // "google_place_id": registerBody.googlePlaceId,
//   //         "google_place_id": "hghg6678bh8gb7t676",
//   //         "phone_code": "+966",
//   //         "phone": registerBody.phone,
//   //         "address": registerBody.address,
//   //         "latitude": registerBody.latitude,
//   //         "longitude":  registerBody.longitude,
//   //         "department_id":  registerBody.departmentId,
//   //         "commercial_register": registerBody.commercialRegisterImage == null ? null : await MultipartFile.fromFile(registerBody.commercialRegisterImage!.path),
//   //         "tax_number": registerBody.taxNumber,
//   //         "banner": registerBody.backgroundImage == null ? null : await MultipartFile.fromFile(registerBody.backgroundImage!.path)
//   //
//   //       }),
//   //     );
//   //     return ApiResponse.withSuccess(response);
//   //   } catch (e) {
//   //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   //   }
//   // }
//
//   // Future<ApiResponse> updateFCMToken({required String fcmToken}) async {
//   //   try {
//   //     TargetPlatform deviceType = getDeviceType();/// for software_type
//   //     Response response = await dioClient.post(AppURL.kUpdateFCMTokenURI,
//   //         queryParameters: {
//   //           'phone_token':fcmToken,
//   //           'software_type':deviceType.name,
//   //           "user_id" : saveUserData.getUserId()});
//   //     return ApiResponse.withSuccess(response);
//   //   } catch (e) {
//   //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   //   }
//   // }
//   // TargetPlatform getDeviceType() {/// for software_type
//   //   return defaultTargetPlatform;
//   // }
//
//   // Future<ApiResponse> departmentsRepo() async {
//   //   try {
//   //     Response response = await dioClient.get(AppURL.kDeparmentsURI);
//   //     return ApiResponse.withSuccess(response);
//   //   } catch (e) {
//   //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   //   }
//   // }
//
//   // Future<ApiResponse> cityRepo() async {
//   //   try {
//   //     Response response = await dioClient.get(AppURL.cityURL);
//   //     return ApiResponse.withSuccess(response);
//   //   } catch (e) {
//   //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   //   }
//   // }
//   //
//   // Future<ApiResponse> districtRepo(String cityId) async {
//   //   try {
//   //     Response response = await dioClient.get(AppURL.districtURL + cityId);
//   //     return ApiResponse.withSuccess(response);
//   //   } catch (e) {
//   //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   //   }
//   // }
//
//
//
//
//
//
// //  Future<ApiResponse> providerProfile() async {
// //    try {
// //      Response response = await dioClient.get(AppURL.kProvidersProfileURI+getUserId(),);
// //      return ApiResponse.withSuccess(response);
// //    } catch (e) {
// //      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
// //    }
// //  }
// //
//
// //
// // Future<ApiResponse> sendCodeRepo (RestPasswordBody restPasswordBody) async {
// //   try {
// //     Response response = await dioClient.post(
// //       AppURL.kRestPassURI,
// //       data: restPasswordBody.toJson(),
// //     );
// //     return ApiResponse.withSuccess(response);
// //   } catch (e) {
// //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
// //   }
// // }
//
//
// // Future<ApiResponse> checkCodeRepo (RestPasswordBody restPasswordBody) async {
// //   try {
// //     Response response = await dioClient.post(
// //       AppURL.kPincodeURI,
// //       data: restPasswordBody.toJson(),
// //     );
// //     return ApiResponse.withSuccess(response);
// //   } catch (e) {
// //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
// //   }
// // }
// // Future<ApiResponse> NewPassRepo (RestPasswordBody restPasswordBody) async {
// //   try {
// //     Response response = await dioClient.post(
// //       AppURL.kNewPassURI,
// //       data: restPasswordBody.toJson(),
// //     );
// //     return ApiResponse.withSuccess(response);
// //   } catch (e) {
// //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
// //   }
// // }
// // Future<ApiResponse> updateLocationRepo (UpdateLocationBody updateLocationBody) async {
// //   try {
// //     Response response = await dioClient.post(
// //       AppURL.kUpdateLocationURI,
// //       data: updateLocationBody.toJson(),
// //     );
// //     return ApiResponse.withSuccess(response);
// //   } catch (e) {
// //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
// //   }
// // }
// }
