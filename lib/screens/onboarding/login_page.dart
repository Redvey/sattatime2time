import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:livesattabazar/screens/home_page/home.dart';
import 'package:livesattabazar/screens/onboarding/forgot_password.dart';
import 'package:livesattabazar/screens/onboarding/register_page.dart';
import 'package:provider/provider.dart';

import '../../provider/themes_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final nameFormatter = FilteringTextInputFormatter.allow(RegExp(r'^(\w+\s?){1,3}$'));
  final passwordFormatter = FilteringTextInputFormatter.allow(RegExp(r'^.{0,8}$'));
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> loginUser(String username, String password) async {
    final url = Uri.parse('https://sattat2t.com/API/login.php');
    final response = await http.post(url, body: {
      'username': username,
      'password': password,
    });
    print('HTTP Error: ${response.statusCode}');
    if (response.statusCode == 200) {

      final responseData = json.decode(response.body);
      if (responseData['message'] == 'Login successful') {
        // Navigate to home page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password')),
        );
      }
    } else {
      // Handle other status codes
      print('HTTP Error: ${response.statusCode}');
    }
  }

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
                padding: EdgeInsets.all(40.sp),
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
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                "L O G I N",
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 24.sp),
                            TextField(
                              controller: _usernameController,
                              inputFormatters: [nameFormatter],
                              enabled: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50.sp),
                                  ),
                                ),
                                prefixIcon: Icon(Icons.person),
                                hintText: "Username",
                              ),
                            ),
                            SizedBox(height: 12.sp),
                            TextField(
                              controller: _passwordController,
                              inputFormatters: [passwordFormatter],
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50.sp),
                                  ),
                                ),
                                prefixIcon: const Icon(Icons.password),
                                hintText: "Password",
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12.sp),
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize:
                                MaterialStateProperty.all(Size(
                                  double.infinity,
                                  60.sp,
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
                                final username = _usernameController.text.trim();
                                final password = _passwordController.text.trim();
                                if (username.isEmpty || password.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Username and Password are required')),
                                  );
                                } else {
                                  // Call loginUser function
                                  loginUser(username, password);
                                }
                              },
                              child: const Text("Login"),
                            ),
                            SizedBox(height: 6),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ForgotPassword()),
                                );
                              },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpPage()),
                        );
                      },
                      child: const Row(
                        children: [
                          Text(
                            "Not Yet Registered?",
                            style: TextStyle(color: Colors.black45),
                          ),
                          Text(
                            "Signup Now!",
                            style: TextStyle(color: Colors.red),
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



