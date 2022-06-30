import 'package:flutter/material.dart';
import 'package:ows_figma_myra_play/drawer/drawer_home.dart';
import 'package:ows_figma_myra_play/route.dart';


class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerHome(),
      appBar: AppBar(
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
          ),SizedBox(width: 15,)
        ],
        title: Text('MyraPlay'),
      ),
      body: Center(
        child: Image.asset('assets/myra.png'),
      ),
    );
  }
}