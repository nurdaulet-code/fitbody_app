import 'package:fitbody_app/gen/assets.gen.dart';
import 'package:fitbody_app/src/const/colors/AppColors.dart';
import 'package:fitbody_app/src/const/router/App_routers.dart';
import 'package:fitbody_app/src/features/auth/widgets/CustomAuthButtomWidget.dart';
import 'package:flutter/material.dart';

class Setupscreens1 extends StatefulWidget {
  const Setupscreens1({super.key});

  @override
  State<Setupscreens1> createState() => _Setupscreens1State();
}

class _Setupscreens1State extends State<Setupscreens1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.5,
              width: MediaQuery.sizeOf(context).width,
              child: Image.asset('assets/images/gym.png',fit: BoxFit.cover,),
            ),
            SizedBox(height: 10),
            Text('Consistency Is',style: TextStyle(color: AppColors.yellow,fontSize: 30,fontWeight: FontWeight.w500),),
            Text('The Key To Progress.',style: TextStyle(color: AppColors.yellow,fontSize: 30,fontWeight: FontWeight.w500),),
            Text('Dont  Give Up!',style: TextStyle(color: AppColors.yellow,fontSize: 30,fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Container(
              height: 130,
              width: MediaQuery.sizeOf(context).width,
              color: AppColors.purple,
              child: Column(
                children: [
                  SizedBox(height: 37),
                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit,',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: AppColors.black),),
                  Text('sed do eiusmod tempor incididunt ut labore et dolore ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: AppColors.black),),
                  Text('magna aliqua. ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: AppColors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            CustomAuthButton(text: 'Next', onPressed: (){
               Navigator.pushNamed(context, AppRouter.setup2);
            }),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}