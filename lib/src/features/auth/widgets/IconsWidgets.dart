import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconsWidgets extends StatelessWidget {
  final VoidCallback? onGoogleTap;
  final VoidCallback? onFacebookTap;
  final VoidCallback? onFingerprintTap;

  const IconsWidgets({
    super.key,
    this.onGoogleTap,
    this.onFacebookTap,
    this.onFingerprintTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onGoogleTap,
          child: SvgPicture.asset(
            "assets/icons/google.svg",
            width: 40,
            height: 40,
          ),
        ),

         SizedBox(width: 20),

        InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onFacebookTap,
          child: SvgPicture.asset(
            "assets/icons/facebook.svg",
            width: 40,
            height: 40,
          ),
        ),

        const SizedBox(width: 20),

        InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onFingerprintTap,
          child: SvgPicture.asset(
            "assets/icons/Fingerprint.svg",
            width: 40,
            height: 40,
          ),
        ),
      ],
    );
  }
}