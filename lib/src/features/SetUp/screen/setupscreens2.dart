import 'package:fitbody_app/src/const/colors/AppColors.dart';
import 'package:fitbody_app/src/const/router/App_routers.dart';
import 'package:fitbody_app/src/features/SetUp/widgets/GenderButtonWidgets.dart';
import 'package:fitbody_app/src/features/auth/widgets/CustomAuthButtomWidget.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class Setupscreens2 extends StatefulWidget {
  const Setupscreens2({super.key});

  @override
  State<Setupscreens2> createState() => _Setupscreens2State();
}

class _Setupscreens2State extends State<Setupscreens2> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
             SizedBox(height: 20),
        
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child:  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Back",
                    style: TextStyle(color: AppColors.yellow)),
                ),
                ),
              ),
            
        
             SizedBox(height: 20),
        
             Text(
              "What's Your Gender",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
        
             SizedBox(height: 10),
            Container(
             height: 90,
             width: MediaQuery.sizeOf(context).width,
             color: AppColors.purple,
              child:  Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "sed do eiusmod tempor incididunt ut labore et dolore ",
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "magna aliqua. ",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
        
             SizedBox(height: 40),
        
            GenderButton(
              icon: Icons.male,
              text: "Male",
              isSelected: selectedGender == Gender.male,
              onTap: () {
                setState(() {
                  selectedGender = Gender.male;
                });
              },
            ),
        
             SizedBox(height: 30),
        
            GenderButton(
              icon: Icons.female,
              text: "Female",
              isSelected: selectedGender == Gender.female,
              onTap: () {
                setState(() {
                  selectedGender = Gender.female;
                });
              },
            ),
        
             Spacer(),
        
            CustomAuthButton(text: 'Continue', onPressed: () {
                Navigator.pushNamed(context, AppRouter.setup3);
            }),
        
             SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}