import 'package:flutter/material.dart';

class LogoWidgets extends StatelessWidget {
  final double GroupWidth;
  final double GroupHeight;
  final double FITBODYWidth;
  final double FITBODYHeight;

  const LogoWidgets({
    super.key,
    required this.GroupWidth,
    required this.GroupHeight,
    required this.FITBODYWidth,
    required this.FITBODYHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset(
          'assets/images/Group.png',
          width: GroupWidth,
          height: GroupHeight,
        ),
         SizedBox(height: 12),
        Image.asset(
          'assets/images/FITBODY.png',
          width: FITBODYWidth,
          height: FITBODYHeight,
        ),
         SizedBox(height: 20),
      ],
    );
  }
}