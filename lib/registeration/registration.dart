import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ows_figma_myra_play/background.dart';
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: size.height * .15,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Create an Account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA),
                        fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 10),
                  child: Text(
                    "Get Started with your free account today.\nNo credit card needed and no setup fees",
                    style: TextStyle(color: Colors.black45, fontSize: 14),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
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
                SizedBox(height: size.height * 0.02),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
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
                SizedBox(height: size.height * 0.02),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
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
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
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
                SizedBox(height: size.height * 0.02),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
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
                Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                    child: Checkbox(
                        value: checked,
                        onChanged: (bool? value) {
                          this.checked = value;
                        })),
                Padding(
                  padding: const EdgeInsets.only(left: 200.0,right: 50),
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
                SizedBox(height: size.height * 0.002),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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

// class to draw the profile screen
//
// class RegistrationScreen extends StatefulWidget {
//   const RegistrationScreen({Key? key}) : super(key: key);
//
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   TextEditingController _controllerMobile = TextEditingController();
//   TextEditingController _controllerPassword = TextEditingController();
//   TextEditingController _controllerName = TextEditingController();
//   TextEditingController _controllerEmail = TextEditingController();
//
//   @override
//   void dispose() {
//     _controllerEmail.dispose();
//     _controllerName.dispose();
//     _controllerPassword.dispose();
//     _controllerMobile.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: ListView(
//           children: [
//             CustomPaint(
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height,
//               ),
//               painter: HeaderCurvedContainer(),
//             ),
//             ListView(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Text(
//                     'Sign Up',
//                     style: TextStyle(
//                       fontSize: 30.0,
//                       letterSpacing: 1.5,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * .1,
//                     ),
//                     TextFieldWidget(
//                       label: 'Your Mobile No',
//                       text: '',
//                       controller: _controllerMobile,
//                       obscure: false,
//                       onChanged: (txt) => _controllerMobile.text = txt,
//                     ),
//                     SizedBox(height: MediaQuery.of(context).size.height * .02),
//                     TextFieldWidget(
//                       label: 'Enter Name',
//                       text: '',
//                       controller: _controllerName,
//                       obscure: false,
//                       onChanged: (txt) => _controllerName.text = txt,
//                     ),
//                     SizedBox(height: MediaQuery.of(context).size.height * .02),
//                     TextFieldWidget(
//                       label: 'Enter Email',
//                       text: '',
//                       controller: _controllerEmail,
//                       obscure: false,
//                       onChanged: (txt) => _controllerEmail.text = txt,
//                     ),
//                     SizedBox(height: MediaQuery.of(context).size.height * .02),
//                     TextFieldWidget(
//                       label: 'Enter Password',
//                       text: '',
//                       controller: _controllerPassword,
//                       onChanged: (txt) => _controllerPassword.text = txt,
//                       obscure: true,
//                     ),
//                     SizedBox(height: MediaQuery.of(context).size.height * .05),
//                     Center(
//                       child: SizedBox(
//                           width: MediaQuery.of(context).size.width * .6,
//                           height: MediaQuery.of(context).size.height * .06,
//                           child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(primary: Colors.red),
//                               onPressed: () {
//                                 Navigator.of(context).push(
//                                     MaterialPageRoute(builder: (_) => OtpScreen()));
//                               },
//                               child: Text(
//                                 'Sign Up',
//                                 style: TextStyle(fontSize: 20),
//                               ))),
//                     ),
//                     SizedBox(height: MediaQuery.of(context).size.height * .05),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("You have an account? ",style: TextStyle(color: Colors.black),),
//                         TextButton(
//                             onPressed: () {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (_) => LoginScreen()));
//                             },
//                             child: Text('Login',style: TextStyle(fontSize: 20),))
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//       ),
//     );
//   }
// }
//
// // CustomPainter class to for the header curved-container
// class HeaderCurvedContainer extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()..color = Colors.red;
//     Path path = Path()
//       ..relativeLineTo(0, 90)
//       ..quadraticBezierTo(size.width / 2, 170.0, size.width, 90)
//       ..relativeLineTo(0, -800)
//       ..close();
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
