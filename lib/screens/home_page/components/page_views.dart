import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashShow extends StatefulWidget {
  const SplashShow({super.key, required this.img});

  final String img;

  @override
  _SplashShowState createState() => _SplashShowState();
}

class _SplashShowState extends State<SplashShow> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          child: Container(
            margin: const EdgeInsets.all(30),
            height: 280.sp,
            width: 360.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: DecorationImage(image: AssetImage(widget.img), fit: BoxFit.cover),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x72000000),
                  blurRadius: 20,
                  offset: Offset(0, 7),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
              icon: Icon(
                CupertinoIcons.heart_fill,
                color: isLiked ? Colors.red : null,
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          ],
        )
      ],
    );
  }
}
