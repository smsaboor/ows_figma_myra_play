import 'package:flutter/material.dart';

class EPinSummary extends StatefulWidget {
  @override
  _EPinSummaryState createState() => _EPinSummaryState();
}

class _EPinSummaryState extends State<EPinSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('E-Pin Summary'),
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
                      label: Text('Particular'),
                    ),
                    DataColumn(
                      label: Text('Date'),
                    ),
                    DataColumn(
                      label: Text('User Id'),
                    ),
                    DataColumn(
                      label: Text('Name'),
                    ),
                    DataColumn(
                      label: Text("NO OF PIN'S"),
                    ),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('')),
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
