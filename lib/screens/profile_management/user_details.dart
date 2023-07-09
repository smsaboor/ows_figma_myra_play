import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ows_figma_myra_play/background.dart';
import 'package:ows_figma_myra_play/route.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key, this.isBottomnav}) : super(key: key);
  final isBottomnav;

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerUserCode = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerMobile = TextEditingController();

  _UserDetailsState();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: widget.isBottomnav ? AppBar(
        title: Text('User Deatail'),
        centerTitle: true,
        automaticallyImplyLeading: widget.isBottomnav ? true : false,
      ):null,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height * .02,
              ),
              widget.isBottomnav? Container():Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "User Detail",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                      fontSize: 30),
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
                  decoration: InputDecoration(labelText: "Mobile"),
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
                      return 'Enter Your State';
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
                    labelText: "State",
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Your City';
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
                    labelText: "City",
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Postal Code';
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
                    labelText: "Pin Code",
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your User Code';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "User Code"),
                  obscureText: true,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Password"),
                  maxLength: 8,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your Password';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[a-z, ' ', A-Z, 0-9, #,]')),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200.0, right: 50),
                child: ElevatedButton(
                  onPressed: () {
                    _save(context);
                    // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>OtpScreen()));
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
                      widget.isBottomnav? "Save" : "Next",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _save(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, RouteGenerator.bottomNavScreen);
    }
  }

  bool _isEmailValidate(String txt) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(txt);
  }
}
