import 'package:fitbody_app/gen/assets.gen.dart';
import 'package:fitbody_app/src/const/colors/AppColors.dart';
import 'package:fitbody_app/src/features/home/screen/HomeScrens.dart';
import 'package:fitbody_app/src/features/profile/screen/profilescreens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  final pages = [
     Homescrens(),
     Center(child: Text("Search")),
     Center(child: Text("Stars")),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: pages[index],

      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: index,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
       
       items: [
        
 BottomNavigationBarItem(
  backgroundColor: AppColors.purple,
  icon: SvgPicture.asset(
    Assets.icons.home,
    width: 24,
    height: 24,
  ),
  label: 'Home',
 ),
          BottomNavigationBarItem(
             backgroundColor: AppColors.purple,
  icon: SvgPicture.asset(
    Assets.icons.buttom,
    width: 24,
    height: 24,
  ),
  label: 'Resources Switch',
          ),
           BottomNavigationBarItem(
             backgroundColor: AppColors.purple,
  icon: SvgPicture.asset(
    Assets.icons.stars,
    width: 24,
    height: 24,
  ),
  label: 'Stars',
          ),
           BottomNavigationBarItem(
             backgroundColor: AppColors.purple,
  icon: SvgPicture.asset(
    Assets.icons.support,
    width: 24,
    height: 24,
  ),
  label: 'Profile',
          ),
        
        ],
      ),
    );
  }
}