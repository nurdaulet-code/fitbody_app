import 'package:fitbody_app/src/const/colors/AppColors.dart';
import 'package:flutter/material.dart';

class Homescrens extends StatefulWidget {
  const Homescrens({super.key});

  @override
  State<Homescrens> createState() => _HomescrensState();
}

class _HomescrensState extends State<Homescrens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Text('Home'),
    );
  }
}