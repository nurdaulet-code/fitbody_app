import 'package:fitbody_app/src/const/router/App_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fitbody_app/src/const/colors/AppColors.dart';
import 'package:fitbody_app/src/features/auth/cubit/AuthCubit.dart';
import 'package:fitbody_app/src/features/auth/cubit/AuthState.dart';
import 'package:fitbody_app/src/features/auth/widgets/CustomAuthButtomWidget.dart';
import 'package:fitbody_app/src/features/auth/widgets/CustomTextFiledWidgets.dart';
import 'package:fitbody_app/src/features/auth/widgets/IconsWidgets.dart';

class LoginScrens extends StatefulWidget {
   LoginScrens({super.key});

  @override
  State<LoginScrens> createState() => _LoginScrensState();
}

class _LoginScrensState extends State<LoginScrens> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (!formKey.currentState!.validate()) {
      return;
      
    }
    context.read<AuthCubit>().login(
  email: emailController.text.trim(),
  password: passwordController.text.trim(),
);

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.isSuccess) {
            Navigator.pushReplacementNamed(
              context,
            AppRouter.setup1
            );
          }

          if (state.error != null &&
              state.error!.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding:  EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                     SizedBox(height: 30),

                    Text(
                      "Log in",
                      style: TextStyle(
                        color: AppColors.yellow,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                     SizedBox(height: 30),

                    Text(
                      "Welcome",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                     SizedBox(height: 40),

                    Container(
                      width: double.infinity,
                      padding:  EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.purple,
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),

                           SizedBox(height: 8),

                          CustomTextField(
                            hintText: "Enter email",
                            controller:
                                emailController,
                            number: TextInputType
                                .emailAddress,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty) {
                                return "Email kiriting";
                              }

                              return null;
                            },
                          ),

                           SizedBox(height: 20),

                          Text(
                            "Password",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),

                           SizedBox(height: 8),

                          CustomTextField(
                            hintText:
                                "Enter password",
                            controller:
                                passwordController,
                            isPassword: true,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty) {
                                return "Parol kiriting";
                              }

                              return null;
                            },
                          ),

                           SizedBox(height: 8),

                          Align(
                            alignment:
                                Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/forgetPassword',
                                );
                              },
                              child:  Text(
                                "Forgot password?",
                                style: TextStyle(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                     SizedBox(height: 30),

                    CustomAuthButton(
                      text: "Log In",
                      isLoading:
                          state.isLoading,
                      onPressed: _login,
                    ),

                     SizedBox(height: 30),

                    Text(
                      "or sign in with",
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),

                     SizedBox(height: 20),

                     IconsWidgets(
                      onGoogleTap: () {
                         context.read<AuthCubit>().signInWithGoogle();
                      },
                     ),

                     SizedBox(height: 30),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color:
                                AppColors.grey,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/signUp',
                            );
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color:
                                  AppColors.yellow,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}