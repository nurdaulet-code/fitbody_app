import 'package:fitbody_app/src/const/router/App_routers.dart';
import 'package:fitbody_app/src/features/SetUp/screen/setupscreens1.dart';
import 'package:fitbody_app/src/features/auth/cubit/AuthCubit.dart';
import 'package:fitbody_app/src/features/auth/cubit/AuthState.dart';
import 'package:flutter/material.dart';
import 'package:fitbody_app/src/const/colors/AppColors.dart';
import 'package:fitbody_app/src/features/auth/widgets/CustomAuthButtomWidget.dart';
import 'package:fitbody_app/src/features/auth/widgets/CustomTextFiledWidgets.dart';
import 'package:fitbody_app/src/features/auth/widgets/IconsWidgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScrens extends StatefulWidget {
   SignUpScrens({super.key});

  @override
  State<SignUpScrens> createState() => _SignUpScrensState();
}

class _SignUpScrensState extends State<SignUpScrens> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();


  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
return BlocListener<AuthCubit, AuthState>(
  listener: (context, state) {
    if (state.isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRouter.setup1,
        (route) => false,
      );
    }

    if (state.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.error!)),
      );
    }
  },
  child: BlocBuilder<AuthCubit, AuthState>(
    builder: (context, state) {
      return Scaffold(

        backgroundColor: AppColors.black,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
      
                 SizedBox(height: 50),
      
                Text(
                  "Create Account",
                  style: TextStyle(
                    color: AppColors.yellow,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
      
                 SizedBox(height: 30),
      
                Container(
                  margin:  EdgeInsets.symmetric(horizontal: 20),
                  padding:  EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
      
                      Text("Full name",
                          style: TextStyle(color: AppColors.black)),
      
                      CustomTextField(
                        hintText: "Enter name",
                        controller: nameController,
                        validator: (v) =>
                            v == null || v.isEmpty ? "Name kiriting" : null,
                      ),
      
                       SizedBox(height: 10),
      
                      Text("Email",
                          style: TextStyle(color: AppColors.black)),
      
                      CustomTextField(
                        hintText: "Enter email",
                        controller: emailController,
                        validator: (v) =>
                            v == null || v.isEmpty ? "Email kiriting" : null,
                      ),
      
                       SizedBox(height: 10),
      
                      Text("Password",
                          style: TextStyle(color: AppColors.black)),
      
                      CustomTextField(
                        hintText: "Enter password",
                        controller: passwordController,
                        isPassword: true,
                        validator: (v) =>
                            v == null || v.isEmpty ? "Parol kiriting" : null,
                      ),
      
                       SizedBox(height: 10),
      
                      Text("Confirm Password",
                          style: TextStyle(color: AppColors.black)),
      
                      CustomTextField(
                        hintText: "Confirm password",
                        controller: confirmController,
                        isPassword: true,
                        validator: (v) =>
                            v == null || v.isEmpty ? "Tasdiqlang" : null,
                      ),
                    ],
                  ),
                ),
      
                 SizedBox(height: 20),
      
               CustomAuthButton(
        text: "Sign Up",
        isLoading: state.isLoading,
        onPressed: () {
       
      if (!formKey.currentState!.validate()) return;
      
      if (passwordController.text != confirmController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text("Parollar mos emas")),
        );
        return;
      }
      
      context.read<AuthCubit>().signUp(
        fullName: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
        },
      ),
                 SizedBox(height: 20),
      
                IconsWidgets(
                  onGoogleTap: () {
                       context.read<AuthCubit>().signInWithGoogle();
                  },
                ),
      
                 SizedBox(height: 20),
      
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    "Already have an account? Login",
                    style: TextStyle(color: AppColors.yellow),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      }
    ),
);
  }
}