import 'package:flutter/material.dart';
import 'package:ows_figma_myra_play/bottomnav/home_tab.dart';

import 'package:ows_figma_myra_play/bottomnav/widgets/custom_container.dart';

class ScreenBottomNav extends StatefulWidget {
  @override
  _ScreenBottomState createState() => _ScreenBottomState();
}

class _ScreenBottomState extends State<ScreenBottomNav> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final CKL_SELECTPAGE = [
    HomeTab(),
    CustomContainer(txt: 'Profile'),
    CustomContainer(txt: 'My Team'),
    CustomContainer(txt: 'Earning'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CKL_SELECTPAGE.elementAt(pageIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          selectedItemColor: Colors.amber,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_add_alt_1),
                label: 'MyTeam'),
            BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on_outlined), label: "Earning"),
          ],
        ));
  }
}
