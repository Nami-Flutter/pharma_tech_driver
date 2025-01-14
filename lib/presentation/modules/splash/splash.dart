import 'dart:async';
import 'package:pharma_tech_driver/core/resources/app_assets.dart';
import 'package:pharma_tech_driver/presentation/modules/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/routing/route.dart';
import 'package:pharma_tech_driver/injection.dart';
import 'package:provider/provider.dart';
import '../../../data/repository/SaveUserData.dart';
import '../../component/appbars/custom_app_bar.dart';
import '../auth/auth_view_model.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SaveUserData sp =getIt();

  @override
  void initState() {
    super.initState();
    // print("jhjhjhhhhtoken${sp.getUserData()?.data?.auth?.token}");
    Timer(const Duration(seconds: 3), () {
      if (sp.getUserData()?.data?.user?.id !=null) {
        Provider.of<AuthViewModel>(context,listen: false).updateFCMToken();
        // pushAndRemoveUntil(const BottomNavigationBarExample(0));
      }else{
        // if(sp.isShowIntro()==false){
          // pushAndRemoveUntil( IntroScreen());
        // }else{
          // pushAndRemoveUntil(const BottomNavigationBarExample(0)); // for complete design remove it later
          pushAndRemoveUntil(const Login());
        // }
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        height: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.splash), fit: BoxFit.fill),
        ),
      ),
    );
  }


}