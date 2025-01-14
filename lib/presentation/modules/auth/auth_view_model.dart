import 'dart:async';
import 'package:pharma_tech_driver/data/model/response/cities_data_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/resources/locale_keys.g.dart';
import 'package:pharma_tech_driver/core/routing/route.dart';
import 'package:pharma_tech_driver/presentation/modules/splash/splash.dart';
import '../../../../core/api_checker.dart';
import '../../../../data/model/body/LoginBody.dart';
import '../../../../data/model/response/base/api_response.dart';
import '../../../../data/repository/SaveUserData.dart';
import '../../../../data/repository/auth_repo.dart';
import '../../../core/utils/showToast.dart';
import '../../../data/model/body/register_body.dart';
import '../../../data/model/body/update_profile_body.dart';
import '../../../data/model/response/base/emptyDataModel.dart';
import '../../../data/model/response/user_model.dart';
import '../../firebase_notification/notification_services.dart';
import 'confirm_code/verification_code/confirm_code_sheet.dart';

class AuthViewModel with ChangeNotifier {
  final AuthRepo authRepo;
  final SaveUserData saveUserData;

  CitiesDataModel? _citiesDataModel;

  CityModel? selectedValue;

  bool? _isLoadingCities;

  AuthViewModel({required this.saveUserData, required this.authRepo});

  ///variables
  bool _isLoading = false;
  bool _loading = false;
  String? _validationMSG;
  String _phoneCode = '+218';
 late String _verificationId ;
  UserModel? _userModel;
  EmptyDataModel? _emptyDataModel;
  bool _isClicked = false;

  ///getters
  bool get isLoading => _isLoading;
  bool get loading => _loading;
  bool? get isLoadingCities => _isLoadingCities;

  String? get validationMSG => _validationMSG;

  String get phoneCode => _phoneCode;

  bool get isClicked => _isClicked;

  ///setters

  UserModel? get userModel => _userModel;
  CitiesDataModel? get citiesDataModel => _citiesDataModel;

  set validationMsg(String msg) {
    _validationMSG = msg;
    notifyListeners();
  }

  set phoneCodeCountry(String phoneCode) {
    _phoneCode = phoneCode;
    notifyListeners();
  }

  bool isClickedAction() {
    notifyListeners();
    return _isClicked = !_isClicked;
  }

  ///calling APIs Functions
  Future<ApiResponse> login({required String phone, required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();
    final LoginBody _body = LoginBody(phone: phone, phoneCode: _phoneCode);
    ApiResponse responseModel = await authRepo.loginRepo(_body);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _userModel = UserModel.fromJson(responseModel.response?.data);

      if (_userModel != null && _userModel?.code == 200) {
        if (_userModel?.data?.user?.id != null) {
          saveUserData.saveUserData(_userModel!);
          saveUserData.saveUserToken(_userModel?.data?.auth?.token ?? '');
          print('kkkkkkkkkkk${saveUserData.getUserData()?.data?.user?.id}');

          // await authRepo.updateFCMToken();
        }
        ToastUtils.showToast(LocaleKeys.loggedInSuccessfully.tr());
         updateFCMToken();
        // pushAndRemoveUntil(const BottomNavigationBarExample(0));
      } else if (_userModel?.code == 422) {
        ToastUtils.showToast(LocaleKeys.createAccountLogin.tr());
        // push(Register(phoneCode: _phoneCode, phone: phone));
      }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> getCities(BuildContext context) async {
    _isLoadingCities = true;
    // notifyListeners();
    ApiResponse responseModel = await authRepo.getCities();
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoadingCities = false;
      _citiesDataModel = CitiesDataModel.fromJson(responseModel.response?.data);
      notifyListeners();
    } else {
      _isLoadingCities = false;
      ApiChecker.checkApi(context, responseModel);
    }
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> register(
      BuildContext context, RegisterBody? _registerBody) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await authRepo.registerRepo(_registerBody);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _userModel = UserModel.fromJson(responseModel.response?.data);

      if (_userModel != null && _userModel?.code == 200) {
        if (_userModel?.data?.user?.id != null) {
          saveUserData.saveUserData(_userModel!);
          saveUserData.saveUserToken(_userModel?.data?.auth?.token ?? '');
        }
        ToastUtils.showToast(LocaleKeys.successfullyRegistered.tr());
        updateFCMToken();
        // pushAndRemoveUntil(const BottomNavigationBarExample(0));
      } else {
        ToastUtils.showToast(_userModel?.message ?? "");
      }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ApiResponse> updateProfile(
      BuildContext context, UpdateProfileBody? updateProfileBody) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await authRepo.updateProfile(updateProfileBody);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _userModel = UserModel.fromJson(responseModel.response?.data);
      if (_userModel != null && _userModel?.code == 200) {
        if (_userModel?.data?.user?.id != null) {
        await  saveUserData.saveUserData(_userModel!);
         await saveUserData.saveUserToken(_userModel?.data?.auth?.token ?? '');
        }
        ToastUtils.showToast('YourInformationSuccessfullyModified'.tr());
        Navigator.pop(context);
        // _updateFCMToken();
      } else {
        ToastUtils.showToast(_userModel?.message ?? "");
      }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ApiResponse> logout(
    BuildContext context,
  ) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await authRepo.logout();
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
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ApiResponse> deleteAccount(
    BuildContext context,
  ) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await authRepo.deleteAccount();
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
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<bool> sendOTPFirebase(BuildContext context,String phone) async {
    _loading=true;
    notifyListeners();
    bool successfully = false;
    if (_phoneCode == null ) return false;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${_phoneCode?? ''}$phone',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        ToastUtils.showToast(e.message ?? 'Error');
        successfully = false;
        _loading = false;
        notifyListeners();
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId=verificationId;
        // _body.updateVerificationId(verificationId);
        // log(_tag, 'codeSent');

        successfully = true;
        _loading = false;
        notifyListeners();
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) => ConfirmCodeSheet(phone: phone),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        successfully = false;
        _loading = false;
        notifyListeners();
      },
    );

    return successfully;
  }
  Future<bool> verifyOTPFirebase(String smsCode,String phone,BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try{
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId:_verificationId, smsCode: smsCode);
      // Sign the user in (or link) with the credential
      await FirebaseAuth.instance.signInWithCredential(credential).then((result) {
        if (result.user != null) {
          login(phone:phone , context: context);
        }else{
          ToastUtils.showToast(LocaleKeys.codeIsWrong.tr());
        }
      });
      _isLoading = false;
      notifyListeners();
      return true;
    }catch(e){
      _isLoading = false;
      ToastUtils.showToast(LocaleKeys.codeIsWrong.tr());
      notifyListeners();
      return false;
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
