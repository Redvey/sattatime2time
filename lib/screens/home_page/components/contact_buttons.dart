import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../consts/colors.dart';
import '../../../consts/strings.dart';



class ContactButtons extends StatelessWidget {
  const ContactButtons({
    super.key, required this.icon1, required this.icon2,
  });

  final IconData icon1;
  final IconData icon2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Container(
          height: 50.sp,
          width: 150.sp,
          color: primaryLight,
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon1),
              const Text(AppText.whatsapp)
            ],
          ),
        ),
        Container(

          height: 50.sp,
          width: 150.sp,
          color: primaryLight,
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon2),
              const Text(AppText.callNow)
            ],
          ),
        ),
      ],
    );
  }
}