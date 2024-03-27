import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:livesattabazar/screens/onboarding/login_page.dart';
import 'package:provider/provider.dart';

import '../../consts/strings.dart';
import '../../provider/themes_provider.dart';
import 'components/text_fields.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Declare controllers for text fields
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _phoneNoController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    // Custom text formatter for phone number with only numbers
    final phoneNumberFormatter = FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$'));
    final phoneLengthFormatter = LengthLimitingTextInputFormatter(12); // Limit the length to 12 characters

    final List<TextInputFormatter> phoneFormatters = [
      phoneNumberFormatter,
      phoneLengthFormatter,
    ];

    Future<void> signUpUser(String username, String mobile, String email, String password) async {
      final url = Uri.parse('https://sattat2t.com/API/user_register.php');
      final response = await http.post(url, body: {
        'username': username,
        'mobile': mobile,
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'])),
        );
        if (responseData['message'] == 'Registration Successful') {
          // Navigate to login page after successful registration
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }
      } else {
        // Handle other status codes
        print('HTTP Error: ${response.statusCode}');
      }
    }

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
                padding: EdgeInsets.all(40.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 500.sp,
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
                        padding: EdgeInsets.all(24.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                AppText.createAccount,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(height: 12.sp),
                            NormalTextField(
                              icon: Icons.person,
                              hintText: "Enter Username",
                              controller: _usernameController,
                              inputFormatter: [
                                FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9\s]*$')), // Disallow special characters
                              ],
                            ),
                            SizedBox(height: 12.sp),
                            NormalTextField(
                              icon: Icons.phone,
                              hintText: "Enter Phone No.",
                              controller: _phoneNoController,
                              inputFormatter: phoneFormatters, // Apply phone number formatter
                            ),
                            SizedBox(height: 12.sp),
                            NormalTextField(
                              icon: Icons.mail,
                              hintText: "Enter Email",
                              controller: _emailController,
                              validator: (value) {
                                if (value != null && !value.contains('@')) {
                                  return 'Enter Valid Email';
                                }
                                return ''; // Return null when validation succeeds
                              },
                            ),
                            SizedBox(height: 12.sp),
                            NormalTextField(
                              icon: Icons.password,
                              hintText: "Enter Password",
                              controller: _passwordController,
                              validator: (value) {
                                if (value != null && (value.length < 8 || !RegExp(r'^[a-zA-Z0-9]*$').hasMatch(value))) {
                                  return 'Password must contain 8 characters and be alphanumeric';
                                }
                                return ''; // Return null when validation succeeds
                              },
                            ),
                            SizedBox(height: 12.sp),
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(Size(double.infinity, 60.sp)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.sp),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(Colors.blue),
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                              ),
                              onPressed: () {
                                // Check if any field is empty
                                final username = _usernameController.text.trim();
                                final phoneNo = _phoneNoController.text.trim();
                                final email = _emailController.text.trim();
                                final password = _passwordController.text.trim();

                                if (username.isEmpty || phoneNo.isEmpty || email.isEmpty || password.isEmpty) {
                                  // Show an error message (e.g., Snackbar) indicating that all fields are required
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('All fields are required')),
                                  );
                                } else {
                                  // Call signUpUser function
                                  signUpUser(username, phoneNo, email, password);
                                }
                              },
                              child: const Text("Sign up"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.sp),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "Already Registered?",
                            style: TextStyle(color: Colors.black45, fontSize: 14.sp),
                          ),
                          Text(
                            "Login Now!",
                            style: TextStyle(color: Colors.red, fontSize: 14.sp),
                          ),
                        ],
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
