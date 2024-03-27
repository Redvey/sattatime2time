
import 'package:flutter/material.dart';



import 'dart:async';

import 'package:livesattabazar/screens/home_page/components/page_views.dart';


class PageViewPages extends StatefulWidget {
  const PageViewPages({Key? key}) : super(key: key);

  @override
  State<PageViewPages> createState() => _PageViewPagesState();
}

class _PageViewPagesState extends State<PageViewPages> {
  final _controller = PageController();
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoPageChange(); // Start automatic page change
  }

  @override
  void dispose() {
    _stopAutoPageChange(); // Stop automatic page change
    _controller.dispose();
    super.dispose();
  }

  void _startAutoPageChange() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        if (_currentPage < 5) {
          _currentPage++; // Change to the next page index
        } else {
          _currentPage = 0; // Go back to the first page
        }
        _controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 140),
          curve: Curves.ease,
        );
      });
    });
  }

  void _stopAutoPageChange() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children:  [
        const SplashShow(img: "assets/images/img_2.png"),
        const SplashShow(img: "assets/images/img_3.png"),
        const SplashShow(img: "assets/images/img_4.png"),
        const SplashShow(img: "assets/images/img_4.png"),
        const SplashShow(img: "assets/images/img_4.png"),

      ],
    );
  }
}
