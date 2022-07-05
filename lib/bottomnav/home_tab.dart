import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ows_figma_myra_play/bloc/user_activity.dart';
import 'package:ows_figma_myra_play/drawer/drawer_home.dart';
import 'package:ows_figma_myra_play/home/UserInactive.dart';
import 'package:ows_figma_myra_play/home/UserActive.dart';
import 'package:ows_figma_myra_play/home/dashboard.dart';
import 'package:ows_figma_myra_play/route.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

final List<String> _listViewData = [
  "Bajarangisoft.com",
  "Flutter",
  "Android",
  "iOS",
  "React Native",
  "Php",
  "Core Java",
  "Laravel",
  "Javascript",
  "Jquery",
  "Python",
];

List<ExpansionTile> _listOfExpansions = List<ExpansionTile>.generate(
    11,
    (i) => ExpansionTile(
          title: Text(
            "Expansion $i",
            style: TextStyle(color: Colors.blue[800]),
          ),
          children: _listViewData
              .map((data) => ListTile(
                    leading: Icon(Icons.person),
                    title: Text(data),
                    subtitle: Text("a subtitle here"),
                  ))
              .toList(),
        ));

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserActivityCubit, int>(builder: (context, useState) {
      return Scaffold(
          drawer: DrawerHome(),

          // Drawer(
          //   child: ListView(
          //     padding: EdgeInsets.all(8.0),
          //     children: _listOfExpansions
          //         .map((expansionTile) => expansionTile)
          //         .toList(),
          //   ),
          // ),
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 24, // Changing Drawer Icon Size
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            actions: <Widget>[
              Center(
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0)),
                      elevation: 5,
                      color: Colors.white,
                      borderOnForeground: true,
                      surfaceTintColor: Colors.black,
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('#99',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ]),
                      )),
                ),
              ),
              SizedBox(
                width: 15,
              )
            ],
            title: Text('MyraPlay'),
          ),
          body: useState == 0
              ? UserInactive()
              : useState == 1
                  ? UserActive()
                  : Dashboard());
    });
  }
}
