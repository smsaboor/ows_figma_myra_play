
import 'package:flutter/material.dart';

class IDActivationHistory extends StatefulWidget {
  const IDActivationHistory({Key? key}) : super(key: key);
  @override
  _IDActivationHistoryState createState() => _IDActivationHistoryState();
}

class _IDActivationHistoryState extends State<IDActivationHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('E-PIN Activation History'),centerTitle: true,),
      body: Column(children: [
        SizedBox(height: MediaQuery.of(context).size.height*.03,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
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
                      label: Text('SR No'),
                    ),
                    DataColumn(
                      label: Text('Date & Time'),
                    ),
                    DataColumn(
                      label: Text('Activation E Pin'),
                    ),
                    DataColumn(
                      label: Text('Activate User Id'),
                    ),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('2022-06-02 01:34:13')),
                      DataCell(Text('2299019164859')),
                      DataCell(Text('ram (ZPL98745545)')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('2022-06-02 01:40:19')),
                      DataCell(Text('2292314906839')),
                      DataCell(Text('ram (ZPL98745545)')),
                    ]),
                  ]),
            ),
          ),
        ),
      ],),
    );
  }
}

