

import 'package:flutter/material.dart';
import 'package:ows_figma_myra_play/model/view_task.dart';
import 'package:ows_figma_myra_play/screens/bottomnav/yt.dart';
import 'package:ows_figma_myra_play/services/api/auth/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodayTask extends StatefulWidget {
  const TodayTask({Key? key}) : super(key: key);

  @override
  _TodayTaskState createState() => _TodayTaskState();
}

class _TodayTaskState extends State<TodayTask> {

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

  Future<void> _refresh() async {
    _getData();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Today Task'),centerTitle: true,),
      body:  _loading
          ? Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            )
          : RefreshIndicator(
              onRefresh: _refresh, child: YT(tasks: _tasks))
    );
  }
}
