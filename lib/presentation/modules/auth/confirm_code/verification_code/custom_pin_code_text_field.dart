import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/core/resources/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class CustomPinCodeTextField extends StatelessWidget {
  final TextEditingController _controller;
  const CustomPinCodeTextField({super.key,
    required TextEditingController controller,
  }) : _controller = controller;
  @override
  Widget build(BuildContext context) {
    //put on provider in logic
    //late String otpPinCode;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 28.w),
        child: PinCodeTextField(
          appContext: context,
          controller: _controller,
          textGradient:  LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).primaryColor ,
              Colors.blueGrey,
            ],
          ),
          //autoFocus: false,
          keyboardType: TextInputType.number,
          length: 6,
          cursorColor:Theme.of(context).primaryColor,
          // obscureText: false,
          animationType: AnimationType.scale,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          pinTheme: PinTheme(

            inactiveColor: Theme.of(context).primaryColor,
            activeColor: Theme.of(context).primaryColorLight,
            selectedColor: Theme.of(context).hintColor,

          ),

          animationDuration: const Duration(milliseconds: 300),
          //backgroundColor: Colors.blue.shade50,
          //enableActiveFill: true,
          onCompleted: (submitedCode) {
            // otpPinCode = submitedCode;
            print("Completed");
          },
          onChanged: (value) {
            print(value);
          },
        ),
      ),
    );
  }


}
