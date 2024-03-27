import 'package:flutter/material.dart';

import '../../../consts/colors.dart';


class CategoryBoxes extends StatelessWidget {
  const CategoryBoxes({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: primaryDark
      ),
      child:  Center(
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white
          ),

        ),
      ),
    );
  }
}