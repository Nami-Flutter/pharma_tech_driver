import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/data/repository/Setting_Repo.dart';
import '../../../../../core/api_checker.dart';
import '../../../../../data/model/response/base/api_response.dart';
import '../../../../../data/repository/SaveUserData.dart';
import '../../../core/utils/showToast.dart';
import '../../../data/model/response/base/emptyDataModel.dart';
import '../../../data/model/body/contactUsBody.dart';
import '../../../data/model/response/setting_model.dart';

class SettingViewModel with ChangeNotifier {
  final SaveUserData saveUserData;
  final SettingRepo settingRepo;


  SettingViewModel(
      {required this.saveUserData,
      required this.settingRepo});

  ///variables
  EmptyDataModel? _emptyDataModel;
  SettingModel? _settingModel;
  int? _historyIndex;

  bool _isLoading = false;
  bool _isFavLoading = false;

  /// getter
  int? get historyIndex => _historyIndex;

  SettingModel? get settingModel => _settingModel;


  bool get isLoading => _isLoading;
  bool get isFavLoading => _isFavLoading;
set historyIndex (index){
  _historyIndex=index;
}
  // Future<ApiResponse> getMyFavoriteItem(
  //   BuildContext context,
  // ) async {
  //   _isFavLoading = true;
  //   ApiResponse apiResponse =
  //       await settingRepo.myFavoriteProductRepo();
  //   if (apiResponse.response != null &&
  //       apiResponse.response?.statusCode == 200) {
  //     _myFavoriteModel = MyFavoriteModel.fromJson(apiResponse.response?.data);
  //     _isFavLoading = false;
  //   } else {
  //     ApiChecker.checkApi(context, apiResponse);
  //     _isFavLoading = false;
  //   }
  //   notifyListeners();
  //   return apiResponse;
  // }
  // Future<ApiResponse> isFavorite(context, String productId, int productIndex,String? whichScreen,) async {
  //   _isLoading = true;
  //   ApiResponse responseModel = await productsRepo.isFavoriteRepo(productId);
  //   if (responseModel.response != null &&
  //       responseModel.response?.statusCode == 200) {
  //     print("llllll${_myFavoriteModel?.data?[productIndex].isFavorite}");
  //
  //     if (_myFavoriteModel != null && _myFavoriteModel?.code == 200) {
  //       (_myFavoriteModel?.data?[productIndex].isFavorite == false) ?
  //       (_myFavoriteModel?.data?[productIndex].isFavorite = true) :
  //       (_myFavoriteModel?.data?[productIndex].isFavorite = false);
  //       getMyFavoriteItem(context);
  //       // Provider.of<HomeViewModel>(context, listen: false).getLatestProducts(context);
  //       _isLoading = false;
  //       print("llllll${_myFavoriteModel?.data?[productIndex].isFavorite}");
  //
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text(_myFavoriteModel?.message ?? ""),
  //         backgroundColor: Colors.red,
  //       ));
  //     }
  //   } else {
  //     ApiChecker.checkApi(context, responseModel);
  //     _isLoading = false;
  //   }
  //   notifyListeners();
  //   return responseModel;
  // }

  Future<ApiResponse> contactUsApi(context, ContactUsBody contactUsBody) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await settingRepo.contactUs(contactUsBody);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      if (_emptyDataModel != null && _emptyDataModel?.code == 200) {
        _emptyDataModel = EmptyDataModel.fromJson(responseModel.response?.data);
      } else {
      }
    } else {
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ApiResponse> setting(BuildContext context) async {
    ApiResponse apiResponse = await settingRepo.settingRepo();
    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      _emptyDataModel = EmptyDataModel.fromJson(apiResponse.response?.data);
      if (_emptyDataModel?.code == 200) {
        _settingModel = SettingModel.fromJson(apiResponse.response?.data);
      } else {
        ToastUtils.showToast(_emptyDataModel?.message ?? "");
      }
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
    return apiResponse;
  }

  // Future<ApiResponse> points(BuildContext context) async {
  //   ApiResponse apiResponse = await settingRepo.pointsRepo();
  //   if (apiResponse.response != null &&
  //       apiResponse.response?.statusCode == 200) {
  //     _emptyDataModel = EmptyDataModel.fromJson(apiResponse.response?.data);
  //     if (_emptyDataModel?.code == 200) {
  //       _pointsModel = PointsModel.fromJson(apiResponse.response?.data);
  //     } else {
  //       ToastUtils.showToast(_emptyDataModel?.message ?? "");
  //     }
  //   } else {
  //     ApiChecker.checkApi(context, apiResponse);
  //   }
  //   notifyListeners();
  //   return apiResponse;
  // }
}
