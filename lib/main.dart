import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesattabazar/firebase_options.dart';
import 'package:livesattabazar/provider/themes_provider.dart';
import 'package:livesattabazar/screens/onboarding/login_page.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await Future.delayed(
  //   const Duration(seconds: 1),
  // );
  // FlutterNativeSplash.remove();
  await Firebase.initializeApp(
    options:  DefaultFirebaseOptions.currentPlatform
  );
  runApp(ChangeNotifierProvider(
      create: (context)=> ThemeProvider(),
      child: const LiveSata()));
}

class LiveSata extends StatelessWidget {
  const LiveSata({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(

        theme: Provider.of<ThemeProvider>(context).themeData,
        home: const LoginPage(),
      ),
    );
  }
}


