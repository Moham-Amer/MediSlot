import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_slot/core/constants/app_strings.dart';
import 'package:medi_slot/core/theme/app_colors.dart';
import 'package:medi_slot/core/theme/app_text_style.dart';
import 'package:medi_slot/main.dart';

class DarkModeScreen extends StatelessWidget {
  DarkModeScreen({super.key});

  ValueNotifier<bool> theme = ValueNotifier<bool>(false);
  bool changedTheme = false;

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
                  AppStrings.changeTheme.tr(),
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
                  valueListenable: theme,
                  builder: (context, value, child) {
                    return GestureDetector(
                      onTap: () {
                        if (theme.value == true) {
                          changedTheme = false;
                        } else if (theme.value == false) {
                          changedTheme = true;
                        }
                        theme.value = true;
                        themeNotifier.value = ThemeMode.light;
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
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              AppStrings.light.tr(),
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
                    valueListenable: theme,
                    builder: (context, value, child) {
                      return GestureDetector(
                        onTap: () {
                          if (theme.value == false) {
                            changedTheme = false;
                          } else if (theme.value == true) {
                            changedTheme = true;
                          }
                          theme.value = false;
                          themeNotifier.value = ThemeMode.dark;
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
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                AppStrings.dark.tr(),
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
          ],
        ),
      ),
    );
  }
}
