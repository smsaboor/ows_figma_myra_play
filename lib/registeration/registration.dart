import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ows_figma_myra_play/background.dart';
import 'package:ows_figma_myra_play/configs/app.dart';
import 'package:ows_figma_myra_play/configs/app_typography.dart';
import 'package:ows_figma_myra_play/registeration/otp.dart';
import 'package:ows_figma_myra_play/route.dart';

class RegistrationScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController _controllerMobile = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  bool? checked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    App.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: size.height * .20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10.0,),
                  child: Text(
                    "Create an Account",
                    style: AppText.h2!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.indigo,
                      height: 1,
                  ),
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 10),
                  child: Text(
                    "Get Started with your free account today.No credit card\n needed and no setup fees",
                    style: TextStyle(color: Colors.black45, fontSize: 12),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 18),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Name';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[a-z, ' ', A-Z]')),
                    ],
                    decoration: InputDecoration(
                      labelText: "Name",
                      prefixText: ' ',
                      suffixStyle: const TextStyle(
                        color: Colors.red,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.001),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 18),
                  child: TextFormField(
                    controller: _controllerEmail,
                    validator: (value) {
                      bool isValid = _isEmailValidate(_controllerEmail.text);
                      ;
                      if (value!.isEmpty) {
                        return 'Enter Your Email';
                      } else if (!isValid) {
                        return 'Enter Valid Email';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 18),
                  child: TextFormField(
                    controller: _controllerMobile,
                    decoration: InputDecoration(labelText: "Mobile Number"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Mobile';
                      }
                      return null;
                    },
                    maxLength: 10,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 18),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 18),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Referal Code"),
                    maxLength: 8,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[a-z, ' ', A-Z, 0-9, #,]')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Checkbox(
                      value: checked,
                      onChanged: (bool? value) {
                        this.checked = value;
                      }),
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      _save(context);
                      // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>OtpScreen()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: size.width * 0.5,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: new LinearGradient(colors: [
                            Color.fromARGB(255, 13, 21, 142),
                            Color.fromARGB(255, 41, 230, 255)
                          ])),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Join Now",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Center(
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.pushReplacementNamed(
                          context, RouteGenerator.signIn)
                    },
                    child: Text(
                      "Already Have an Account? Sign in",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _save(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>OtpScreen(mobile: _controllerMobile.text.toString())));
    }
  }

  bool _isEmailValidate(String txt) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(txt);
  }
}
