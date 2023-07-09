
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ows_figma_myra_play/bloc/user_activity.dart';
import 'package:ows_figma_myra_play/drawer/drawer_home.dart';
import 'package:ows_figma_myra_play/model/view_task.dart';
import 'package:ows_figma_myra_play/screens/bottomnav/yt.dart';
import 'package:ows_figma_myra_play/screens/dashboard/dashboard.dart';
import 'package:ows_figma_myra_play/services/api/auth/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState();
  String? uid;
  late bool _loading;
  late List<Data> _tasks;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;
    _getData();
  }

  _getData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    uid = await preferences.getString('userId');
    print(uid);
    setState(() {
      _loading = true;
    });
    ApiService.getUserTask(uid).then((value) {
      _tasks = value;
      print('${_tasks.length}');
      _tasks.asMap().forEach((index, e) {
        print('$index: $e');
        _tasks[index].video = getYouTubeUrl(e.video!);
      });
      setState(() {
        _loading = false;
      });
    });
  }

  String getYouTubeUrl(String content) {
    String? url;
    RegExp exp =
        new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    Iterable<RegExpMatch> matches = exp.allMatches(content);
    matches.forEach((match) {
      print(content.substring(match.start, match.end));
      url = content.substring(match.start, match.end);
    });
    return url!;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserActivityCubit, int>(builder: (context, useState) {
      return SafeArea(
        top: false,
        child: Scaffold(
            drawer: DrawerHome(),
            // drawer: NavigationDrawerWidget(),
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
                      // _getData();
                      // getUserApi();
                      // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>YT()));
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
            body: SingleChildScrollView(child: Dashboard()),
            // body: _loading
            //     ? Center(
            //         child: SizedBox(
            //           height: 50,
            //           width: 50,
            //           child: CircularProgressIndicator(),
            //         ),
            //       )
            //     : RefreshIndicator(
            //         onRefresh: _refresh, child: YT(tasks: _tasks))

        ),
      );
    });
  }

  Future<void> _refresh() async {
    _getData();
    setState(() {});
  }
}
