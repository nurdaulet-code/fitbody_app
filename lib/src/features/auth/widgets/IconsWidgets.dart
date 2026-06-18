import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconsWidgets extends StatelessWidget {
  const IconsWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        SvgPicture.asset("assets/icons/google.svg"),
        SizedBox(width: 20),
        SvgPicture.asset("assets/icons/facebook.svg"),  
        SizedBox(width: 20),
        SvgPicture.asset("assets/icons/Fingerprint.svg"),
      ],
    );
  }
}
