import 'package:flutter/material.dart';
import 'package:ows_figma_myra_play/screens/earning/daily_task_bonus.dart';
import 'package:ows_figma_myra_play/screens/earning/referal_bonus.dart';
import 'package:ows_figma_myra_play/screens/earning/team_task_bonus.dart';

class EarningScreen extends StatelessWidget {
  const EarningScreen({Key? key}) : super(key: key);

  Widget buildImage(BuildContext context) {
    final image = AssetImage('assets/myra.png');
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image as ImageProvider,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width * .5,
          height: MediaQuery.of(context).size.width * .5,
          child: InkWell(onTap: null),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('My Earning'),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .2),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => RefferalBonus()));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(0),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 60.0,
                width: size.width * 0.6,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    gradient: new LinearGradient(colors: [
                      Color.fromARGB(255, 13, 21, 142),
                      Color.fromARGB(255, 41, 230, 255)
                    ])),
                padding: const EdgeInsets.all(0),
                child: Text(
                  "Referal Bonus",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .04),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => DailyTaskBonus()));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(0),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                width: size.width * 0.6,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    gradient: new LinearGradient(colors: [
                      Color.fromARGB(255, 13, 21, 142),
                      Color.fromARGB(255, 41, 230, 255)
                    ])),
                padding: const EdgeInsets.all(0),
                child: Text(
                  "Daily Task Bonus",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .04),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => TeamTaskBonus()));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(0),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                width: size.width * 0.6,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    gradient: new LinearGradient(colors: [
                      Color.fromARGB(255, 13, 21, 142),
                      Color.fromARGB(255, 41, 230, 255)
                    ])),
                padding: const EdgeInsets.all(0),
                child: Text(
                  "Team Task Bonus",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
