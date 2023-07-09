import 'package:flutter/material.dart';

class DailyTaskBonus extends StatefulWidget {
  @override
  _DailyTaskBonusState createState() => _DailyTaskBonusState();
}

class _DailyTaskBonusState extends State<DailyTaskBonus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Daily Task Bonus'),
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
                      label: Text('DAILY TASK INCOME'),
                    ),
                    DataColumn(
                      label: Text('DEDUCTION'),
                    ),
                    DataColumn(
                      label: Text('FINAL BONUS'),
                    ),
                    DataColumn(
                      label: Text("DATE & TIME"),
                    ),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('7AD143709')),
                      DataCell(Text('Gopal Kumar')),
                      DataCell(Text('10.00')),
                      DataCell(Text('15%')),
                      DataCell(Text('')),
                      DataCell(Text('2022-05-17 11:18:26')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('5AD143709')),
                      DataCell(Text('Gopal Kumar')),
                      DataCell(Text('10.00')),
                      DataCell(Text('15%')),
                      DataCell(Text('')),
                      DataCell(Text('2022-05-17 11:18:26')),
                    ]),
                  ]),
            ))
      ]),
    );
  }
}
