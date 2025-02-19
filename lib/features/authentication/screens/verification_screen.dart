import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_slot/core/constants/app_strings.dart';
import 'package:medi_slot/core/generic_widgets/main_button.dart';
import 'package:medi_slot/core/theme/app_colors.dart';
import 'package:medi_slot/core/theme/app_text_style.dart';
import 'package:medi_slot/features/authentication/screens/new_password_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});

  TextEditingController pinCodeController = TextEditingController();

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
                  width: 102.w,
                ),
                Text(
                  AppStrings.verification.tr(),
                  style: AppTextStyle.f32W700NearBlack(context),
                ),
              ],
            ),
            SizedBox(height: 240.h),
            Text(
              AppStrings.enterVerificationCode.tr(),
              style: AppTextStyle.f16W400NearBlack(context),
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 76.w,
                ),
                SizedBox(
                  width: 224.w,
                  child: PinCodeTextField(
                    controller: pinCodeController,
                    appContext: context,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 8.25.w,
                      );
                    },
                    mainAxisAlignment: MainAxisAlignment.start,
                    length: 4,
                    pinTheme: PinTheme(
                      borderWidth: 1,
                      shape: PinCodeFieldShape.box,
                      activeBorderWidth: 1,
                      disabledBorderWidth: 1,
                      errorBorderWidth: 1,
                      inactiveBorderWidth: 1,
                      selectedBorderWidth: 1,
                      borderRadius: BorderRadius.circular(16),
                      fieldHeight: 48.h,
                      fieldWidth: 48.w,
                      activeColor: Colors.blue,
                      errorBorderColor: Colors.red,
                      selectedColor: Colors.green,
                      inactiveColor: appColors.mediumGreyColor,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 42.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.ifYouDidntReceiveACode.tr(),
                  style: AppTextStyle.f12W400NearBlack(context),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    AppStrings.resend.tr(),
                    style: AppTextStyle.f12W400PrimaryColor(context),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 93.h,
            ),
            MainButton(
                text: AppStrings.enterCode.tr(),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => NewPasswordScreen(),
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
