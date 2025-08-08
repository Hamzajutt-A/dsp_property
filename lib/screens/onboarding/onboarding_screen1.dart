import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:on_property/screens/sign_in.dart';
import 'package:on_property/utils/app_assets.dart';
import 'package:on_property/utils/colorscheme.dart';
import 'package:on_property/widgets/introduction_page_widget.dart';
import 'package:sizer/sizer.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  late int selectedPage;
  late final PageController _pageController;

  final pageCount = 3;

  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 🔹 Page View
          PageView(
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                selectedPage = page;
              });
            },
            children: [
              IndroductionPage(
                imagepath: AppAssets.onbordingImage1,
                title: "Smart Property, Smarter Future",
                description:
                    "Build lasting wealth through properties that appreciate over time.",
              ),
              IndroductionPage(
                imagepath: AppAssets.onbordingImage2,
                title: "Stable. Secure. Real Estate",
                description:
                    "Reliable returns, tangible assets, and a foundation for generations.",
              ),
              IndroductionPage(
                imagepath: AppAssets.onbordingImage3,
                title: "Grow with Every Square Foot",
                description:
                    "Find the right location, make the right decision, watch your portfolio grow.",
              ),
            ],
          ),

          // 🔹 Bottom Controls
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DotsIndicator(
                    dotsCount: pageCount,
                    position: selectedPage.toDouble(),
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(24.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: Colors.grey.shade300,
                      activeColor: primaryColor,
                    ),
                  ),
                  SizedBox(height: 5.h),

                  // 🔹 Navigation Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 🔹 Skip Button
                        GlowButton(
                          width: 40.w,
                          height: 45,
                          borderRadius: BorderRadius.circular(10),
                          glowColor: primaryColor.withOpacity(0.4),
                          color: primaryColor,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => SignIn()),
                            );
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              color: whitecolor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // 🔹 Next / Done Button
                        GlowButton(
                          width: 40.w,
                          height: 45,
                          borderRadius: BorderRadius.circular(10),
                          glowColor: primaryColor.withOpacity(0.4),
                          color: primaryColor,
                          onPressed: () {
                            if (selectedPage == pageCount - 1) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => SignIn()),
                              );
                            } else {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: Text(
                            selectedPage == pageCount - 1 ? "Done" : "Next",
                            style: TextStyle(
                              color: whitecolor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
