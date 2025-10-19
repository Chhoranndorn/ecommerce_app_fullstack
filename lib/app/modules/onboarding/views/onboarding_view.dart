import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:e_commerce_app/util/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Register',
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Colors.black,
        ),
        skipTextButton: InkWell(
          onTap: () {
            Get.offAllNamed(Routes.LANGUAGE); // Skip button navigates to Home
          },
          child: const Text('Skip'),
        ),
        trailing: InkWell(
            onTap: () {
              Get.toNamed(Routes.SIGNIN);
            },
            child: Text('Login')),
        background: [
          Image.asset(
            Images.splashLogo,
            height: 700,
          ),
          Image.asset(Images.splashLogo),
        ],
        totalPage: 2,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Description Text 1'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Description Text 2'),
              ],
            ),
          ),
        ],
        onFinish: () {
          Get.offAllNamed(Routes.SIGNIN);
        },
      ),
    );
  }
}
