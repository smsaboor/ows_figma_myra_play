import 'package:flutter/material.dart';
import 'package:ows_figma_myra_play/model/model_user.dart';
import 'package:ows_figma_myra_play/screens/bottomnav/home_tab.dart';
import 'package:ows_figma_myra_play/screens/earning/earning.dart';
import 'package:ows_figma_myra_play/screens/myteam/myteam.dart';
import 'package:ows_figma_myra_play/screens/profile/display_profile_page.dart';

class ScreenBottomNav extends StatefulWidget {
  ScreenBottomNav();
  @override
  _ScreenBottomState createState() => _ScreenBottomState();
}

class _ScreenBottomState extends State<ScreenBottomNav> {
  _ScreenBottomState();
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
    HomeScreen(),
    DisplayProfilePage(user: ModelUser('101','Vinay Kumar','abc@gmail.com','9787878787','qwerty','US003',"https://miro.medium.com/proxy/0*pAdZLfSqNrMZAAPA.jpg",'12/11/2002'),),
    MyTask(),
    EarningScreen(),
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
          selectedItemColor: Colors.indigo,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.task_alt),
                label: 'Task'),
            BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on_outlined), label: "Earning"),



          ],
        ));
  }
}
