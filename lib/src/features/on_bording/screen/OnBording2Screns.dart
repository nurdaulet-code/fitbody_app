import 'package:fitbody_app/src/const/colors/AppColors.dart';
import 'package:fitbody_app/src/const/router/App_routers.dart';
import 'package:fitbody_app/src/features/on_bording/screen/OnBording3Screns.dart';
import 'package:fitbody_app/src/features/on_bording/widgets/LogoWidgets.dart';
import 'package:flutter/material.dart';

class Onbording2Screens extends StatefulWidget {
  const Onbording2Screens({super.key});

  @override
  State<Onbording2Screens> createState() => _Onbording2ScreensState();
}

class _Onbording2ScreensState extends State<Onbording2Screens> {

  @override
  void initState() {
    super.initState();

     Future.delayed( Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(
          context,
          AppRouter.onboarding3,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1591804671002-b24e17464f9b?w=600&auto=format&fit=crop&q=60',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to',
              style: TextStyle(
                color: AppColors.yellow,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
             SizedBox(height: 10),
             LogoWidgets(
              GroupWidth: 182,
              GroupHeight: 84,
              FITBODYWidth: 374,
              FITBODYHeight: 81,
            ),
          ],
        ),
      ),
    );
  }
}