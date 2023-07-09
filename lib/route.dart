import 'package:flutter/material.dart';
import 'package:ows_figma_myra_play/screens/bottomnav/home_tab.dart';
import 'package:ows_figma_myra_play/screens/dashboard/dashboard.dart';
import 'package:ows_figma_myra_play/screens/home/home_tab.dart';
import 'package:ows_figma_myra_play/screens/profile_management/user_details.dart';
import 'package:ows_figma_myra_play/onboarding.dart';
import 'package:ows_figma_myra_play/screens/authentications/login/login.dart';
import 'package:ows_figma_myra_play/screens/authentications/registeration/registration.dart';
import 'package:ows_figma_myra_play/screens/bottomnav/screen_bottom_nav.dart';
import 'package:ows_figma_myra_play/welcome/welcome_screen.dart';

class RouteGenerator {
  static const String bottomNavScreen = '/tab';
  static const String homeTab = '/hometab';
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
      case homeTab:
        return MaterialPageRoute(builder: (_) => HomeTabScreen());
      case error:
        return MaterialPageRoute(builder: (_) => Container());
      case signIn:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      case userDetail:
        return MaterialPageRoute(
            builder: (_) => UserDetails(
                  isBottomnav: false,
                ));
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
