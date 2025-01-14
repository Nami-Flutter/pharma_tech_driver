// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../../core/routing/navigation_services.dart';
// import '../../../../../../core/routing/routes.dart';
// import '../../../../../../core/utils/alerts.dart';
//
// class OTPViewModel with ChangeNotifier {
//   final _tag='OTPViewModel';
//  final SaveUserDataUseCase _saveUserDataUseCase;
//  final ForgetPasswordUseCase _forgetPasswordUseCase;
//  final CheckOTPUseCase _otpUseCase;
//  final SignInUseCase _signInUseCase;
//   final UpdateFCMTokenUseCase _updateFCMTokenUseCase ;
//
//   OTPViewModel({
//     required SignInUseCase signInUseCase,
//     required SaveUserDataUseCase saveUserDataUseCase,
//     required CheckOTPUseCase otpUseCase,
//     required ForgetPasswordUseCase forgetPasswordUseCase,
//     required UpdateFCMTokenUseCase updateFCMTokenUseCase,
//   })  :  _signInUseCase = signInUseCase,_saveUserDataUseCase = saveUserDataUseCase,
//         _forgetPasswordUseCase = forgetPasswordUseCase,
//         _updateFCMTokenUseCase = updateFCMTokenUseCase,
//         _otpUseCase = otpUseCase;
//
//   ///variables
//   bool _isLoading = false;
//   bool _isTimerDone = false;
//   String? _error ;
//
//  ///getters
//   bool get isLoading => _isLoading;
//   String? get error => _error;
//   bool get isTimerDone => _isTimerDone;
//
//
//   onTimerEnd(){
//     _isTimerDone = true;
//     notifyListeners();
//   }
//
// /* //TODO call API
//  //send phone to get code
//  Future<ResponseModel> reSendCode({required String phone}) async {
//     _isResendLoading = true;
//     notifyListeners();
//     ResponseModel responseModel = await _forgetPasswordUseCase.call(phone: phone);
//     if (responseModel.isSuccess) {_isTimerDone = false;}
//     _isResendLoading = false;
//     notifyListeners();
//     return responseModel;
//   }*/
//
// /*
//  //send phone to get code
//  Future<ResponseModel> otpCode({required String phone,required String code}) async {
//    _isLoading = true;
//    notifyListeners();
//    ResponseModel responseModel = await _otpUseCase.call(body: CheckOTPBody(phone: phone, code: code));
//    if ( responseModel.isSuccess && responseModel.data != null) {
//      UserEntity userEntity = responseModel.data;
//      kUser = userEntity;
//      String? token = userEntity.id.toString();
//      if (token.isNotEmpty) {
//        await _saveUserDataUseCase.call(token: token);
//      }
//    }
//    _isLoading = false;
//    notifyListeners();
//    return responseModel;
//  }
// */
//
//
//
//   Future<bool> verifyOTPFirebase(String smsCode,LoginBody body) async {
//     _isLoading = true;
//     _error=null;
//     notifyListeners();
//
//     try{
//       // Create a PhoneAuthCredential with the code
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: body.verificationId!, smsCode: smsCode);
//       // Sign the user in (or link) with the credential
//       await FirebaseAuth.instance.signInWithCredential(credential).then((result) {
//         if (result.user != null) {
//           login(body).then((value) {
//             if (value.isSuccess) {
//               NavigationService.pushNamedAndRemoveUntil(Routes.layoutScreen);
//             } else {
//               NavigationService.push(Routes.signUpScreen, arguments: {'body': body});
//             }
//           });
//         }else{
//           _error = tr(LocaleKeys.codeIsWrong);
//         }
//       });
//       _isLoading = false;
//       notifyListeners();
//       return true;
//     }catch(e){
//       _isLoading = false;
//       _error = tr(LocaleKeys.codeIsWrong);
//       notifyListeners();
//       return false;
//     }
//   }
//
//   //login user and save user data
//   Future<ResponseModel> login(LoginBody body) async {
//     _isLoading = true;
//     notifyListeners();
//     ResponseModel responseModel = await _signInUseCase.call(loginBody: body);
//     if (responseModel.isSuccess) {
//       UserEntity userEntity = responseModel.data;
//       kUser = userEntity;
//       String? token = userEntity.id.toString();
//       if (token.isNotEmpty) {
//         await _updateFCMToken();
//         await _saveUserDataUseCase.call(token: token).then((value) {
//           log(_tag, '$_saveUserDataUseCase ${value.isSuccess}');
//         });
//       }
//     }
//
//     _isLoading = false;
//     notifyListeners();
//
//     return responseModel;
//   }
//
//   Future<bool> sendOTPFirebase(BuildContext context,LoginBody body) async {
//     _isLoading = true;
//     notifyListeners();
//     bool successfully = false;
//     if (body.country == null || body.mobile.isEmpty) return false;
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: '+${body.country ?? ''}${body.mobile}',
//
//       verificationCompleted: (PhoneAuthCredential credential) {},
//       verificationFailed: (FirebaseAuthException e) {
//         Alerts.showSnackBar(e.message ?? 'Error');
//         log(_tag, 'verificationFailed');
//
//         successfully = false;
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         body.updateVerificationId(verificationId);
//         log(_tag, 'codeSent');
//
//         successfully = true;
//
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         log(_tag, 'codeAutoRetrievalTimeout');
//         successfully = false;
//       },
//     );
//     return successfully;
//   }
//   Future<void> _updateFCMToken() async {
//     String? fcmToken = await getDeviceToken();
//     if (fcmToken == null) {return;}
//     await _updateFCMTokenUseCase.call(fcmToken: fcmToken);
//     notifyListeners();
//   }
//
// }
