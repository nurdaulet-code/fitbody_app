import 'package:firebase_core/firebase_core.dart';
import 'package:fitbody_app/src/features/SetUp/cubit/SetUpCubit.dart';
import 'package:fitbody_app/src/features/auth/cubit/AuthCubit.dart';
import 'package:fitbody_app/src/features/auth/service/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitbody_app/firebase_options.dart';
import 'package:fitbody_app/src/const/router/app_routers.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    
  );

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit(AuthService.instance),
        ),
        BlocProvider<Setupcubit>(
          create: (_) => Setupcubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'FitBody App',

        initialRoute: AppRouter.onboarding1,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}