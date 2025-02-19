import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_slot/core/constants/app_strings.dart';
import 'package:medi_slot/core/generic_widgets/main_button.dart';
import 'package:medi_slot/core/theme/app_colors.dart';
import 'package:medi_slot/core/theme/app_text_style.dart';
import 'package:medi_slot/features/authentication/screens/log_in_screen.dart';
import 'package:medi_slot/features/authentication/screens/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 379.h,
          ),
          Center(
            child: Text(
              AppStrings.welcome.tr(),
              style: AppTextStyle.f40W700NearBlack(context),
            ),
          ),
          SizedBox(
            height: 218.h,
          ),
          MainButton(
            text: AppStrings.signUp.tr(),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => SignUpScreen(),
                ),
              );
            },
            buttonColor: appColors.primaryColor,
            textColor: appColors.snowColor,
          ),
          SizedBox(
            height: 24.h,
          ),
          MainButton(
            text: AppStrings.logIn.tr(),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LogInScreen(),
                ),
              );
            },
            buttonColor: appColors.snowColor,
            textColor: appColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
