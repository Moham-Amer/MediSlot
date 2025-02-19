import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_slot/core/constants/app_strings.dart';
import 'package:medi_slot/core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:medi_slot/core/generic_widgets/main_button.dart';
import 'package:medi_slot/core/theme/app_colors.dart';
import 'package:medi_slot/core/theme/app_text_style.dart';
import 'package:medi_slot/features/authentication/screens/log_in_screen.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                  width: 32.w,
                ),
                Text(
                  AppStrings.enterNewPassword.tr(),
                  style: AppTextStyle.f32W700NearBlack(context),
                ),
              ],
            ),
            SizedBox(height: 190.h),
            CustomTextFormField(
              nameController: passwordController,
              text: AppStrings.password,
              isPassword: true,
            ),
            SizedBox(
              height: 36.h,
            ),
            CustomTextFormField(
              nameController: confirmPasswordController,
              text: AppStrings.confirmPassword,
              isConfirmPassword: true,
            ),
            SizedBox(
              height: 95.h,
            ),
            MainButton(
                text: AppStrings.cContinue.tr(),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LogInScreen(),
                    ),
                  );
                },
                buttonColor: appColors.primaryColor,
                textColor: appColors.lightGreyColor),
          ],
        ),
      ),
    );
  }
}
