import 'package:fitbody_app/src/const/router/App_routers.dart';
import 'package:fitbody_app/src/features/auth/widgets/CustomAuthButtomWidget.dart';
import 'package:flutter/material.dart';
import 'package:fitbody_app/src/const/colors/AppColors.dart';

class Setupscreens5 extends StatefulWidget {
  @override
  State<Setupscreens5> createState() => _Setupscreens5State();
}

class _Setupscreens5State extends State<Setupscreens5> {
  int height = 165;

  late FixedExtentScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = FixedExtentScrollController(
      initialItem: height - 100,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.yellow,
                        size: 14,
                      ),
                      Text(
                        "Back",
                        style: TextStyle(
                          color: AppColors.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "What Is Your Height?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore\nmagna aliqua.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 35),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: height.toString(),
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 58,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: " Cm",
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _heightText(height + 10),
                          _heightText(height + 5),
                          _heightText(height),
                          _heightText(height - 5),
                          _heightText(height - 10),
                        ],
                      ),
                    ),
                    SizedBox(width: 18),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 58,
                          height: 280,
                          decoration: BoxDecoration(
                            color: AppColors.purple,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        SizedBox(
                          width: 58,
                          height: 280,
                          child: ListWheelScrollView.useDelegate(
                            controller: controller,
                            itemExtent: 12,
                            physics: FixedExtentScrollPhysics(),
                            perspective: 0.002,
                            diameterRatio: 100,
                            onSelectedItemChanged: (index) {
                              setState(() {
                                height = index + 100;
                              });
                            },
                            childDelegate: ListWheelChildBuilderDelegate(
                              childCount: 201,
                              builder: (context, index) {
                                bool major = index % 5 == 0;

                                return Center(
                                  child: Container(
                                    width: major ? 22 : 12,
                                    height: 1.5,
                                    color: AppColors.white,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 58,
                          height: 2,
                          color: AppColors.yellow,
                        ),
                        Positioned(
                          right: -18,
                          child: Icon(
                            Icons.arrow_left,
                            color: AppColors.yellow,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
           CustomAuthButton(text: 'Continue', onPressed: () {
            Navigator.pushNamed(context, AppRouter.setup6);
           }),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _heightText(int value) {
    return Text(
      value.toString(),
      style: TextStyle(
        color: value == height
            ? AppColors.white
            : AppColors.grey,
        fontSize: value == height ? 22 : 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}