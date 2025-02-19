import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_slot/core/constants/app_images.dart';
import 'package:medi_slot/core/constants/app_strings.dart';
import 'package:medi_slot/core/generic_widgets/custom_circle_avatar.dart';
import 'package:medi_slot/core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:medi_slot/core/generic_widgets/main_button.dart';
import 'package:medi_slot/core/theme/app_colors.dart';
import 'package:medi_slot/core/theme/app_text_style.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  TextEditingController nameController = TextEditingController();
  final ValueNotifier<String> dateController = ValueNotifier<String>("");
  ValueNotifier<bool> gender = ValueNotifier<bool>(false);
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

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
                  width: 138.w,
                ),
                SizedBox(
                  width: 102.w,
                  height: 102.h,
                  child: Stack(
                    children: [
                      CustomCircleAvatar(
                        radius: 58,
                        width: 99,
                        height: 99,
                        image: AppImages.avatar,
                      ),
                      Positioned(
                        top: 76.h,
                        bottom: 0.h,
                        right: 8.w,
                        left: 68.w,
                        child: Icon(Icons.add_circle_outline_rounded),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 58.h,
            ),
            CustomTextFormField(
              nameController: nameController,
              text: AppStrings.editName.tr(),
            ),
            SizedBox(
              height: 21.h,
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 35.w,
                    ),
                    Text(
                      AppStrings.dateOfBirth.tr(),
                      style: AppTextStyle.f16W400NearBlack(context),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                ValueListenableBuilder<String>(
                    valueListenable: dateController,
                    builder: (context, value, child) {
                      return SizedBox(
                        width: 327.w,
                        height: 48.h,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: AppTextStyle.f16W400NearBlack(context),
                          decoration: InputDecoration(
                            fillColor: appColors.lightGreyColor,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: appColors.mediumGreyColor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: appColors.mediumGreyColor, width: 1),
                            ),
                            suffixIcon: IconButton(
                              iconSize: 30.sp,
                              onPressed: () {
                                _selectDate(context);
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                              ),
                            ),
                          ),
                          readOnly: true,
                          controller: TextEditingController(text: value),
                        ),
                      );
                    }),
              ],
            ),
            SizedBox(
              height: 21.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 24.w,
                ),
                ValueListenableBuilder(
                  valueListenable: gender,
                  builder: (context, value, child) {
                    return GestureDetector(
                      onTap: () {
                        gender.value = true;
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
                              gender.value
                                  ? Icons.circle
                                  : Icons.circle_outlined,
                              color: gender.value
                                  ? appColors.primaryColor
                                  : appColors.nearBlackColor,
                              size: 13.sp,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              AppStrings.male.tr(),
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
                    valueListenable: gender,
                    builder: (context, value, child) {
                      return GestureDetector(
                        onTap: () {
                          gender.value = false;
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
                                gender.value
                                    ? Icons.circle_outlined
                                    : Icons.circle,
                                color: gender.value
                                    ? appColors.nearBlackColor
                                    : appColors.primaryColor,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                AppStrings.female.tr(),
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
              height: 21.h,
            ),
            CustomTextFormField(
              nameController: emailController,
              text: AppStrings.editEmail,
            ),
            SizedBox(
              height: 21.h,
            ),
            CustomTextFormField(
                nameController: phoneNumberController,
                text: AppStrings.phoneNumber),
            SizedBox(
              height: 70.h,
            ),
            MainButton(
                text: AppStrings.save.tr(),
                onPressed: () {
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

  Future<void> _selectDate(dynamic context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      dateController.value = pickedDate.toString().split(" ")[0];
    }
  }
}
