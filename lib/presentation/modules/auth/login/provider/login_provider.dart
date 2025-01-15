import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/resources/locale_keys.g.dart';
import 'package:pharma_tech_driver/main.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:provider/provider.dart';
import '../../../../../core/api_checker.dart';
import '../../../../../core/routing/route.dart';
import '../../../../../core/utils/showToast.dart';
import '../../../../../data/model/body/LoginBody.dart';
import '../../../../../data/model/response/base/api_response.dart';
import '../../../../../data/model/response/base/emptyDataModel.dart';
import '../../../../../data/model/response/user_model.dart';
import '../../../../../data/repository/SaveUserData.dart';
import '../../../../../data/repository/auth_repo.dart';
import '../../../../component/loadings/progress_dialog.dart';
import '../../../../firebase_notification/notification_services.dart';
import '../../../home/home.dart';
import '../../../splash/splash.dart';

class LoginLogoutViewModel with ChangeNotifier {
  final AuthRepo authRepo;
  final SaveUserData saveUserData;
  LoginLogoutViewModel({required this.saveUserData, required this.authRepo});

  ///variables
  bool _isLoading = false;
  String? _validationMSG;
  UserModel? _userModel;
  EmptyDataModel? _emptyDataModel;

  ///getters
  bool get isLoading => _isLoading;
  String? get validationMSG => _validationMSG;
  
  ///setters

  UserModel? get userModel => _userModel;
  EmptyDataModel? get emptyDataModel => _emptyDataModel;

  set validationMsg(String msg) {
    _validationMSG = msg;
    notifyListeners();
  }

  ///calling APIs Functions
  String removeLeadingZeroFromString(String input) {
    if (input.isEmpty) {
      return input;
    }
    if (input[0] == '0') {
      input = input.substring(1);
    }
    return input;
  }
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void initLogin(){
    phoneController.clear();
    passwordController.clear();
  }
  Future<ApiResponse> login() async {
    _isLoading = true;
    notifyListeners();
    final LoginBody _body = LoginBody(phone: removeLeadingZeroFromString(phoneController.text), password: passwordController.text);
    ProgressDialog dialog = createProgressDialog(msg: "${LocaleKeys.login.tr()} ...", context: navigator.currentState!.context);
    await dialog.show();
    ApiResponse responseModel = await authRepo.loginRepo(_body);
    await dialog.hide();
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _userModel = UserModel.fromJson(responseModel.response?.data);
      if (_userModel != null && _userModel?.code == 200) {
        if (_userModel?.data?.delegate?.id != null) {
          saveUserData.saveUserData(_userModel!);
          saveUserData.saveUserToken(_userModel?.data?.auth?.token ?? '');
        }
        ToastUtils.showToast(LocaleKeys.loggedInSuccessfully.tr());
        updateFCMToken();
        push(HomeScreen());
      } else if (_userModel?.code == 422) {
        ToastUtils.showToast(_userModel?.message??'');
      }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(navigator.currentContext!, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> logout() async {
    _isLoading = true;
    notifyListeners();
    ProgressDialog dialog = createProgressDialog(msg: "${LocaleKeys.logOut.tr()} ...", context: navigator.currentState!.context);
    await dialog.show();
    ApiResponse responseModel = await authRepo.logout();
    await dialog.hide();
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _emptyDataModel = EmptyDataModel.fromJson(responseModel.response?.data);
      if (_emptyDataModel?.code == 200) {
        await saveUserData.clearSharedData().then((value) => pushAndRemoveUntil(const Splash()));
      } else {
        ToastUtils.showToast(_emptyDataModel?.message ?? "");
      }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(navigator.currentContext!, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  final formKey = GlobalKey<FormState>();
  void onSubmit(BuildContext context) async {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        String phone = phoneController.text;
        String password = passwordController.text;
        if (phone.isEmpty) {
          Provider.of<LoginLogoutViewModel>(context, listen: false).validationMsg =tr(LocaleKeys.phoneMustBeEntered);
        } else if (phone.length < 9) {
          Provider.of<LoginLogoutViewModel>(context, listen: false).validationMsg = tr(LocaleKeys.msgInvalidPhoneNumber);
        } else if (password.isEmpty) {
          Provider.of<LoginLogoutViewModel>(context, listen: false).validationMsg = tr(LocaleKeys.passwordRequired);
        } else if (password.length<6) {
          Provider.of<LoginLogoutViewModel>(context, listen: false).validationMsg = tr(LocaleKeys.passwordMustLeastCharactersLong);
        } else {
          login();
        }
      }
    }
  }
  
  Future<void> updateFCMToken() async {
    print("kkkkkkffffk");
    String? fcmToken = await NotificationServices().getDeviceToken();
    if (fcmToken == null) {return;}
    await authRepo.updateFCMToken(fcmToken: fcmToken);
    notifyListeners();
  }
}
