import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_slot/core/theme/app_text_style.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.buttonColor,
      required this.textColor});

  final Color buttonColor;
  final String text;
  final Function onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
      },
      color: buttonColor,
      minWidth: 328.w,
      height: 48.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: AppTextStyle.f16W700DarkWhite(context).copyWith(color: textColor),
      ),
    );
  }
}
