import 'package:dio/dio.dart';

import '../../../model/response/base/error_response.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              errorDescription = "تم إلغاء الطلب إلى الإنترنت";
              break;
            case DioExceptionType.connectionTimeout:
            case DioExceptionType.badCertificate:
            case DioExceptionType.connectionError:
              errorDescription = "انتهت مهلة الاتصال بالإنترنت";
              break;
            case DioExceptionType.unknown:
              errorDescription = "فشل الاتصال بالإنترنت";
              break;
            case DioExceptionType.receiveTimeout:
              errorDescription = "تم انتهاء مدة الاتصال برجاء إعادة المحاولة";
              break;
            case DioExceptionType.badResponse:
              if (error.response == null || error.response?.statusCode == null) {
                errorDescription = "خطأ في الاستجابة من الخادم";
                break;
              }
              switch (error.response!.statusCode) {
                case 404:
                case 500:
                case 503:
                  errorDescription = "برجاء التأكد من الاتصال بالإنترنت";
                  break;
                case 422:
                  try {
                    final error422Response = Error422Response.fromJson(error.response!.data);
                    errorDescription = error422Response.data?.isNotEmpty ?? false
                        ? error422Response.data.toString()
                        : "فشل في معالجة الخطأ - رمز الحالة: ${error.response!.statusCode}";
                  } catch (e) {
                    errorDescription = "فشل في معالجة الخطأ - رمز الحالة: ${error.response!.statusCode}";
                  }
                  break;
                default:
                  try {
                    final errorResponse = ErrorResponse.fromJson(error.response!.data);
                    errorDescription = (errorResponse.errors?.isNotEmpty ?? false)
                        ? errorResponse.errors!.join(", ")
                        : "فشل في تحميل البيانات - رمز الحالة: ${error.response!.statusCode}";
                  } catch (e) {
                    errorDescription = "فشل في تحميل البيانات - رمز الحالة: ${error.response!.statusCode}";
                  }
              }
              break;
            case DioExceptionType.sendTimeout:
              errorDescription = "تم انتهاء مدة الإرسال برجاء إعادة المحاولة";
              break;


              throw UnimplementedError();
          }
        } else {
          errorDescription = "حدث خطأ غير متوقع";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "ليس خطأ من نوع استثناء";
    }
    return errorDescription;
  }
}