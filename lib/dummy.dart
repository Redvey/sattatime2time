import 'package:flutter/material.dart';
import 'package:livesattabazar/consts/app_drawer.dart';



class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      drawer: AppDrawer(),
    );
  }
}
