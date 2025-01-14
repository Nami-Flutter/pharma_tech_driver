import 'dart:io';
import 'package:dio/dio.dart';
import '../../injection.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class SettingRepository {
  DioClient dioClient =getIt();
  Future<ApiResponse> getRoomMsgRepo(String endPointURL) async {
    try {
      Response response = await dioClient.get('AppURL.getRoomMsgURL+endPointURL');

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> payRepo(String endPointURL,String id,String? price) async {
    print(";lllll");
    print(";lllll${price}");
    print(";lllll${id}");
    try {
      Response response = await dioClient.get('AppURL.getPayURL+endPointURL',
     queryParameters: {
        if(id.isNotEmpty)...{
        "post_id":id
      } ,
        if(price!=null&&price.isNotEmpty)...{
        "application_ratio":price
      }
      }
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> sendMessageRepo (String? type,String? message, List<File>? image,) async {
    try {
      List<MultipartFile> imagesPart = [];
      if(image!=null){
        for (File file in image) {
          imagesPart.add(await MultipartFile.fromFile(file.path));
        }
      }
      // print('jkljkl${imagesPart.length}+${message}'+'${type}');
       //print('jkljkl${imagesPart.last.filename}'+'${type}');
       // print('jkljkl${}');
       // print('jkljkl${type}');
      Response response = await dioClient.post(
       ' AppURL.sendChatMessageURL',
        // formData: FormData.fromMap({
        //   "type": type,
        //   "message": message,
        //   if(image!=null)...{
        //   "files[]":imagesPart}
        // }),
      );
     // print("ldldldluuuu"+response.statusCode.toString()+"jjjjjjj");
      return ApiResponse.withSuccess(response);
    } catch (e) {
     // print("ldldldluuuu"+e.toString());

      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> settingRepo() async {
    try {
      Response response = await dioClient.get(
          'AppURL.kSettingURL'
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  // Future<ApiResponse> expensesTypesRepo() async {
  //   try {
  //     Response response = await dioClient.get(
  //         AppURL.kExpensesTypesURL
  //     );
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.handleError(e));
  //   }
  // }
  // Future<ApiResponse> appColorsRepo() async {
  //   try {
  //     Response response = await dioClient.get(
  //         AppURL.kAppColorsURL
  //     );
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.handleError(e));
  //   }
  // }
  // Future<ApiResponse> colorsRepo() async {
  //   try {
  //     Response response = await dioClient.get(
  //         AppURL.kUserColorsURL
  //     );
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.handleError(e));
  //   }
  // }
  // Future<ApiResponse> instructionRepo() async {
  //   try {
  //     Response response = await dioClient.get(
  //         AppURL.kUserInstructionURL
  //     );
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.handleError(e));
  //   }
  // }
}
