
import 'package:flutter/material.dart';

class ReferralBonusHistory extends StatefulWidget {
  const ReferralBonusHistory({Key? key}) : super(key: key);
  @override
  _ReferralBonusHistoryState createState() => _ReferralBonusHistoryState();
}

class _ReferralBonusHistoryState extends State<ReferralBonusHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Referral Bonus History'),centerTitle: true,),
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
                      label: Text('Activate by'),
                    ),
                    DataColumn(
                      label: Text('Activate id'),
                    ),
                    DataColumn(
                      label: Text('profit refferal code'),
                    ),
                    DataColumn(
                      label: Text('Debit'),
                    ),
                    DataColumn(
                      label: Text('Credit'),
                    ),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('')),
                      DataCell(Text(' ')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text(' ')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ]),
                  ]),
            ),
          ),
        ),
      ],),
    );
  }
}

