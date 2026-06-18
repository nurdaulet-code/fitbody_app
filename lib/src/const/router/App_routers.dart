import 'package:fitbody_app/src/features/profile/screen/mainscrens.dart';
import 'package:fitbody_app/src/features/profile/screen/profilescreens.dart';
import 'package:flutter/material.dart';
import 'package:fitbody_app/src/features/on_bording/screen/OnBording1Screns.dart';
import 'package:fitbody_app/src/features/on_bording/screen/OnBording2Screns.dart';
import 'package:fitbody_app/src/features/on_bording/screen/OnBording3Screns.dart';
import 'package:fitbody_app/src/features/auth/screen/login_screns.dart';
import 'package:fitbody_app/src/features/auth/screen/sign_up_screns.dart';
import 'package:fitbody_app/src/features/auth/screen/forgetpasword_screens.dart';
import 'package:fitbody_app/src/features/SetUp/screen/setupscreens1.dart';
import 'package:fitbody_app/src/features/SetUp/screen/setupscreens2.dart';
import 'package:fitbody_app/src/features/SetUp/screen/setupscreens3.dart';
import 'package:fitbody_app/src/features/SetUp/screen/setupscreens4.dart';
import 'package:fitbody_app/src/features/SetUp/screen/setupscreens5.dart';
import 'package:fitbody_app/src/features/SetUp/screen/setupscreens6.dart';
class AppRouter {
  static const String onboarding1 = '/';
  static const String onboarding2 = '/onboarding2';
  static const String onboarding3 = '/onboarding3';

  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String forgetPassword = '/forgetPassword';

  static const String setup1 = '/setup1';
  static const String setup2 = '/setup2';
  static const String setup3 = '/setup3';
  static const String setup4 = '/setup4';
  static const String setup5 = '/setup5';
  static const String setup6 = '/setup6';
  static const String profile = '/profile';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      case onboarding1:
        return MaterialPageRoute(builder: (_) =>  OnBording1Screns());

      case onboarding2:
        return MaterialPageRoute(builder: (_) =>  Onbording2Screens());

      case onboarding3:
        return MaterialPageRoute(builder: (_) =>  Onbording3screns());

      case login:
        return MaterialPageRoute(builder: (_) =>  LoginScrens());

      case signUp:
        return MaterialPageRoute(builder: (_) =>  SignUpScrens());

      case forgetPassword:
        return MaterialPageRoute(builder: (_) =>  ForgetpaswordScreens());

      case setup1:
        return MaterialPageRoute(builder: (_) =>  Setupscreens1());

      case setup2:
        return MaterialPageRoute(builder: (_) =>  Setupscreens2());

      case setup3:
        return MaterialPageRoute(builder: (_) =>  Setupscreens3());

      case setup4:
        return MaterialPageRoute(builder: (_) => Setupscreens4());

      case setup5:
        return MaterialPageRoute(builder: (_) => Setupscreens5());

      case setup6:
        return MaterialPageRoute(builder: (_) => Setupscreens6());
        case '/main':
  return MaterialPageRoute(builder: (_) =>  MainScreen());
      case profile:
        return MaterialPageRoute(builder: (_) =>  ProfileScreen());

      default:
        return MaterialPageRoute(builder: (_) =>  OnBording1Screns());
    }
  }
}