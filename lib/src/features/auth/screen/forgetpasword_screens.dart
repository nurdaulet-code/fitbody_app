import 'package:flutter/material.dart';
import 'package:fitbody_app/src/const/colors/AppColors.dart';
import 'package:fitbody_app/src/features/auth/service/AuthService.dart';
import 'package:fitbody_app/src/features/auth/widgets/CustomAuthButtomWidget.dart';
import 'package:fitbody_app/src/features/auth/widgets/CustomTextFiledWidgets.dart';

class ForgetpaswordScreens extends StatefulWidget {
   ForgetpaswordScreens({super.key});

  @override
  State<ForgetpaswordScreens> createState() => _ForgetpaswordScreensState();
}

class _ForgetpaswordScreensState extends State<ForgetpaswordScreens> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [

               SizedBox(height: 60),

              Text(
                "Forget Password",
                style: TextStyle(
                  color: AppColors.yellow,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

               SizedBox(height: 30),

              Text(
                "Enter your email to reset password",
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                ),
              ),

               SizedBox(height: 40),

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

                    Text(
                      "Email address",
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                     SizedBox(height: 10),

                    CustomTextField(
                      hintText: "Enter email",
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email kiriting";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

               SizedBox(height: 40),

              CustomAuthButton(
                text: "Continue",
                isLoading: isLoading,
                onPressed: () async {
                  if (!formKey.currentState!.validate()) return;

                  setState(() => isLoading = true);

                  try {
                    await AuthService.instance.forgotPassword(
                      emailController.text.trim(),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                        content: Text("Reset email yuborildi"),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.toString())),
                    );
                  }

                  setState(() => isLoading = false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}