import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyle {
  static TextStyle f12W400BrighterNearBlack(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      color: colors.brighterNearBlackColor,
    );
  }

  static TextStyle f12W400NearBlack(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      color: colors.nearBlackColor,
    );
  }

  static TextStyle f12W400PrimaryColor(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      color: colors.primaryColor,
    );
  }

  static TextStyle f14W400NearBlack(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      color: colors.nearBlackColor,
    );
  }

  static TextStyle f16W700DarkWhite(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16.sp,
      color: colors.lightGreyColor,
    );
  }

  static TextStyle f16W700NearBlack(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16.sp,
      color: colors.nearBlackColor,
    );
  }

  static TextStyle f16W400NearBlack(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      color: colors.nearBlackColor,
    );
  }

  static TextStyle f16W400DarkWhite(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      color: colors.lightGreyColor,
    );
  }

  static TextStyle f16W400DarkGrey(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      color: colors.darkGreyColor,
    );
  }

  static TextStyle f20W700NearBlack(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20.sp,
      color: colors.nearBlackColor,
    );
  }

  static TextStyle f20W700DarkWhite(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20.sp,
      color: colors.lightGreyColor,
    );
  }

  static TextStyle f24W700NearBlack(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24.sp,
      color: colors.nearBlackColor,
    );
  }

  static TextStyle f32W700NearBlack(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 32.sp,
      color: colors.nearBlackColor,
    );
  }


  static TextStyle f40W700NearBlack(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 40.sp,
      color: colors.nearBlackColor,
    );
  }

}
