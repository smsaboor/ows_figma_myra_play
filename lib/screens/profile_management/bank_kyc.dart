import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ows_figma_myra_play/background.dart';
import 'package:ows_figma_myra_play/route.dart';

class BankKyc extends StatefulWidget {
  const BankKyc({Key? key, this.isBottomnav}) : super(key: key);
  final isBottomnav;
  @override
  _BankKycState createState() => _BankKycState();
}

class _BankKycState extends State<BankKyc> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerHolderName = TextEditingController();
  TextEditingController _controllerIFSC = TextEditingController();
  TextEditingController _controllerAccountNumber = TextEditingController();
  TextEditingController _controllerAadhar = TextEditingController();
  TextEditingController _controllerPan = TextEditingController();

  _BankKycState();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: widget.isBottomnav ? AppBar(
        title: Text('Bank Kyc'),
        centerTitle: true,
        automaticallyImplyLeading: widget.isBottomnav ? true : false,
      ):null,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.02),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Bank Name';
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
                    labelText: "Bank Name",
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
                  controller: _controllerHolderName,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Account Holder Name';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "A/c Holder Name"),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: _controllerIFSC,
                  decoration: InputDecoration(labelText: "Bank IFSC"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Bank IFSC';
                    }
                    return null;
                  },
                  maxLength: 10,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  // inputFormatters: <TextInputFormatter>[
                  //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  // ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Bank A/c Number';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[a-z, ' ', A-Z, 0-9]')),
                  ],
                  decoration: InputDecoration(
                    labelText: "Bank A/c Number",
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
                      return 'Enter Aadhar';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]')),
                  ],
                  decoration: InputDecoration(
                    labelText: "Aadhar Card Number",
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
                      return 'Enter Pan Number';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[a-z, ' ', A-Z, 0-9]')),
                  ],
                  decoration: InputDecoration(
                    labelText: "Pan Number",
                    prefixText: ' ',
                    suffixStyle: const TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
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
                      width: size.width * 0.4,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: new LinearGradient(colors: [
                            Color.fromARGB(255, 13, 21, 142),
                            Color.fromARGB(255, 41, 230, 255)
                          ])),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Save",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
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
                      width: size.width * 0.4,
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
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],)
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
