import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ows_figma_myra_play/background.dart';
import 'package:ows_figma_myra_play/configs/app.dart';
import 'package:ows_figma_myra_play/configs/app_typography.dart';
import 'package:ows_figma_myra_play/core/custom_snackbar.dart';
import 'package:ows_figma_myra_play/core/utils/constants.dart';
import 'package:ows_figma_myra_play/model/model_registration.dart';
import 'package:ows_figma_myra_play/route.dart';
import 'package:ows_figma_myra_play/screens/authentications/login/login.dart';
import 'package:ows_figma_myra_play/screens/authentications/registeration/otp.dart';
import 'package:ows_figma_myra_play/screens/authentications/registeration/term_n_condition.dart';
import 'package:ows_figma_myra_play/services/api/auth/auth.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController _controllerMobile = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPin = TextEditingController();
  TextEditingController _controllerState = TextEditingController();
  TextEditingController _controllerReferalCode = TextEditingController();

  bool _termsChecked = false;
  bool? checked = false;
  var items = [
    'Jammu',
    'Himachal',
    'Mahrashtra',
    'Punjab',
    'Bihar',
  ];
  String? _selectedState = "Choose State";
  String dropdownvalue = 'Arunachal Pradesh';
  bool agree = false;

  bool _isHidden2 = true;
  void _togglePasswordConfirmView() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
  }
  bool tryRegistration = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    App.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Background(
          child: Form(
            key: formKey,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: size.height * .10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                  ),
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
                  padding: const EdgeInsets.only(left: 25, right: 18),
                  child: TextFormField(
                    controller: _controllerName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Name';
                      }
                      return null;
                    },
                    onChanged: (v) {
                      setState(() {
                        tryRegistration = false;
                      });
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
                  padding: const EdgeInsets.only(left: 25, right: 18),
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
                    onChanged: (v) {
                      setState(() {
                        tryRegistration = false;
                      });
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 18),
                  child: TextFormField(
                    controller: _controllerMobile,
                    decoration: InputDecoration(labelText: "Mobile Number"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Mobile';
                      }
                      return null;
                    },
                    onChanged: (v) {
                      setState(() {
                        tryRegistration = false;
                      });
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
                  padding: const EdgeInsets.only(left: 25, right: 18),
                  child: DropdownButton(
                    // Initial Value
                    menuMaxHeight: MediaQuery.of(context).size.height,
                    value: dropdownvalue,
                    dropdownColor: Colors.white,
                    focusColor: Colors.blue,
                    isExpanded: true,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: indianState.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                        _controllerState.text = newValue;
                        tryRegistration = false;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 18),
                  child: TextFormField(
                    controller: _controllerPin,
                    decoration: InputDecoration(labelText: "Pin"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Pin';
                      }
                      return null;
                    },
                    onChanged: (v) {
                      setState(() {
                        tryRegistration = false;
                      });
                    },
                    maxLength: 6,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 18),
                  child: TextFormField(
                    controller: _controllerPassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                    onChanged: (v) {
                      setState(() {
                        tryRegistration = false;
                      });
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Password",
                      suffix: InkWell(
                        onTap: _togglePasswordConfirmView,
                        child: Icon(
                          _isHidden2
                              ?
                          Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),),
                    obscureText: _isHidden2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 18),
                  child: TextFormField(
                    controller: _controllerReferalCode,
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Enter Referal Code';
                    //   }
                    //   return null;
                    // },
                    onChanged: (v) {
                      setState(() {
                        tryRegistration = false;
                      });
                    },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Material(
                        child: Checkbox(
                          activeColor: Colors.green,
                          value: agree,
                          onChanged: (value) {
                            setState(() {
                              agree = value ?? false;
                              tryRegistration = false;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(child: TermAndCondition()),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                  child: Text(
                    agree ? '' : 'please select',
                    style: TextStyle(color: Color(0xFFe53935), fontSize: 12),
                  ),
                ),
                tryRegistration
                    ? Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ),
                )
                    :Center(
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
                            Color.fromARGB(255, 2, 3, 21),
                            Color.fromARGB(255, 178, 183, 184)
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Already Have an Account? ",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.pushReplacementNamed(
                              context, RouteGenerator.signIn)
                        },
                        child: Text(
                          " Sign in",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                    )
                  ],
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
      setState(() {
        tryRegistration = true;
      });
      print('-----------------------------------1');
      String referal='ZPL427066';
      if(_controllerReferalCode.text==null){
        referal='ZPL427066';
      }
      else{
        referal='';
      }
      String confirmCode = await ApiService.getRegistration(RegistrationModel(
        name: _controllerName.text,
        email: _controllerEmail.text,
        mobile: _controllerMobile.text,
        state: _controllerState.text,
        pin: _controllerPin.text,
        password: _controllerPassword.text,
        referal: referal,
      ));
      print('-----------------------------------2');
      if (confirmCode == 'ok') {
        CustomSnackBar.snackBar(
            context: context,
            data: 'Registration Successfully !',
            color: Colors.green);
        Navigator.pushReplacementNamed(context, RouteGenerator.signIn);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => OtpVerification(email: _controllerEmail.text)));
      } else {
        CustomSnackBar.snackBar(
            context: context,
            data: 'Failed to Registration !',
            color: Colors.red);
      }
    }
  }

  bool _isEmailValidate(String txt) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(txt);
  }
}
