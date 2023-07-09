import 'package:flutter/material.dart';
import 'package:ows_figma_myra_play/screens/authentications/login/login.dart';
import 'package:ows_figma_myra_play/screens/authentications/registeration/registration.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .2),
          buildImage(context),
          SizedBox(height: MediaQuery.of(context).size.height * .1),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => LoginScreen()));
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
                      Color.fromARGB(255, 2, 3, 21),
                      Color.fromARGB(255, 178, 183, 184)
                    ])),
                padding: const EdgeInsets.all(0),
                child: Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .02),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => RegistrationScreen()));
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
                      Color.fromARGB(255, 2, 3, 21),
                      Color.fromARGB(255, 178, 183, 184)
                    ])),
                padding: const EdgeInsets.all(0),
                child: Text(
                  "Register",
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
