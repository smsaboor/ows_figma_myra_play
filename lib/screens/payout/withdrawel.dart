import 'package:flutter/material.dart';
import 'package:ows_figma_myra_play/bloc/user_activity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Withdrawel extends StatefulWidget {
  const Withdrawel({Key? key}) : super(key: key);
  @override
  _WithdrawelState createState() => _WithdrawelState();
}

class _WithdrawelState extends State<Withdrawel> {
  TextEditingController _controllerId = TextEditingController();
  TextEditingController _controllerEpin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Withdrawel',),centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .1),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 15),
              child: Text(
                "Withdrawel",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF03AC5D),
                    fontSize: 30),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .05),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Theme(
                data: new ThemeData(
                  primaryColor: Colors.redAccent,
                  primaryColorDark: Colors.red,
                ),
                child: new TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _controllerId,
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      labelText: 'Amount',
                      prefixText: ' ',
                      suffixIcon: Icon(
                        Icons.monetization_on_outlined,
                        color: Colors.indigo,
                      ),
                      suffixStyle: const TextStyle(color: Colors.green)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Theme(
                data: new ThemeData(
                  primaryColor: Colors.redAccent,
                  primaryColorDark: Colors.red,
                ),
                child: new TextFormField(
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  controller: _controllerEpin,
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      labelText: 'Password',
                      prefixText: ' ',
                      suffixIcon: Icon(
                        Icons.pin,
                        color: Colors.indigo,
                      ),
                      suffixStyle: const TextStyle(color: Colors.green)),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .05),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<UserActivityCubit>().updateIndex(2);
                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (_) => Dashboard()));
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
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            gradient: new LinearGradient(colors: [
                              Color.fromARGB(255, 13, 21, 142),
                              Color.fromARGB(255, 41, 230, 255)
                            ])),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "Submit",
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => Container()));
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
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            gradient: new LinearGradient(colors: [
                              Color.fromARGB(255, 13, 21, 142),
                              Color.fromARGB(255, 41, 230, 255)
                            ])),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "Cancel",
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
