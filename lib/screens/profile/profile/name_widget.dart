import 'package:flutter/material.dart';

class BuildName extends StatelessWidget {
  const BuildName(this.name, this.email, {Key? key}) : super(key: key);
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          email,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
