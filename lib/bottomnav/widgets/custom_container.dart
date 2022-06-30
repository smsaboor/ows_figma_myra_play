import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key, this.txt}) : super(key: key);
  final txt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(txt),
      ),
      body: Container(
        child: Center(
          child: Text(txt),
        ),
      ),
    );
  }
}
