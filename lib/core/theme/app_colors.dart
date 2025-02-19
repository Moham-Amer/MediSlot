import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color.fromARGB(255, 66, 155, 156);
  static const Color nearBlackColor = Color.fromARGB(255, 21, 21, 21);
  static const Color darkGreyColor = Color.fromARGB(255, 64, 64, 64);
  static const Color lightGreyColor = Color.fromARGB(255, 249, 249, 249);
  static const Color mediumGreyColor = Color.fromARGB(255, 217, 217, 217);
  static const Color snowColor = Color.fromARGB(255, 234, 234, 234);
  static const Color brighterNearBlackColor = Color.fromARGB(255, 26, 26, 26);
}

class CustomColors extends ThemeExtension<CustomColors> {
  final Color primaryColor;
  final Color nearBlackColor;
  final Color darkGreyColor;
  final Color lightGreyColor;
  final Color mediumGreyColor;
  final Color snowColor;
  final Color brighterNearBlackColor;

  const CustomColors({
    required this.primaryColor,
    required this.nearBlackColor,
    required this.darkGreyColor,
    required this.lightGreyColor,
    required this.mediumGreyColor,
    required this.snowColor,
    required this.brighterNearBlackColor,
  });

  @override
  CustomColors copyWith({
    Color? primaryColor,
    Color? nearBlackColor,
    Color? darkGreyColor,
    Color? lightGreyColor,
    Color? mediumGreyColor,
    Color? snowColor,
    Color? brighterNearBlackColor,
  }) {
    return CustomColors(
      primaryColor: primaryColor ?? this.primaryColor,
      nearBlackColor: nearBlackColor ?? this.nearBlackColor,
      darkGreyColor: darkGreyColor ?? this.darkGreyColor,
      lightGreyColor: lightGreyColor ?? this.lightGreyColor,
      mediumGreyColor: mediumGreyColor ?? this.mediumGreyColor,
      snowColor: snowColor ?? this.snowColor,
      brighterNearBlackColor:
          brighterNearBlackColor ?? this.brighterNearBlackColor,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    return this;
  }

  static const lightCustomColors  = CustomColors(
    primaryColor: AppColors.primaryColor,
    nearBlackColor: AppColors.nearBlackColor,
    darkGreyColor: AppColors.darkGreyColor,
    lightGreyColor: AppColors.lightGreyColor,
    mediumGreyColor: AppColors.mediumGreyColor,
    snowColor: AppColors.snowColor,
    brighterNearBlackColor: AppColors.brighterNearBlackColor,
  );
  static const darkCustomColors  = CustomColors(
    primaryColor: Color.fromARGB(255, 33, 77, 78),
    nearBlackColor: Color.fromARGB(255, 234, 234, 234),
    darkGreyColor: Color.fromARGB(255, 217, 217, 217),
    lightGreyColor: Color.fromARGB(255, 33, 33, 33),
    mediumGreyColor: Color.fromARGB(255, 64, 64, 64),
    snowColor: Color.fromARGB(255, 21, 21, 21),
    brighterNearBlackColor: Color.fromARGB(255, 249, 249, 249),
  );
}
