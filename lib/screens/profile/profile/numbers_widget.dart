import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ows_figma_myra_play/screens/profile/auth_cubit/profile_cubit.dart';

class NumbersWidget extends StatelessWidget {
  NumbersWidget({required this.city, required this.pin, required this.age});
  final city,pin,age;
  @override
  Widget build(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, city??'', 'City'),
          buildDivider(),
          buildButton(context, pin.toString(), 'Pin'),
          buildDivider(),
          buildButton(context, age.toString(), 'Age'),
        ],
      );}

  Widget buildDivider() => Container(
        height: 24,
        child: VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            ),
          ],
        ),
      );
}
