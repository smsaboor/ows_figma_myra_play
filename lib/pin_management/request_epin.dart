import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ows_figma_myra_play/bloc/user_activity.dart';
import 'package:ows_figma_myra_play/home/UserActive.dart';
import 'package:ows_figma_myra_play/qr_scanner/qr_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestEPin extends StatefulWidget {
  const RequestEPin({Key? key}) : super(key: key);

  @override
  _RequestEPinState createState() => _RequestEPinState();
}

class _RequestEPinState extends State<RequestEPin> {
  File? image;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController _controllerMobile = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  bool? checked = false;

  var _caratList = ['pK1', 'pK2', 'pK3', 'pK4'];
  String _currentSelectedValue = 'pK1';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: size.height * .1,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "E-Pin Manager",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2661FA),
                          fontSize: 30),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                    child: FormField<String>(
                      builder: (FormFieldState<String> state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                              labelText: 'Package',
                              labelStyle: new TextStyle(
                                  color: Colors.black54, fontSize: 16.0),
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 8.0),
                              hintText: 'Please select Package',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          isEmpty: _currentSelectedValue == '',
                          child: DropdownButtonHideUnderline(
                              child: SizedBox(
                            height: 30,
                            child: DropdownButton<String>(
                              value: _currentSelectedValue,
                              isDense: false,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _currentSelectedValue = newValue!;
                                  state.didChange(newValue);
                                });
                              },
                              items: _caratList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          )),
                        );
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter No of Pin';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: InputDecoration(
                        labelText: "No. of E-Pin",
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
                        if (value!.isEmpty) {
                          return 'Enter Total Amount';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: "Total Amount"),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: _controllerMobile,
                      decoration: InputDecoration(labelText: "Discount"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Discount';
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
                          return 'Enter total pay amount';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration:
                          InputDecoration(labelText: "Enter total pay amount"),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Utr No/Slip No"),
                      maxLength: 8,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .2,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            pickImage();
                          },
                          child: Text('choose File')),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .1,
                      ),
                      SizedBox(
                          height: 60,
                          width: 60,
                          child: GestureDetector(
                            child: Image.asset("assets/scanner.png"),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => QRScanner()));
                            },
                          ))
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 15.0),
                    child: Row(
                      children: [
                        RaisedButton(
                          onPressed: () {
                            context.read<UserActivityCubit>().updateIndex(1);
                            Navigator.pop(context);
                            // _save(context);
                            // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>UserActive()));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(0),
                          child: Container(
                            alignment: Alignment.center,
                            height: size.height * .06,
                            width: size.width * 0.4,
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(80.0),
                                gradient: new LinearGradient(colors: [
                                  Color.fromARGB(255, 13, 21, 142),
                                  Color.fromARGB(255, 41, 230, 255)
                                ])),
                            padding: const EdgeInsets.all(0),
                            child: Text(
                              "Submit",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .03,
                        ),
                        RaisedButton(
                          onPressed: () {
                            // _save(context);
                            // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>OtpScreen()));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(0),
                          child: Container(
                            alignment: Alignment.center,
                            height: size.height * .06,
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
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
