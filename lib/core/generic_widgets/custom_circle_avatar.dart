import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_slot/core/theme/app_colors.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    required this.radius,
    required this.width,
    required this.height,
    required this.image,
  });

  final double radius;
  final double width;
  final double height;
  final String image;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return CircleAvatar(
      backgroundColor: appColors.mediumGreyColor,
      radius: radius,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
