import 'dart:convert';
import 'package:pharma_tech_driver/presentation/modules/auth/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/routing/route.dart';
import '../../core/utils/app_constants.dart';
import '../../presentation/modules/splash/splash.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../model/response/user_model.dart';

class SaveUserData {
  final SharedPreferences sharedPreferences;
  final DioClient dioClient;

  SaveUserData({required this.sharedPreferences, required this.dioClient});

  /// save SharedData

  Future<void> saveUserData(UserModel userData,bool isUpdate) async {
    if(isUpdate==false){
      dioClient.updateHeader(userData.data?.auth?.token ?? "");
    }
    String userSavedData = json.encode(userData);
    try {
      await sharedPreferences.setString(AppConstants.userData, userSavedData);
    } catch (e) {
      rethrow;
    }
  }
  Future<void> saveIsShowIntro(bool isShowIntro) async {
    try {
      await sharedPreferences.setBool(AppConstants.showIntro, isShowIntro);
    } catch (e) {
      throw e;
    }
  }
  bool isHjiriMode() {
    bool? isHjiriMode = sharedPreferences.getBool('isHjiriMode');
    return isHjiriMode ?? false;
  }

  void saveisHjiriMode(bool isHjiriMode) async {
    await sharedPreferences.setBool('isHjiriMode', isHjiriMode);
  }
  Future<void> saveLang(String lang) async {
    try {
      await sharedPreferences.setString(AppConstants.lang, lang);
    } catch (e) {
      throw e;
    }
  }
  Future<void> saveUserToken(String userTOKEN) async {
    dioClient.updateHeader(userTOKEN);
    try {
      await sharedPreferences.setString(AppConstants.userTOKEN, userTOKEN);
    } catch (e) {
      throw e;
    }
  }

  Future<void> saveTitle(String title) async {
    try {
      await sharedPreferences.setString(AppConstants.title, title);
    } catch (e) {
      throw e;
    }
  }

  ///get SharedData
  UserModel? getUserData()   {
    String?  userSavedData= sharedPreferences.getString(AppConstants.userData) ;
   if (userSavedData !=null) {
     Map<String, dynamic> userData = json.decode(userSavedData);
     UserModel userModel = UserModel.fromJson(userData);
     return userModel;
   }
  }
  String getUserToken() {
    return sharedPreferences.getString(AppConstants.userTOKEN) ?? "";
  }
  String getLang() {
    return sharedPreferences.getString(AppConstants.lang) ?? "ar";
  }
  String getBranchTitle() {
    return sharedPreferences.getString(AppConstants.title) ?? "";
  }
  bool isShowIntro() {
    return sharedPreferences.containsKey(AppConstants.showIntro);
  }
/// check SharedData
//   bool isLoggedIn() {
//     return sharedPreferences.containsKey(AppConstants.userId);
//   }
  ///clear SharedData
  Future<bool> clearSharedData() async {
    await sharedPreferences.remove(AppConstants.userData);
    await sharedPreferences.remove(AppConstants.userTOKEN);
    await sharedPreferences.remove(AppConstants.title);
    pushAndRemoveUntil(Login());

    return true;
  }
}
