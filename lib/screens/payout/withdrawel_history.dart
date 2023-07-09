import 'package:flutter/material.dart';

class WithdrawelHistory extends StatefulWidget {
  @override
  _WithdrawelHistoryState createState() => _WithdrawelHistoryState();
}

class _WithdrawelHistoryState extends State<WithdrawelHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Withdrawel History'),
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
                      label: Text('REQUEST DATE & TIME'),
                    ),
                    DataColumn(
                      label: Text('USER ID'),
                    ),
                    DataColumn(
                      label: Text('NAME'),
                    ),
                    DataColumn(
                      label: Text('ACCOUNT NO.'),
                    ),
                    DataColumn(
                      label: Text('IFSC CODE'),
                    ),
                    DataColumn(
                      label: Text('AMOUNT'),
                    ),
                    DataColumn(
                      label: Text('CASH BACK DEDICATION 5%'),
                    ),
                    DataColumn(
                      label: Text('TDS+SERVICE DEDICATION 10%'),
                    ),
                    DataColumn(
                      label: Text('NET AMOUNT'),
                    ),
                    DataColumn(
                      label: Text('STATUS'),
                    ),
                    DataColumn(
                      label: Text('APPROVED TIME & DATE'),
                    ),
                  ], rows: [
                DataRow(cells: [
                  DataCell(Text(' ')),
                  DataCell(Text(' ')),
                  DataCell(Text(' ')),
                  DataCell(Text(' ')),
                  DataCell(Text(' ')),
                  DataCell(Text(' ')),
                  DataCell(Text(' ')),
                  DataCell(Text(' ')),
                  DataCell(Text(' ')),
                  DataCell(Text(' ')),
                  DataCell(Text(' ')),
                  DataCell(Text(' ')),
                ]),
              ]),
            ))
      ]),
    );
  }
}
