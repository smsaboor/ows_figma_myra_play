import 'package:flutter/material.dart';

import 'package:ows_figma_myra_play/screens/pin_management/request_epin.dart';


class UserInactive extends StatefulWidget {
  const UserInactive({Key? key}) : super(key: key);
  @override
  _UserInactiveState createState() => _UserInactiveState();
}

class _UserInactiveState extends State<UserInactive> {
  TextEditingController _controllerId = TextEditingController();
  TextEditingController _controllerEpin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .1),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, bottom: 15),
            child: Text(
              "User Inactive",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF30622),
                  fontSize: 30),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .03),
          GestureDetector(
            child: Center(
              child: SizedBox(width: MediaQuery.of(context).size.width*.8,
              height: MediaQuery.of(context).size.height*.5,
              child: Image.asset('assets/img_1.png'),),
            ),
            onTap: (){
              showDialog(context: context, builder: (BuildContext context) {
                return new AlertDialog(
                  title: new Text("Activate User"),
                  content: ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>RequestEPin()));
                    },
                    child: Text('Activate'),
                  )
                );
              });
            },
          )
        ],
      ),
    );
  }

}
