
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ows_figma_myra_play/bloc/user_activity.dart';
import 'package:ows_figma_myra_play/configs/app.dart';
import 'package:ows_figma_myra_play/onboarding.dart';
import 'package:ows_figma_myra_play/route.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final isFirst = preferences.getBool('onboarding') ?? true;
  runApp(MyApp(isFirst: isFirst));}

class MyApp extends StatelessWidget {
  const MyApp({required this.isFirst});
  final isFirst;
  final fontFamily = 'Poppins';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserActivityCubit>(
          create: (BuildContext context) => UserActivityCubit(),
        ),
      ],
      child: MaterialApp(
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
        theme: Theme.of(context).copyWith(
          primaryColor: Colors.lime,
          appBarTheme: AppBarTheme(
            color: Colors.indigo,
            brightness: Brightness.light,
            elevation: 0,
            textTheme: Theme.of(context).textTheme,
            iconTheme: Theme.of(context).iconTheme,
          ),
        ),
        initialRoute: isFirst ? RouteGenerator.intro: RouteGenerator.homeScreen,
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      ),
    );
  }
}
