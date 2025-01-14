// import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:alftoon/domain/request_body/login_body.dart';
// import 'package:alftoon/presentation/modules/auth/sign_in/sign_in_view_model.dart';
//
//
// class AuthClass {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<void> verifyPhoneNumber(
//       String phoneNumber, BuildContext context, Function setData) async {
//     verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
//       showSnackBar(context, "Verification Completed");
//     }
//     verificationFailed(FirebaseAuthException exception) {
//       showSnackBar(context, exception.toString());
//     }
//     codeSent(String verificationID, int? forceResnedingtoken) {
//       showSnackBar(context, tr("Verification Code sent on the phone number"));
//       setData(verificationID);
//     }
//
//     codeAutoRetrievalTimeout(String verificationID) {
//       showSnackBar(context, tr("TimeOut"));
//     }
//     try {
//       await _auth.verifyPhoneNumber(
//           timeout: const Duration(seconds: 60),
//           phoneNumber: phoneNumber,
//           verificationCompleted: verificationCompleted,
//           verificationFailed: verificationFailed,
//           codeSent: codeSent,
//           codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
//
//   Future<void> signInWithPhoneNumber(LoginBody body,
//       String verificationId, String smsCode, BuildContext context) async {
//     try {
//       AuthCredential credential = PhoneAuthProvider.credential(
//           verificationId: verificationId, smsCode: smsCode);
//
//         FirebaseAuth auth = FirebaseAuth.instance;
//         auth.signInWithCredential(credential).then((result) {
//           if (result != null) {
//             showSnackBar(context, tr("done"));
//
//             print("The code is correct");
//             Provider.of<SignInViewModel>(context, listen: false).login(body);
//           }else{
//             showSnackBar(context, tr("theCodeIsWrong"));
//           }
//         }).catchError((e) {
//           showSnackBar(context, e.toString());
//           print(e);
//         });
//
//     } catch (e) {
//       print("222222222222");
//
//       showSnackBar(context, e.toString());
//     }
//   }
//
//   void showSnackBar(BuildContext context, String text) {
//     final snackBar = SnackBar(content: Text(text));
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }
