import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ows_figma_myra_play/bloc/theme/theme_cubit.dart';
import 'package:ows_figma_myra_play/bloc/user_activity.dart';
import 'package:ows_figma_myra_play/route.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final isFirst = preferences.getBool('onboarding') ?? true;
  final isLogin = preferences.getBool('isLogin') ?? false;
  runApp(MyApp(
    isFirst: isFirst,
    isLogin: isLogin,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.isFirst, required this.isLogin});

  final isFirst;
  final isLogin;
  final fontFamily = 'Poppins';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserActivityCubit>(
          create: (BuildContext context) => UserActivityCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            builder: (context, child) => ResponsiveWrapper.builder(
                BouncingScrollWrapper.builder(context, child!),
                maxWidth: 1200,
                minWidth: 450,
                defaultScale: true,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(450, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                  const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                  const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                ],
                background: Container(color: const Color(0xFFF5F5F5))),
            title: 'Myra Play',
            debugShowCheckedModeBanner: false,
            theme: state.currentTheme,
            initialRoute: isFirst
                ? RouteGenerator.intro
                : isLogin
                    ? RouteGenerator.bottomNavScreen
                    : RouteGenerator.homeScreen,
            onGenerateRoute: (settings) =>
                RouteGenerator.generateRoute(settings),
          );
        },
      ),
    );
  }
}
