import 'package:flutter/material.dart';
import 'package:medi_slot/core/constants/app_const.dart';
import 'package:medi_slot/core/constants/app_images.dart';
import 'package:medi_slot/features/authentication/screens/on_boarding_screen1.dart';
import 'package:medi_slot/features/authentication/screens/welcome_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_slot/features/home/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState(isLoggedIn: isLoggedIn);
}

class _SplashScreenState extends State<SplashScreen> {
  final bool isLoggedIn;

  _SplashScreenState({required this.isLoggedIn});

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if ((box.read('isFirstOpen') ?? true) == true) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => OnBoardingScreen1(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => isLoggedIn ? MainScreen() : WelcomeScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppImages.splashImage,
          width: 193.w,
          height: 93.h,
        ),
      ),
    );
  }
}
