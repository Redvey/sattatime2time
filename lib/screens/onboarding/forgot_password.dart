import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesattabazar/consts/strings.dart';
import 'package:livesattabazar/screens/onboarding/components/text_fields.dart';
import 'package:provider/provider.dart';

import '../../provider/themes_provider.dart';
import '../home_page/home.dart';


class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<ThemeProvider>(
        builder: (context, instance, _) {
          return Stack(
            children: [
              Positioned(
                child: Image.asset("assets/images/img.png"),
              ),
              Padding(
                padding:  EdgeInsets.all(40.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 400.sp,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x28000000),
                            blurRadius: 11.59,
                            offset: Offset(1.45, 1.45),
                            spreadRadius: 0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(24.sp),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(24.0.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Center(
                              child: Text(
                                AppText.forgetPasswordSubTitle,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                             SizedBox(height: 24.sp),
                             NormalTextField(icon: Icons.mail, hintText: "Enter Registered Mail Id"),
                             SizedBox(height: 12.sp),
                             NormalTextField(icon: Icons.numbers, hintText: "Enter OTP"),
                             SizedBox(height: 12.sp),
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize:
                                MaterialStateProperty.all( Size(
                                  double.infinity,
                                  60.sp,
                                )),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.sp),
                                  ),
                                ),
                                backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                                foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HomePage()),
                                );
                              },
                              child:  Text("Login",style: TextStyle(fontSize: 14.sp),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


