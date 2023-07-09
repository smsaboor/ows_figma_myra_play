import 'package:flutter/material.dart';

class MyReferalTeam extends StatefulWidget {
  @override
  _MyReferalTeamState createState() => _MyReferalTeamState();
}

class _MyReferalTeamState extends State<MyReferalTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Referal Team'),
      ),
      body: Column(children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * .03,
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
                      color: Colors.black45,
                    ),
                    columns: [
                      DataColumn(
                        label: Text('SR#'),
                      ),
                      DataColumn(
                        label: Text('User Id'),
                      ),
                      DataColumn(
                        label: Text('Name'),
                      ),
                      DataColumn(
                        label: Text('Mobile'),
                      ),
                      DataColumn(
                        label: Text('Act.Date'),
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('ZPL538557')),
                        DataCell(Text('Gopal Kumar')),
                        DataCell(Text('9211660123')),
                        DataCell(Text('2022-05-30 10:36:45\$')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('2')),
                        DataCell(Text('ZPL276721')),
                        DataCell(Text('Abshekh Kumar')),
                        DataCell(Text('9711660123')),
                        DataCell(Text('2021-05-30 10:36:45\$')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('3')),
                        DataCell(Text('ZPL771090')),
                        DataCell(Text('Jitendra Yadav')),
                        DataCell(Text('9341660123')),
                        DataCell(Text('2021-04-30 10:36:45\$')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('4')),
                        DataCell(Text('ZPL771030')),
                        DataCell(Text('Varun Sing')),
                        DataCell(Text('9211660123')),
                        DataCell(Text('2022-02-10 10:36:45\$')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('5')),
                        DataCell(Text('ZPL771039')),
                        DataCell(Text('Arshik sahu')),
                        DataCell(Text('9511650128')),
                        DataCell(Text('2022-01-20 10:36:45\$')),
                      ])
                    ]))),
      ]),
    );
  }
}
