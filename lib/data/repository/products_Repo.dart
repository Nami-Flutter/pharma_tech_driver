import 'package:dio/dio.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class ProductsRepo {
  final DioClient dioClient;

  ProductsRepo({required this.dioClient});

  Future<ApiResponse> productItemRepo(String? title , categoryId, subCategoryId,int page,String? filterByPrice,String? filterByAlphabetical) async {
    try {
      Response response = await dioClient.get('${AppURL.kProductsURI}?title=${title}&category_id=${categoryId}&sub_category_id=${subCategoryId}&page=${page}&price=${filterByPrice}&alphabetical=${filterByAlphabetical}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> isFavoriteRepo(productId) async {
    try {
      Response response = await dioClient.post(AppURL.kIsFavoriteURI,
          data: FormData.fromMap({
            "product_id" : productId,
          }));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}