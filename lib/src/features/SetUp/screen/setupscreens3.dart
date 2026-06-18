import 'package:fitbody_app/src/const/colors/AppColors.dart';
import 'package:fitbody_app/src/const/router/App_routers.dart';
import 'package:fitbody_app/src/features/SetUp/cubit/SetUpCubit.dart';
import 'package:fitbody_app/src/features/auth/widgets/CustomAuthButtomWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Setupscreens3 extends StatefulWidget {
  const Setupscreens3({super.key});

  @override
  State<Setupscreens3> createState() => _Setupscreens3State();
}

class _Setupscreens3State extends State<Setupscreens3> {
  int selectedAge = 28;

  late FixedExtentScrollController controller;

  final List<int> ages =
      List.generate(100, (index) => index + 1);

  @override
  void initState() {
    super.initState();

    controller = FixedExtentScrollController(
      initialItem: 27,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.black,
      body: SafeArea(
        child: Column(
          children: [

             SizedBox(height: 20),

            Padding(
              padding:
                   EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon:  Icon(
                      Icons.arrow_back_ios,
                      color:  AppColors.yellow,
                      size: 18,
                    ),
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

             SizedBox(height: 20),

             Text(
              "How Old Are You?",
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
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
            ),

             SizedBox(height: 70),

            Text(
              selectedAge.toString(),
              style:  TextStyle(
                fontSize: 70,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

             Icon(
              Icons.arrow_drop_up,
              color: AppColors.yellow,
              size: 50,
            ),

             SizedBox(height: 10),

            SizedBox(
              height: 90,
              child: Stack(
                children: [
                  Container(
                    height: 80,
                    color:  AppColors.purple,
                  ),

                  Center(
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 2,
                          height: 100,
                          color: AppColors.white,
                        ),
                         SizedBox(width: 75),
                        Container(
                          width: 2,
                          height: 100,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                  ),

                  ListWheelScrollView.useDelegate(
                    controller: controller,
                    itemExtent: 70,
                    diameterRatio: 20,
                    physics:
                         FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedAge = ages[index];
                      });
                    },
                    childDelegate:
                        ListWheelChildBuilderDelegate(
                      childCount: ages.length,
                      builder: (context, index) {
                        final isSelected =
                            ages[index] == selectedAge;

                        return Center(
                          child: Text(
                            ages[index].toString(),
                            style: TextStyle(
                              fontSize:
                                  isSelected ? 24 : 18,
                              fontWeight:
                                  FontWeight.bold,
                              color: isSelected
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

             Spacer(),

           CustomAuthButton(text: 'Continue', onPressed: () {
              Navigator.pushNamed(context, AppRouter.setup4);
           }),

             SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}