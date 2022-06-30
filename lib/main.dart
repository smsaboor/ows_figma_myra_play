
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ows_figma_myra_play/onboarding.dart';
import 'package:ows_figma_myra_play/route.dart';
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
    return MaterialApp(
      title: 'Myra Play',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.lime,
        appBarTheme: AppBarTheme(
          color: Colors.orange,
          brightness: Brightness.light,
          elevation: 0,
          textTheme: Theme.of(context).textTheme,
          iconTheme: Theme.of(context).iconTheme,
        ),
      ),
      initialRoute: isFirst ? RouteGenerator.intro: RouteGenerator.homeScreen,
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
    );
  }
}
