import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/resources/values_manager.dart';
import 'resend_code.dart';


class ConfirmCodeForm extends StatefulWidget {
  final TextEditingController _controller;

  @override
  _ConfirmCodeFormState createState() => _ConfirmCodeFormState();

  const ConfirmCodeForm({super.key,
    required TextEditingController controller,
  }) : _controller = controller;
}

class _ConfirmCodeFormState extends State<ConfirmCodeForm> {
  var onTapRecognizer;
  late StreamController<ErrorAnimationType> errorController;
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();



  @override
  initState()   {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKey,
      child: Padding(
        padding:
             EdgeInsets.symmetric(horizontal: kScreenPaddingLarge),
        child: PinCodeTextField(
          appContext: context,
          length: 6,
          obscureText: false,
          obscuringCharacter: '*',
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          validator: (v) {
            if (v!.length <= 3) {
              return "Please Enter code correctly";
            } else {
              return null;
            }
          },
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(kFormRadiusSmall),
            fieldHeight: 40.h,
            fieldWidth: 40.w,
            inactiveColor: Theme.of(context).primaryColorLight,
            inactiveFillColor:Theme.of(context).primaryColorLight,
            borderWidth: 1.w,
            activeColor: Colors.white,
            selectedFillColor: Colors.white,
            activeFillColor: Colors.white,
            selectedColor: Theme.of(context).primaryColor,
            // activeColor: primaryColor
          ),
          cursorColor: Theme.of(context).primaryColorDark,
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.white,
          enableActiveFill: false,
          errorAnimationController: errorController,
          controller: widget._controller,
          keyboardType: TextInputType.number,
          onCompleted: (v) {},
          onChanged: (value) {},
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            return true;
          },
        ),
      ),
    );
  }
}
