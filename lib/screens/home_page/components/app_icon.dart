import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../consts/strings.dart';



class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
          width: 100,
          child: RiveAnimation.asset("assets/animation/crown-rotating.riv"),
        ),
        Text(AppText.title.toUpperCase())
      ],
    );
  }
}