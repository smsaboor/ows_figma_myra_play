import 'package:flutter/material.dart';

class RefferalBonus extends StatefulWidget {
  @override
  _RefferalBonusState createState() => _RefferalBonusState();
}

class _RefferalBonusState extends State<RefferalBonus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Referal Bonus'),
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
                      label: Text('User Name'),
                    ),
                    DataColumn(
                      label: Text('Bonus'),
                    ),
                    DataColumn(
                      label: Text("DATE & TIME"),
                    ),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ]),
                  ]),
            ))
      ]),
    );
  }
}
