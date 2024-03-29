import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesattabazar/screens/home_page/components/app_icon.dart';
import 'package:livesattabazar/screens/onboarding/components/text_fields.dart';

import '../../consts/app_drawer.dart';
import '../../consts/colors.dart';
import '../../consts/strings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: primaryColor,
        title: SizedBox(
          height: 100.sp,
          width: 100.sp,
          child: Image.asset(AppText.titleLogo),
        ), // Replace with your app's title
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu), // Hamburger menu icon
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppIcon(),
              const SizedBox(height: 20,),
              const Column(crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text("Change Email"),
                  SizedBox(height: 10,),
                  NormalTextField(icon: Icons.mail, hintText: "Enter New Email"),
                  SizedBox(height: 20,),
                  Text("Change Username"),
                  SizedBox(height: 10,),
                  NormalTextField(icon: Icons.verified_user, hintText: "Enter New Username"),
                  SizedBox(height: 20,),
                  Text("Change Phone number"),
                  SizedBox(height: 10,),
                  NormalTextField(icon: Icons.mail, hintText: "Enter New Email"),
                  SizedBox(height: 20,),
                  Text("New Password"),
                  SizedBox(height: 10,),
                  NormalTextField(icon: Icons.mail, hintText: "Enter New Email"),
                  SizedBox(height: 20,),
                  Text("Confirm Password"),
                  SizedBox(height: 10,),
                  NormalTextField(icon: Icons.mail, hintText: "Enter New Email"),

                ],
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize:
                  MaterialStateProperty.all(const Size(
                    double.infinity,
                    60,
                  )),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  backgroundColor:
                  MaterialStateProperty.all(Colors.blue),
                  foregroundColor:
                  MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {

                },
                child: const Text("Save"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
