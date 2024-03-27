import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesattabazar/consts/app_drawer.dart';
import 'package:livesattabazar/consts/strings.dart';
import 'package:livesattabazar/screens/home_page/components/app_icon.dart';
import '../../consts/colors.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: SizedBox(
          height: 100.sp,
          width: 100.sp,
          child: Image.asset(AppText.titleLogo),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu), // Hamburger menu icon
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: AppDrawer(), // Removed 'const'
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppIcon(), // Removed 'const'
              SizedBox(height: 20.sp),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark ? Colors.white12 : primaryLight,
                  borderRadius: BorderRadius.circular(24.sp),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.sp),
                  child: Column(
                    children: [
                      Text(
                        AppText.aboutUs.toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          // Use text color based on current theme
                        ),
                      ),
                      SizedBox(height: 12.sp),
                      Text(
                        AppText.dummyText,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          // Use text color based on current theme
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
