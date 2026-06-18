import 'package:fitbody_app/src/const/colors/AppColors.dart';
import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderButton({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            duration:  Duration(milliseconds: 300),
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? AppColors.yellow
                  : AppColors.black,
              border: Border.all(
                color: AppColors.white,
              ),
            ),
            child: Icon(
              icon,
              size: 70,
              color: isSelected
                  ? AppColors.black
                  : AppColors.white,
            ),
          ),
           SizedBox(height: 10),
          Text(
            text,
            style:  TextStyle(
              color: AppColors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}