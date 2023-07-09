import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:ows_figma_myra_play/bloc/theme/theme_cubit.dart';
import 'package:ows_figma_myra_play/model/model_user.dart';
import 'package:ows_figma_myra_play/screens/profile/demo.dart';
import 'package:ows_figma_myra_play/screens/profile/profile/about_widget.dart';
import 'package:ows_figma_myra_play/screens/profile/profile/name_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ows_figma_myra_play/screens/profile/profile/numbers_widget.dart';
import 'package:ows_figma_myra_play/screens/profile/profile/profile_widget.dart';
import 'package:ows_figma_myra_play/screens/profile/profile/upgradeButton_widget.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:ows_figma_myra_play/screens/profile_management/bank_kyc.dart';

const kPrimaryColor = Color(0xFF0C0C0C);

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kPrimaryColor,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: kPrimaryColor,
              width: 22,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/Profile Image.png"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DisplayProfilePage extends StatefulWidget {
  const DisplayProfilePage({Key? key, required this.user}) : super(key: key);
  final ModelUser user;

  @override
  _DisplayProfilePageState createState() => _DisplayProfilePageState(this.user);
}

class _DisplayProfilePageState extends State<DisplayProfilePage> {
  _DisplayProfilePageState(this.user);

  final ModelUser user;
  String? countryValue;
  String? stateValue;
  String? cityValue;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            // ProfilePic(),
            SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DemoScafold(txt: 'My Account',)))
              },
            ),
            ProfileMenu(
              text: "Bank KYC",
              icon: "assets/icons/Bill Icon.svg",
              press: () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>BankKyc(isBottomnav: true,)))
              },
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DemoScafold(txt: 'Notifications',)));
              },
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DemoScafold(txt: 'Settings',)));
              },
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DemoScafold(txt: 'Help Centre',)));
              },
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
