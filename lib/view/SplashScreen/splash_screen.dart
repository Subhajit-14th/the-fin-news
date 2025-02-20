import 'package:flutter/material.dart';
import 'package:the_fin_news/view/RootScreen/root_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
    Future.delayed(
      Duration(seconds: 4),
      () {
        if (mounted) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RootScreen()));
        }
      },
    );
  }

  void _startAnimation() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 3),
          opacity: _opacity,
          child: Image.asset(
            'assets/app_logo/app_logo.jpg',
            width: double.infinity,
            height: 180,
          ),
        ),
      ),
    );
  }
}
