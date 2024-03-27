import 'package:flutter/material.dart';
import 'package:livesattabazar/screens/home_page/components/contact_buttons.dart';
import 'package:simple_icons/simple_icons.dart';

import '../../../consts/colors.dart';
import '../../../consts/strings.dart';


class CeoCards extends StatelessWidget {
  const CeoCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      color: primaryLightest,
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(AppText.ceoB,style: TextStyle(color: textColorPrimary),),
            const Text(AppText.ceoBDesig,style: TextStyle(color: textColorPrimary),),
            const SizedBox(height: 10,),
            const Text(AppText.dummyText2,style: TextStyle(color: textColorPrimary),),
            Text(AppText.phonenum.toString(),style: TextStyle(color: textColorPrimary),),
            const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: ContactButtons(icon1: SimpleIcons.whatsapp, icon2: Icons.call),
            )
          ],
        ),
      ),
    );
  }
}
