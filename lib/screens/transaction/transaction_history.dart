import 'package:flutter/material.dart';

class TransactionHistory extends StatefulWidget {
  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Task Transaction'),
      ),
      body: Column(children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
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
                      label: Text('Transaction date Time'),
                    ),
                    DataColumn(
                      label: Text('Transaction Id'),
                    ),
                    DataColumn(
                      label: Text('Transaction Description'),
                    ),
                    DataColumn(
                      label: Text('Debit'),
                    ),
                    DataColumn(
                      label: Text('Credit'),
                    ),
                  ], rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('2022-05-31 09:59:58')),
                  DataCell(Text('TSK5212082235')),
                  DataCell(Text('Task completed bonus Added')),
                  DataCell(Text('0.00')),
                  DataCell(Text('20.00')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('2022-05-31 09:59:58')),
                  DataCell(Text('TSK5212082235')),
                  DataCell(Text('Task completed bonus Added')),
                  DataCell(Text('0.00')),
                  DataCell(Text('20.00')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('2022-05-31 09:59:58')),
                  DataCell(Text('TSK5212082235')),
                  DataCell(Text('Task completed bonus Added')),
                  DataCell(Text('0.00')),
                  DataCell(Text('20.00')),
                ]),
              ]),
            ))
      ]),
    );
  }
}
