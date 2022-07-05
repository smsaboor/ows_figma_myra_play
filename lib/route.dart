import 'package:flutter/material.dart';
import 'package:ows_figma_myra_play/bottomnav/screen_bottom_nav.dart';
import 'package:ows_figma_myra_play/login/login.dart';
import 'package:ows_figma_myra_play/onboarding.dart';
import 'package:ows_figma_myra_play/registeration/otp.dart';
import 'package:ows_figma_myra_play/registeration/registration.dart';
import 'package:ows_figma_myra_play/user_details/user_details.dart';
import 'package:ows_figma_myra_play/welcome/welcome_screen.dart';



class RouteGenerator {
  static const String bottomNavScreen = '/tab';
  static const String homeScreen = '/home';
  static const String signIn = '/signin';
  static const String signUp = '/signup';
  static const String userDetail = '/userDetail';
  static const String otp = '/otp';
  static const String pwdReset = '/pwdReset';
  static const String otpConfirm = '/pwdReset';
  static const String intro = '/';
  static const String loading = '/loading';
  static const String error = '/error';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case intro:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case loading:
        return MaterialPageRoute(builder: (_) => Container());
      case error:
        return MaterialPageRoute(builder: (_) => Container());
      case signIn:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      case userDetail:
        return MaterialPageRoute(builder: (_) => UserDetails());
      // case otp:
      //   return MaterialPageRoute(builder: (_) => OtpScreen(mobile: mobile));
      case pwdReset:
        return MaterialPageRoute(builder: (_) => Container());
      case bottomNavScreen:
        return MaterialPageRoute(builder: (_) => ScreenBottomNav());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
    }
  }
}
