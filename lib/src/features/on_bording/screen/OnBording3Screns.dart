import 'package:fitbody_app/src/const/colors/AppColors.dart';
import 'package:fitbody_app/src/features/on_bording/models/onbording_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';  

class Onbording3screns extends StatefulWidget {
  const Onbording3screns({super.key});

  @override
  State<Onbording3screns> createState() => _Onbording3scrensState();
}

class _Onbording3scrensState extends State<Onbording3screns> {
  final PageController _controller = PageController();
  int currentPage = 0;

  void nextPage() {
    if (currentPage == onboardingData.length - 1) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      _controller.nextPage(
        duration:  Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skip() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              final item = onboardingData[index];

              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: AppColors.black.withOpacity(0.4),
                      child: Container(
                          height: 170,
                          width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          
                        
                          color: AppColors.purple,
                          
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              
                              item.icon,
                              width: 38,
                              height: 43,
                            ),
                             SizedBox(height: 20),
                            Text(
                              item.title,
                              style:  TextStyle(
                                color: AppColors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                               SizedBox(height: 10),
                            Text(
                              item.description,
                              style:  TextStyle(
                                fontSize: 20,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
SizedBox(
  width: 211,
  height: 44,
  child: ElevatedButton(
    onPressed: nextPage,
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.grey.withOpacity(0.6), 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
    ),
    child: Text(
      currentPage == onboardingData.length - 1
          ? "Get Started"
          : "Next",
      style:  TextStyle(
        color: AppColors.black, 
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
),
                    
                  ]
                ),
                
              );
              
            },
          ),
          

          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: skip,
                child:  Text(
                  "Skip",
                  style: TextStyle(color: AppColors.yellow, fontSize: 18,fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}