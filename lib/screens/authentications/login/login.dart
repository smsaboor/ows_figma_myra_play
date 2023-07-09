import 'package:flutter/material.dart';
import 'package:ows_figma_myra_play/background.dart';
import 'package:ows_figma_myra_play/core/custom_snackbar.dart';
import 'package:ows_figma_myra_play/model/model_login.dart';
import 'package:ows_figma_myra_play/route.dart';
import 'package:ows_figma_myra_play/services/api/auth/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // getSP()async{
  //   await SharedPreferences.getInstance();
  // }

  bool _isHidden2 = true;

  void _togglePasswordConfirmView() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  bool tryLogin = false;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                        fontSize: MediaQuery.of(context).size.height * 0.04),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: _controllerEmail,
                    onChanged: (v) {
                      setState(() {
                        tryLogin = false;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email ';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: _controllerPassword,
                    onChanged: (v) {
                      setState(() {
                        tryLogin = false;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Password",
                      suffix: InkWell(
                        onTap: _togglePasswordConfirmView,
                        child: Icon(
                          _isHidden2
                              ?
                              Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    obscureText: _isHidden2,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                tryLogin
                    ? Center(
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Container(
                        alignment: Alignment.centerRight,
                        margin:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            _login(context);
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
                            width: size.width * 0.5,
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(80.0),
                                gradient: new LinearGradient(colors: [
                                  Color.fromARGB(255, 13, 21, 142),
                                  Color.fromARGB(255, 41, 230, 255)
                                ])),
                            padding: const EdgeInsets.all(0),
                            child: Text(
                              "LOGIN",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 110.0),
                  child: GestureDetector(
                      onTap: () => {
                            Navigator.pushReplacementNamed(
                                context, RouteGenerator.signUp)
                          },
                      child: Row(
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2661FA)),
                          ),
                          Text(
                            "Register ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          Text(
                            "here",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2661FA)),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    setState(() {
      tryLogin = true;
    });
    Future.delayed(Duration(seconds: 2)).then((value) => {
    Navigator.pushReplacementNamed(context, RouteGenerator.bottomNavScreen)
    });
    // if (formKey.currentState!.validate()) {
    //   var data = await ApiService.getLogin(LoginModel(
    //     email: _controllerEmail.text,
    //     password: _controllerPassword.text,
    //   ));
    //   if (data[0]['success_code'] == 'ok') {
    //     SharedPreferences preferences = await SharedPreferences.getInstance();
    //     preferences.setString('email', _controllerEmail.text);
    //     preferences.setString('userId', data[0]['user_id']);
    //     preferences.setBool('isLogin', true);
    //     setState(() {
    //       tryLogin = false;
    //     });
    //     // CustomSnackBar.snackBar(
    //     //     context: context,
    //     //     data: 'Login Successfully !',
    //     //     color: Colors.green);
    //     Navigator.pushReplacementNamed(context, RouteGenerator.bottomNavScreen);
    //   } else {
    //     setState(() {
    //       tryLogin = false;
    //     });
    //     CustomSnackBar.snackBar(
    //         context: context, data: 'Failed to Login !', color: Colors.red);
    //   }
    // }
  }

  bool _isEmailValidate(String txt) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(txt);
  }
}
