import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medi_slot/core/constants/app_images.dart';
import 'package:medi_slot/core/constants/app_strings.dart';
import 'package:medi_slot/core/theme/app_text_style.dart';

class SocialMediaMethods extends StatelessWidget {
  const SocialMediaMethods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.or.tr(),
          style: AppTextStyle.f16W700NearBlack(context),
        ),
        SizedBox(
          height: 21.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppImages.facebook,
              height: 32.h,
              width: 32.w,
            ),
            SizedBox(
              width: 18.w,
            ),
            SvgPicture.asset(
              AppImages.googleChrome,
              height: 32.h,
              width: 32.w,
            ),
            SizedBox(
              width: 18.w,
            ),
            SvgPicture.asset(
              AppImages.twitterX,
              height: 32.h,
              width: 32.w,
            ),
          ],
        )
      ],
    );
  }
}