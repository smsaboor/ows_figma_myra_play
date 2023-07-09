import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ows_figma_myra_play/screens/authentications/registeration/terms_notes.dart';

class TermAndCondition extends StatefulWidget {
  const TermAndCondition({Key? key}) : super(key: key);

  @override
  _TermAndConditionState createState() => _TermAndConditionState();
}

class _TermAndConditionState extends State<TermAndCondition> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10,bottom: 10),
      child: Text.rich(
          TextSpan(
              text: 'I have read and agree to the  ', style: TextStyle(
              fontSize: 16, color: Colors.black
          ),
              children: <TextSpan>[
                TextSpan(
                    text: 'Terms of Services', style: TextStyle(
                  fontSize: 16, color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>TermsOfServices()));
                        // code to open / launch terms of service link here
                      }
                ),
                // TextSpan(
                //     text: ' and ', style: TextStyle(
                //     fontSize: 18, color: Colors.black
                // ),
                //     children: <TextSpan>[
                //       TextSpan(
                //           text: 'Privacy Policy', style: TextStyle(
                //           fontSize: 18, color: Colors.black,
                //           decoration: TextDecoration.underline
                //       ),
                //           recognizer: TapGestureRecognizer()
                //             ..onTap = () {
                //               // code to open / launch privacy policy link here
                //             }
                //       )
                //     ]
                // )
              ]
          )
      ),
    );
  }
}
