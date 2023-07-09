import 'package:flutter/material.dart';

class FreshEPin extends StatefulWidget {
  @override
  _FreshEPinState createState() => _FreshEPinState();
}

class _FreshEPinState extends State<FreshEPin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Fresh Pin'),
      ),
      body: Column(children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * .1,
        ),
        SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  showBottomBorder: true,
                  dividerThickness: 5.0,
                  border: TableBorder.all(
                    width: 2.0,
                    color:Colors.black45,
                  ),
                  columns: [
                DataColumn(
                  label: Text('SR#'),
                ),
                DataColumn(
                  label: Text('Pack. Name'),
                ),
                DataColumn(
                  label: Text('Pack. Amount'),
                ),
                DataColumn(
                  label: Text('Date/Time'),
                ),
                DataColumn(
                  label: Text('Pin'),
                ),
                DataColumn(
                  label: Text('Issued By'),
                ),
              ], rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Welcome-202')),
                  DataCell(Text('202.00')),
                  DataCell(Text('2022-06-02 01:39:49')),
                  DataCell(Text('3501604684023')),
                  DataCell(Text('ZIPLAY')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Welcome-202')),
                  DataCell(Text('202.00')),
                  DataCell(Text('2022-06-02 01:39:49')),
                  DataCell(Text('3501604684023')),
                  DataCell(Text('ZIPLAY')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Welcome-202')),
                  DataCell(Text('202.00')),
                  DataCell(Text('2022-06-02 01:39:49')),
                  DataCell(Text('3501604684023')),
                  DataCell(Text('ZIPLAY')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Welcome-202')),
                  DataCell(Text('202.00')),
                  DataCell(Text('2022-06-02 01:39:49')),
                  DataCell(Text('3501604684023')),
                  DataCell(Text('ZIPLAY')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Welcome-202')),
                  DataCell(Text('202.00')),
                  DataCell(Text('2022-06-02 01:39:49')),
                  DataCell(Text('3501604684023')),
                  DataCell(Text('ZIPLAY')),
                ])
              ]),
            )),
      ]),
    );
  }
}
