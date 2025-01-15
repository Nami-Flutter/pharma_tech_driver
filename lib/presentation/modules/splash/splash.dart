import 'dart:async';
import 'package:pharma_tech_driver/core/resources/app_assets.dart';
import 'package:pharma_tech_driver/presentation/modules/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/routing/route.dart';
import 'package:pharma_tech_driver/injection.dart';
import 'package:pharma_tech_driver/presentation/modules/auth/login/provider/login_provider.dart';
import 'package:pharma_tech_driver/presentation/modules/home/home.dart';
import 'package:provider/provider.dart';
import '../../../data/repository/SaveUserData.dart';
import '../../component/appbars/custom_app_bar.dart';

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
    Timer(const Duration(seconds: 3), () {
      if (sp.getUserData()?.data?.delegate?.id !=null) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp){
          Provider.of<LoginLogoutViewModel>(context,listen: false).updateFCMToken();
        });
        pushAndRemoveUntil(HomeScreen());
      }else{
          pushAndRemoveUntil(const Login());
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