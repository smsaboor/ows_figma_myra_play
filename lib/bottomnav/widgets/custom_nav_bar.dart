import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key, required this.index, required this.function})
      : super(key: key);
  final int index;
  final Function(int) function;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      onTap: function,
      selectedItemColor: Colors.amber,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow), label: "Play Game"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_sharp), label: 'Wallet'),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
      ],
    );
  }
}
