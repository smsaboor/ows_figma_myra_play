import 'package:flutter/material.dart';
import 'package:ows_figma_myra_play/background.dart';
import 'package:ows_figma_myra_play/configs/app_theme.dart';
import 'package:ows_figma_myra_play/core/custom_snackbar.dart';
import 'package:ows_figma_myra_play/model/model_otp.dart';
import 'package:ows_figma_myra_play/route.dart';
import 'package:ows_figma_myra_play/screens/bottomnav/home_tab.dart';
import 'package:ows_figma_myra_play/services/api/auth/auth.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key, required this.email}) : super(key: key);
  final email;

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  _OtpVerificationState();

  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  late FocusNode text1, text2, text3, text4;

  @override
  void initState() {
    super.initState();
    text1 = FocusNode();
    text2 = FocusNode();
    text3 = FocusNode();
    text4 = FocusNode();
  }

  @override
  void dispose() {
    text1.dispose();
    text2.dispose();
    text3.dispose();
    text4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: size.height * .2,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Verify OTP",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Enter 4 digit code\nsend on ${widget.email} ",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black45,
                    fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            _boxBuilder(context),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  _verify();
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
                    "Verify",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _verify() async {
    if (formKey.currentState!.validate()) {
      print('-----------------------------------1');
      String otp = _controller1.text +
          _controller2.text +
          _controller3.text +
          _controller4.text;
      String confirmCode = await ApiService.verifyOtp(OtpModel(email: widget.email, otp: otp));
      print('-----------------------------------2');
      if (confirmCode == 'ok') {
        CustomSnackBar.snackBar(
            context: context,
            data: 'Otp Verified Successfully !',
            color: Colors.green);
        Navigator.pushReplacementNamed(context, RouteGenerator.signIn);
      } else {
        CustomSnackBar.snackBar(
            context: context,
            data: 'Wrong otp!',
            color: Colors.red);
      }
    }
  }

  Widget _boxBuilder(BuildContext context) {
    return Form(
        key: formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _box(context, _controller1, true, text1, text2),
            _box(context, _controller2, false, text2, text3),
            _box(context, _controller3, false, text3, text4),
            _box(context, _controller4, false, text4, text1),
          ],
        ));
  }

  Widget _box(BuildContext context, TextEditingController customController,
      bool focus, FocusNode text, FocusNode changeFocus) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 2.5),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 14,
      width: MediaQuery.of(context).size.width / 8,
      child: Center(
        child: TextField(
          autofocus: focus,
          focusNode: text,
          onChanged: (value) {
            if (value.length > 0) {
              FocusScope.of(context).requestFocus(changeFocus);
            }
          },
          cursorHeight: 40,
          controller: customController,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
              border: InputBorder.none,
              counterText: '',
              contentPadding: const EdgeInsets.all(20)),
        ),
      ),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.blue, width: 1)),
    );
  }
}
