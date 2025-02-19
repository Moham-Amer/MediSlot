import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medi_slot/core/generic_widgets/main_button.dart';
import 'package:medi_slot/core/theme/app_colors.dart';
import 'package:medi_slot/core/theme/app_text_style.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding(
      {super.key,
      required this.image,
      required this.firstString,
      required this.secondString,
      required this.progressImage,
      required this.buttonText,
      required this.onPressedFunction});

  final String image;
  final String firstString;
  final String secondString;
  final String progressImage;
  final String buttonText;
  final Function onPressedFunction;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return Column(
      children: [
        SvgPicture.asset(
          image,
          height: 271.h,
          width: 375.w,
        ),
        SizedBox(height: 100.h),
        Column(
          children: [
            Text(
              firstString.tr(),
              style: AppTextStyle.f32W700NearBlack(context),
            ),
            SizedBox(height: 8.h),
            Text(
              secondString.tr(),
              style: AppTextStyle.f16W400DarkGrey(context),
            ),
          ],
        ),
        SizedBox(height: 80.h),
        SvgPicture.asset(
          progressImage,
          height: 10.h,
          width: 28.w,
        ),
        SizedBox(height: 32.h),
        MainButton(
          buttonColor: appColors.primaryColor,
          textColor: appColors.lightGreyColor,
          text: buttonText.tr(),
          onPressed: () {
            onPressedFunction();
          },
        ),
      ],
    );
  }
}
