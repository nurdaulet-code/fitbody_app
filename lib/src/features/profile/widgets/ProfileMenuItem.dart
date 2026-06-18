import 'package:fitbody_app/src/const/colors/AppColors.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
 

  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
 
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      
      trailing:  Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}