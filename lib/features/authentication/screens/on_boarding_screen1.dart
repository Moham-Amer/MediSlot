import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medi_slot/core/constants/app_const.dart';
import 'package:medi_slot/core/constants/app_images.dart';
import 'package:medi_slot/core/constants/app_strings.dart';
import 'package:medi_slot/core/generic_widgets/on_boarding.dart';
import 'package:medi_slot/core/theme/app_text_style.dart';
import 'package:medi_slot/features/authentication/screens/on_boarding_screen2.dart';
import 'welcome_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 32.h),
          Row(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 24.w,
                  ),
                  GestureDetector(
                    child: Text(
                      AppStrings.skip.tr(),
                      style: AppTextStyle.f16W400NearBlack(context),
                    ),
                    onTap: () {
                      box.write('isFirstOpen', false);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => WelcomeScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 84.h),
          OnBoarding(
            image: AppImages.onBoardingImage1,
            firstString: AppStrings.onlineHealthCheck,
            secondString: AppStrings.bookTheBestDoctorInVariousSpecialties,
            progressImage: AppImages.onBoardingProgressImage1,
            buttonText: AppStrings.next,
            onPressedFunction: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => OnBoardingScreen2(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
