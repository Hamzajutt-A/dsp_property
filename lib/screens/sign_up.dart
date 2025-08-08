 
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:on_property/components/social_media_button.dart';
import 'package:on_property/utils/colorscheme.dart';
import 'package:on_property/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:on_property/components/reusable_textfield.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xfff3f3f4),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // 🔹 Background image
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/hero-two-bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // 🔹 Scrollable Signup Content
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),

                  // 🔹 Glowing Signup Form
                  GlowContainer(
                    glowColor: primaryColor.withOpacity(0.3),
                    blurRadius: 20,
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    spreadRadius: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlowText(
                            'Create an Account',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                            glowColor: primaryColor,
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Create your new account',
                            style: TextStyle(color: Colors.black54),
                          ),
                          Container(
                            height: 4,
                            width: 70,
                            margin: const EdgeInsets.only(top: 10.0, bottom: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: primaryColor,
                            ),
                          ),

                          const Text(
                            'Full Name',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          const GlowingTextField(hint: 'Enter Full Name'),
                          const SizedBox(height: 20),

                          const Text(
                            'Email',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          const GlowingTextField(hint: 'Enter Email Address'),
                          const SizedBox(height: 20),

                          const Text(
                            'Password',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          const GlowingTextField(hint: 'Enter Password'),
                          const SizedBox(height: 20),

                          const Text(
                            'Confirm Password',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          const GlowingTextField(hint: 'Confirm Password'),
                          const SizedBox(height: 30),

                          // 🔹 Glowing Register Button
                           CustomButton(
                            title: "Register",
                            callback: () async {
                              Navigator.pushNamed(context, 'Dashboard');
                              SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();
                              _prefs.setBool("isLoggedIn", true);
                            },
                          ),
               


                          const SizedBox(height: 25),
                          socialMediaButton(
                            img: 'assets/icons/google.png',
                            callback: () {},
                            text: 'Continue With Google',
                            color: Colors.grey.shade100,
                          ),

                          const SizedBox(height: 25),

                          // 🔹 Already have an account?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, color: Colors.black),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, 'SignIn');
                                },
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
