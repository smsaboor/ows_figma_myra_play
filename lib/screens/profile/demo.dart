import 'package:flutter/material.dart';

class DemoScafold extends StatelessWidget {
  const DemoScafold({Key? key, this.txt}) : super(key: key);
  final txt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          txt,
        ),
      ),
      body: Container(
        child: Center(
          child: Text(txt),
        ),
      ),
    );
  }
}
