import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ows_figma_myra_play/route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late Timer _timer;
  final _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(children: <Widget>[
      Expanded(
        flex: 3,
        child: PageView.builder(
          controller: _controller,
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return backgroudImage(_currentPage);
          },
          onPageChanged: (value) => setState(() => _currentPage = value),
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * .8,
        right: 0.0,
        left: 0.0,
        child: Column(
          children: <Widget>[
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async{
                    Navigator.pushNamed(context, RouteGenerator.homeScreen);
                    SharedPreferences preferences = await SharedPreferences.getInstance();
                    preferences.setBool('onboarding',false);
                  },
                  child: Text(
                    'Gets Start',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ]));
  }

  Widget backgroudImage(int currentP) {
    return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/myra.png'),
                  /// change this to your  image directory
                  fit: BoxFit.fill,
                ),
              ),
          );
  }
}
