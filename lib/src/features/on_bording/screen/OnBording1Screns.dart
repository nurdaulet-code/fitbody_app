import 'package:fitbody_app/src/const/colors/AppColors.dart';
import 'package:fitbody_app/src/const/router/App_routers.dart';
import 'package:flutter/material.dart';

class OnBording1Screns extends StatefulWidget {
  const OnBording1Screns({super.key});

  @override
  State<OnBording1Screns> createState() => _OnBording1ScrensState();
}

class _OnBording1ScrensState extends State<OnBording1Screns> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(
          context,
          AppRouter.onboarding2,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Group.png',
              width: 135,
              height: 63,
            ),
             SizedBox(height: 12),
            Image.asset(
              'assets/images/FITBODY.png',
              width: 276,
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}