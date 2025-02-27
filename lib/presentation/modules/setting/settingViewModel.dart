import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/data/repository/Setting_Repo.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import '../../../../../core/api_checker.dart';
import '../../../../../data/model/response/base/api_response.dart';
import '../../../../../data/repository/SaveUserData.dart';
import '../../../core/resources/locale_keys.g.dart';
import '../../../core/utils/showToast.dart';
import '../../../data/model/response/base/emptyDataModel.dart';
import '../../../data/model/body/contactUsBody.dart';
import '../../../data/model/response/setting_model.dart';
import '../../../main.dart';
import '../../component/loadings/progress_dialog.dart';

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

  Future<ApiResponse> contactUsApi(context, ContactUsBody contactUsBody) async {
    _isLoading = true;
    notifyListeners();
    ProgressDialog dialog = createProgressDialog(msg: "${LocaleKeys.login.tr()} ...", context: navigator.currentState!.context);
    await dialog.show();
    ApiResponse responseModel = await settingRepo.contactUs(contactUsBody);
    await dialog.hide();
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _emptyDataModel = EmptyDataModel.fromJson(responseModel.response?.data);
      if (_emptyDataModel != null && _emptyDataModel?.code == 200) {
        ToastUtils.showToast('sentSuccesfully'.tr());
        Navigator.pop(context);
      } else {
        ToastUtils.showToast(_emptyDataModel?.message??'');
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

}
