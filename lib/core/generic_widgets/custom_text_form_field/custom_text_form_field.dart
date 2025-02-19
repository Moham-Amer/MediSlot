import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medi_slot/core/constants/app_images.dart';
import 'package:medi_slot/core/constants/app_strings.dart';
import 'package:medi_slot/core/theme/app_text_style.dart';
import '../../theme/app_colors.dart';
import 'bloc/text_form_field_cubit.dart';
import 'bloc/text_form_field_state.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.nameController,
    required this.text,
    this.isPassword = false,
    this.isConfirmPassword = false,
    this.keyboardType,
    this.validatorType,
  });

  TextEditingController nameController;
  String text;
  bool isPassword;
  bool isConfirmPassword;
  TextInputType? keyboardType;
  String? validatorType;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;

    return BlocBuilder<TextFormFieldCubit, TextFormFieldState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 35.w,
                ),
                Text(
                  text.tr(),
                  style: AppTextStyle.f16W400NearBlack(context),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            SizedBox(
              width: 327.w,
              height: 48.h,
              child: TextFormField(
                validator: (value) {
                  if (validatorType == "name") {
                    if (value == null || value.isEmpty) {
                      return AppStrings.nameValidator.tr();
                    }
                    return null;
                  } else if (validatorType == "email") {
                    if (value == null ||
                        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return AppStrings.emailValidator.tr();
                    }
                    return null;
                  } else if (validatorType == "password") {
                    if (value == null || value.length < 8) {
                      return AppStrings.passwordValidator.tr();
                    }
                    return null;
                  }
                  return null;
                },
                style: AppTextStyle.f16W400NearBlack(context),
                keyboardType: keyboardType ?? TextInputType.text,
                controller: nameController,
                decoration: InputDecoration(
                  fillColor: appColors.lightGreyColor,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        BorderSide(color: appColors.mediumGreyColor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        BorderSide(color: appColors.mediumGreyColor, width: 1),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Visibility(
                      visible: isPassword || isConfirmPassword,
                      child: IconButton(
                        onPressed: () {
                          if (isPassword) {
                            context
                                .read<TextFormFieldCubit>()
                                .changeHiddenStatue();
                          } else if (isConfirmPassword) {
                            context
                                .read<TextFormFieldCubit>()
                                .changeConfirmHiddenStatue();
                          }
                        },
                        icon: isPassword
                            ? (context
                                    .read<TextFormFieldCubit>()
                                    .hiddenPassword)
                                ? SvgPicture.asset(
                                    AppImages.visibilityOff,
                                    height: 15.h,
                                    width: 19.w,
                          color:appColors.nearBlackColor,
                                  )
                                : SvgPicture.asset(
                                    AppImages.visibility,
                                    height: 24.h,
                                    width: 29.w,
                          color:appColors.nearBlackColor,
                                  )
                            : (isConfirmPassword)
                                ? (context
                                        .read<TextFormFieldCubit>()
                                        .hiddenConfirmPassword)
                                    ? SvgPicture.asset(
                                        AppImages.visibilityOff,
                                        height: 15.h,
                                        width: 19.w,
                                        color: appColors.nearBlackColor,
                                      )
                                    : SvgPicture.asset(
                                        AppImages.visibility,
                                        height: 24.h,
                                        width: 29.w,
                                        color: appColors.nearBlackColor,
                                      )
                                : const SizedBox.shrink(),
                      ),
                    ),
                  ),
                ),
                obscureText: isPassword
                    ? context.read<TextFormFieldCubit>().hiddenPassword
                    : isConfirmPassword
                        ? context
                            .read<TextFormFieldCubit>()
                            .hiddenConfirmPassword
                        : false,
              ),
            ),
          ],
        );
      },
    );
  }
}
