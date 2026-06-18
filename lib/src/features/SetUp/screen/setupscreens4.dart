import 'package:fitbody_app/src/const/colors/AppColors.dart';
import 'package:fitbody_app/src/const/router/App_routers.dart';
import 'package:fitbody_app/src/features/SetUp/cubit/SetUpCubit.dart';
import 'package:fitbody_app/src/features/auth/widgets/CustomAuthButtomWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Setupscreens4 extends StatefulWidget {
  @override
  State<Setupscreens4> createState() => _Setupscreens4State();
}

class _Setupscreens4State extends State<Setupscreens4> {
  bool isKg = true;
  double selectedWeight = 75;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
                
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                        size: 18,
                      ),
                    ),
                    Text(
                      "Back",
                      style: TextStyle(
                        color: AppColors.yellow,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
                
              SizedBox(height: 30),
                
              Text(
                "What Is Your Weight?",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
                
              SizedBox(height: 20),
                
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                ),
              ),
                
              SizedBox(height: 50),
                
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isKg = true;
                          });
                        },
                        child: Center(
                          child: Text(
                            "KG",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 36,
                      color: AppColors.black,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isKg = false;
                          });
                        },
                        child: Center(
                          child: Text(
                            "LB",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
                
              SizedBox(height: 50),
                
              Text(
                selectedWeight.round().toString(),
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                ),
              ),
                
              SizedBox(height: 20),
                
              SizedBox(
                height: 120,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 40,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 80,
                        color: AppColors.purple,
                      ),
                    ),
                
                    Positioned(
                      top: 10,
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 50,
                        color: AppColors.white,
                      ),
                    ),
                
                    ListWheelScrollView.useDelegate(
                      controller: FixedExtentScrollController(
                        initialItem: selectedWeight.toInt(),
                      ),
                      itemExtent: 70,
                      diameterRatio: 10,
                      physics: FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedWeight = index.toDouble();
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 200,
                        builder: (context, index) {
                          bool selected =
                              index == selectedWeight.round();
                
                          return Center(
                            child: Text(
                              index.toString(),
                              style: TextStyle(
                                color: selected
                                    ? AppColors.white
                                    : AppColors.white,
                                fontSize: selected ? 26 : 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
                
              SizedBox(height: 40),
                
              Icon(
                Icons.arrow_drop_up,
                size: 50,
                color: AppColors.white,
              ),
            SizedBox(height: 30),
                
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    selectedWeight.round().toString(),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Text(
                      isKg ? "kg" : "lb",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
                
            SizedBox(height: 25),
           CustomAuthButton(text: 'Continue', onPressed: () {
             Navigator.pushNamed(context, AppRouter.setup5);
           }),
                
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}