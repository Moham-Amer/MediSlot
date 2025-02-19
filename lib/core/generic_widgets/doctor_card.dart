import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medi_slot/core/constants/app_images.dart';
import 'package:medi_slot/core/constants/app_strings.dart';
import 'package:medi_slot/core/theme/app_colors.dart';
import 'package:medi_slot/core/theme/app_text_style.dart';

class DoctorCard extends StatelessWidget {
  DoctorCard({
    super.key,
    required this.doctorImage,
    required this.doctorName,
  });

  ValueNotifier<bool> liked = ValueNotifier<bool>(false);
  final String doctorImage;
  final String doctorName;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;

    return Container(
      width: 327.w,
      height: 135.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: appColors.snowColor,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 16.w,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image(
              image: AssetImage(doctorImage),
              height: 103.h,
              width: 100.w,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 7.h),
              Row(
                children: [
                  Text(
                    AppStrings.drNourSrour.tr(),
                    style: AppTextStyle.f20W700NearBlack(context),
                  ),
                  SizedBox(
                    width: 21.w,
                  ),
                  ValueListenableBuilder(
                      valueListenable: liked,
                      builder: (context, value, child) {
                        return IconButton(
                          onPressed: () {
                            if (liked.value == false) {
                              liked.value = true;
                            } else {
                              liked.value = false;
                            }
                          },
                          icon: SvgPicture.asset(
                            liked.value
                                ? AppImages.heartFilled
                                : AppImages.heart,
                            width: 19.w,
                            height: 19.h,
                            color:appColors.nearBlackColor,
                          ),
                        );
                      })
                ],
              ),
              Text(
                AppStrings.ent.tr(),
                style: AppTextStyle.f16W400NearBlack(context),
              ),
              SizedBox(
                height: 22.h,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AppImages.star,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    AppStrings.rating.tr(),
                    style: AppTextStyle.f16W400NearBlack(context),
                  ),
                  SizedBox(
                    width: 95.w,
                  ),
                  Text(
                    AppStrings.price.tr(),
                    style: AppTextStyle.f16W400NearBlack(context),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
