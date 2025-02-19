import 'package:flutter/material.dart';
import 'package:medi_slot/core/constants/app_const.dart';
import 'package:medi_slot/core/constants/app_images.dart';
import 'package:medi_slot/core/constants/app_strings.dart';
import 'package:medi_slot/core/generic_widgets/on_boarding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_slot/features/authentication/screens/welcome_screen.dart';

class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 135.h),
          OnBoarding(
            image: AppImages.onBoardingImage2,
            firstString: AppStrings.nearToYou,
            secondString: AppStrings.scheduleYourVisitAtAnyTimeThatSuitsYou,
            progressImage: AppImages.onBoardingProgressImage2,
            buttonText: AppStrings.getStarted,
            onPressedFunction: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => WelcomeScreen(),
                ),
              );
              box.write('isFirstOpen', false);
            },
          ),
        ],
      ),
    );
  }
}
