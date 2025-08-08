import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:on_property/screens/onboarding/onboarding_screen1.dart';
import 'package:on_property/utils/colorscheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<Timer> init() async {
    return Timer(const Duration(seconds: 6), onDoneLoading);
  }

  onDoneLoading() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var status = _prefs.getBool('isLoggedIn') ?? false;

    if (mounted) {
      if (status) {
        Navigator.pushReplacementNamed(context, 'Dashboard');
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const IntroductionPage(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/splash_img (2).png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 80), // spacing from top
            // Image.asset(
            //   'assets/images/my_logo.jpg',
            //   height: 150,
            //   width: 150,
            //   color: Colors.white,
            // ),
            const SizedBox(height: 20),
            Spacer(),
            // You can add a loading indicator or slogan here if needed
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
