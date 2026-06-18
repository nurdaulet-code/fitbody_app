import 'package:fitbody_app/gen/assets.gen.dart';
import 'package:fitbody_app/src/const/colors/AppColors.dart';
import 'package:fitbody_app/src/features/profile/cubit/profilecubit.dart';
import 'package:fitbody_app/src/features/profile/cubit/profilestate.dart';
import 'package:fitbody_app/src/features/profile/widgets/ProfileButtonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child:  _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
   _ProfileView();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        title:  Text("My Profile",style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.white),),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  color: AppColors.purple,
                    child: Column(
            children: [
              CircleAvatar(
                radius: 97,
                backgroundColor: AppColors.black,
              ),
              Text('Madison Smith',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: AppColors.white),),
              Text('madisons@example.com',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300,color: AppColors.white),),
            ],
                    ),
                ),
                SizedBox(height: 10),
               Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 24),
                 child: Column(
                  children: [
                     ProfileButton(title: 'Profile', icon: Assets.icons.profile, onTap: () {}),
                  ProfileButton(title: 'Favorite', icon: Assets.icons.favorite, onTap: () {}),
                  ProfileButton(title: 'Privacy Policy', icon: Assets.icons.component, onTap: () {}),
                  ProfileButton(title: 'Settings', icon: Assets.icons.settings, onTap: () {}),
                  ProfileButton(title: 'Help', icon: Assets.icons.help, onTap: () {}),
                  ProfileButton(title: 'Logout', icon: Assets.icons.logout, onTap: () {}),
                 
                  ],
                 ),
               ),
              ]
            ),
          );
        },
      ),
    );
  }
}