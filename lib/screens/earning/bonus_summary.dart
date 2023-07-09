import 'package:flutter/material.dart';

class BonusSummary extends StatefulWidget {
  @override
  _BonusSummaryState createState() => _BonusSummaryState();
}

class _BonusSummaryState extends State<BonusSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bonus Summary'),
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
                      label: Text('DESCRIPTION'),
                    ),
                    DataColumn(
                      label: Text('BONUS'),
                    ),
                    DataColumn(
                      label: Text("DATE & TIME"),
                    ),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('1')),
                      DataCell(Text('')),
                      DataCell(Text('2022-05-17 11:18:26')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('1')),
                      DataCell(Text('')),
                      DataCell(Text('2022-05-17 11:18:26')),
                    ]),
                  ]),
            ))
      ]),
    );
  }
}
