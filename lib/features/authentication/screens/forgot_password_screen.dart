import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_slot/core/constants/app_strings.dart';
import 'package:medi_slot/core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:medi_slot/core/generic_widgets/main_button.dart';
import 'package:medi_slot/core/generic_widgets/social_media_methods.dart';
import 'package:medi_slot/core/theme/app_colors.dart';
import 'package:medi_slot/core/theme/app_text_style.dart';
import 'package:medi_slot/features/authentication/screens/verification_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  TextEditingController emailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 78.h),
            Row(
              children: [
                SizedBox(
                  width: 50.w,
                ),
                Text(
                  AppStrings.forgotPassword.tr(),
                  style: AppTextStyle.f32W700NearBlack(context),
                ),
              ],
            ),
            SizedBox(height: 248.h),
            CustomTextFormField(
              nameController: emailAddressController,
              text: AppStrings.enterEmailAddress,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 150.h,
            ),
            MainButton(
                text: AppStrings.sendCode.tr(),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => VerificationScreen(),
                    ),
                  );
                },
                buttonColor: appColors.primaryColor,
                textColor: appColors.lightGreyColor),
            SizedBox(
              height: 38.h,
            ),
            SocialMediaMethods(),
          ],
        ),
      ),
    );
  }
}
