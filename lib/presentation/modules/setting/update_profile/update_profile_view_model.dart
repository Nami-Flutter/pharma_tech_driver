import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma_tech_driver/core/resources/locale_keys.g.dart';
import 'package:pharma_tech_driver/core/utils/showToast.dart';
import 'package:pharma_tech_driver/data/model/body/update_profile_body.dart';
import 'package:pharma_tech_driver/injection.dart';
import 'package:pharma_tech_driver/presentation/modules/auth/login/provider/login_provider.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import '../../../../../data/model/response/user_model.dart';
import '../../../../../data/repository/SaveUserData.dart';
import '../../../../../data/repository/auth_repo.dart';
import '../../../../core/api_checker.dart';
import '../../../../data/model/response/base/api_response.dart';
import '../../../../main.dart';
import '../../../component/loadings/progress_dialog.dart';

class UpdateProfileViewModel with ChangeNotifier {
  final AuthRepo authRepo;
  final SaveUserData saveUserData;
  UpdateProfileViewModel({required this.saveUserData, required this.authRepo});

  ///variables
  bool _isLoading = false;
  String? _validationMSG;
  UserModel? _userModel;

  String phoneCode = '+218';

  ///getters
  bool get isLoading => _isLoading;
  String? get validationMSG => _validationMSG;

  ///setters

  UserModel? get userModel => _userModel;

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
  File? image;

  Future<void> getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
      image = pickedFile != null ? File(pickedFile.path) : null;
      notifyListeners();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void initUpdateProfile(){
    image=null;
    nameController.clear();
    phoneController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  LoginLogoutViewModel loginProvider =getIt();

  Future<ApiResponse> updateProfile () async {
    _isLoading = true;
    notifyListeners();
    final UpdateProfileBody _body = UpdateProfileBody(phone: removeLeadingZeroFromString(phoneController.text),
        password: passwordController.text,
      name: nameController.text,
      image: image
    );
    ProgressDialog dialog = createProgressDialog(msg: "${LocaleKeys.modifyTheAccount.tr()} ...", context: navigator.currentState!.context);
    await dialog.show();
    ApiResponse responseModel = await authRepo.updateProfile(_body);
    await dialog.hide();
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _userModel = UserModel.fromJson(responseModel.response?.data);
      if (_userModel != null && _userModel?.code == 200) {
        if (_userModel?.data?.delegate?.id != null) {
          saveUserData.saveUserData(_userModel!,true);
          notifyListeners();
        }
        // ToastUtils.showToast(_userModel?.message??'');
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          loginProvider.updateFCMToken();
        });
        Navigator.pop(navigator.currentContext!);
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

  void onSubmit(BuildContext context) async {
        String name = nameController.text;
        String phone = phoneController.text;
        String password = passwordController.text;
        String confirmPassword = confirmPasswordController.text;
        if (name.isEmpty) {
          ToastUtils.showToast(tr(LocaleKeys.nameRequired));
          // Provider.of<UpdateProfileViewModel>(context, listen: false).validationMsg =tr(LocaleKeys.nameRequired);
        }else if (phone.isEmpty) {
          ToastUtils.showToast(tr(LocaleKeys.phoneMustBeEntered));
          // Provider.of<UpdateProfileViewModel>(context, listen: false).validationMsg =tr(LocaleKeys.phoneMustBeEntered);
        } else if (phone.length < 9) {
          ToastUtils.showToast(tr(LocaleKeys.msgInvalidPhoneNumber));
          // Provider.of<UpdateProfileViewModel>(context, listen: false).validationMsg = tr(LocaleKeys.msgInvalidPhoneNumber);
        } else if (password.isEmpty) {
          ToastUtils.showToast(tr(LocaleKeys.passwordRequired));
          // Provider.of<UpdateProfileViewModel>(context, listen: false).validationMsg = tr(LocaleKeys.passwordRequired);
        } else if (password.length<6) {
          ToastUtils.showToast(tr(LocaleKeys.passwordMustLeastCharactersLong));
          // Provider.of<UpdateProfileViewModel>(context, listen: false).validationMsg = tr(LocaleKeys.passwordMustLeastCharactersLong);
        } else if (password!=confirmPassword) {
          ToastUtils.showToast(tr(LocaleKeys.passwordsDoNotMatch));
          // Provider.of<UpdateProfileViewModel>(context, listen: false).validationMsg = tr(LocaleKeys.passwordsDoNotMatch);
        } else {
           updateProfile();
    }
  }

}
