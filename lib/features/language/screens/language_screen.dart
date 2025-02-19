import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_slot/core/constants/app_strings.dart';
import 'package:medi_slot/core/generic_widgets/main_button.dart';
import 'package:medi_slot/core/theme/app_colors.dart';
import 'package:medi_slot/core/theme/app_text_style.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({super.key});

  ValueNotifier<bool> language = ValueNotifier<bool>(false);
  bool changedLanguage = false;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 48.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 24.w,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios_new_outlined),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 53.w,
                ),
                Text(
                  AppStrings.changeLanguage.tr(),
                  style: AppTextStyle.f32W700NearBlack(context),
                ),
              ],
            ),
            SizedBox(
              height: 320.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 24.w,
                ),
                ValueListenableBuilder(
                  valueListenable: language,
                  builder: (context, value, child) {
                    return GestureDetector(
                      onTap: () {
                        if (language.value == true) {
                          changedLanguage = false;
                        } else if (language.value == false) {
                          changedLanguage = true;
                        }
                        language.value = true;
                      },
                      child: Container(
                        width: 163.5.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: appColors.lightGreyColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: appColors.mediumGreyColor,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 54.w,
                            ),
                            Icon(
                              language.value
                                  ? Icons.circle
                                  : Icons.circle_outlined,
                              color: language.value
                                  ? appColors.primaryColor
                                  : appColors.nearBlackColor,
                              size: 13.sp,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              AppStrings.arabic.tr(),
                              style: AppTextStyle.f16W400NearBlack(context),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 4.w,
                ),
                ValueListenableBuilder(
                    valueListenable: language,
                    builder: (context, value, child) {
                      return GestureDetector(
                        onTap: () {
                          if (language.value == false) {
                            changedLanguage = false;
                          } else if (language.value == true) {
                            changedLanguage = true;
                          }
                          language.value = false;
                        },
                        child: Container(
                          width: 163.5.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: appColors.lightGreyColor,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: appColors.mediumGreyColor,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 45.w,
                              ),
                              Icon(
                                size: 13.sp,
                                language.value
                                    ? Icons.circle_outlined
                                    : Icons.circle,
                                color: language.value
                                    ? appColors.nearBlackColor
                                    : appColors.primaryColor,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                AppStrings.english.tr(),
                                style: AppTextStyle.f16W400NearBlack(context),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
            SizedBox(
              height: 232.h,
            ),
            MainButton(
                text: AppStrings.save.tr(),
                onPressed: () {
                  if (!language.value) {
                    context.setLocale(Locale('en'));
                  } else if (language.value) {
                    context.setLocale(Locale('ar'));
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        AppStrings.saveMessage.tr(),
                      ),
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
