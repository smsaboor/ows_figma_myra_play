import 'package:flutter/material.dart';
import 'package:ows_figma_myra_play/pin_management/request_epin.dart';
import 'second_screen.dart';
import 'multi_level_drawer.dart';

class DrawerHome extends StatefulWidget {
  @override
  _DrawerHomeState createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiLevelDrawer(
      backgroundColor: Colors.white,
      rippleColor: Colors.white,
      subMenuBackgroundColor: Colors.grey.shade100,
      divisionColor: Colors.grey,
      header: Container(
        height: size.height * 0.25,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/profile.png",
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Text("RetroPortal Studio")
          ],
        )),
      ),
      children: [
        MLMenuItem(
            leading: Icon(Icons.person),
            trailing: Icon(Icons.arrow_right),
            content: Text(
              "My Profile",
            ),
            subMenuItems: [
              MLSubmenu(
                  onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SecondScreen()));
                  },
                  submenuContent: Text("Profile")),
              MLSubmenu(onClick: () {}, submenuContent: Text("Bank KYC")),
              MLSubmenu(onClick: () {}, submenuContent: Text("Password")),
              MLSubmenu(onClick: () {}, submenuContent: Text("Trans Password")),
            ],
            onClick: () {}),
        MLMenuItem(
            leading: Icon(Icons.supervised_user_circle),
            trailing: Icon(Icons.arrow_right),
            content: Text("My Team"),
            onClick: () {},
            subMenuItems: [
              MLSubmenu(onClick: () {}, submenuContent: Text("My Referal Teaam")),
              MLSubmenu(onClick: () {}, submenuContent: Text("My Down Team"))
            ]),
        MLMenuItem(
          leading: Icon(Icons.notifications),
          content: Text("Notifications"),
          onClick: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SecondScreen()));
          },
        ),
        MLMenuItem(
            leading: Icon(Icons.pin),
            trailing: Icon(Icons.arrow_right),
            content: Text(
              "Pin Management",
            ),
            subMenuItems: [
              MLSubmenu(onClick: () {

                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>RequestEPin()));
              }, submenuContent: Text("Request E-PIN")),
              MLSubmenu(onClick: () {}, submenuContent: Text("Fresh E-PIN")),
              MLSubmenu(onClick: () {}, submenuContent: Text("Used E-PIN")),
              MLSubmenu(onClick: () {}, submenuContent: Text("E PIN Summary")),
            ],
            onClick: () {}),
        MLMenuItem(
            leading: Icon(Icons.payment),
            trailing: Icon(Icons.arrow_right),
            content: Text(
              "Payments",
            ),
            subMenuItems: [
              MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
              MLSubmenu(onClick: () {}, submenuContent: Text("Option 2")),
              MLSubmenu(onClick: () {}, submenuContent: Text("Option 3")),
              MLSubmenu(onClick: () {}, submenuContent: Text("Option 4")),
            ],
            onClick: () {}),
      ],
    );
  }
}
