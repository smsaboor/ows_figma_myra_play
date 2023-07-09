import 'package:flutter/material.dart';
import 'package:ows_figma_myra_play/drawer/drawer2/drawer_widget.dart';
import 'package:ows_figma_myra_play/drawer/drawer2/page/user_page.dart';
import 'package:ows_figma_myra_play/route.dart';
import 'package:ows_figma_myra_play/screens/dashboard/dashboard.dart';
import 'package:ows_figma_myra_play/screens/earning/bonus_summary.dart';
import 'package:ows_figma_myra_play/screens/earning/daily_task_bonus.dart';
import 'package:ows_figma_myra_play/screens/earning/referal_bonus.dart';
import 'package:ows_figma_myra_play/screens/earning/team_task_bonus.dart';
import 'package:ows_figma_myra_play/screens/home/UserActive.dart';
import 'package:ows_figma_myra_play/screens/home/id_activation_history.dart';
import 'package:ows_figma_myra_play/screens/home/referral_bonus_history.dart';
import 'package:ows_figma_myra_play/screens/myteam/my_down_team.dart';
import 'package:ows_figma_myra_play/screens/myteam/my_referal_team.dart';
import 'package:ows_figma_myra_play/screens/payout/withdrawel.dart';
import 'package:ows_figma_myra_play/screens/payout/withdrawel_history.dart';
import 'package:ows_figma_myra_play/screens/pin_management/fresh_epin.dart';
import 'package:ows_figma_myra_play/screens/pin_management/used_epin.dart';
import 'package:ows_figma_myra_play/screens/profile_management/bank_kyc.dart';
import 'package:ows_figma_myra_play/screens/pin_management/request_epin.dart';
import 'package:ows_figma_myra_play/screens/profile_management/user_details.dart';
import 'package:ows_figma_myra_play/screens/query/create_query.dart';
import 'package:ows_figma_myra_play/screens/transaction/transaction_history.dart';
import 'package:ows_figma_myra_play/today/today_task.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'second_screen.dart';
import 'multi_level_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerHome extends StatefulWidget {
  @override
  _DrawerHomeState createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  Future<void>? _launched;
  String toLaunch = 'https://www.youtube.com/channel/UCnwDL-QpGbsRnAOCxaa4qxQ';

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    NavigationDrawerWidget navigationDrawerWidget = NavigationDrawerWidget();
    final name = 'Anoop Kumar';
    final email = 'anoop@gmail.com';
    final urlImage =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    Size size = MediaQuery.of(context).size;
    return MultiLevelDrawer(
      backgroundColor: Colors.white,
      rippleColor: Colors.white,
      subMenuBackgroundColor: Colors.grey.shade100,
      divisionColor: Colors.black45,
      header: navigationDrawerWidget.buildHeader(
        urlImage: urlImage,
        name: name,
        email: email,
        onClicked: (){}
        // onClicked: () => Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => UserPage(
        //     name: 'Ashish Kumar',
        //     urlImage: urlImage,
        //   ),
        // )
      ),
      children: [
        MLMenuItem(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(Icons.dashboard),
          ),
          content: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Dashboard"),
          ),
          onClick: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Dashboard()));
          },
        ),
        MLMenuItem(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(Icons.task),
          ),
          content: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Today Task"),
          ),
          onClick: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => TodayTask()));
          },
        ),
        MLMenuItem(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(Icons.perm_identity_outlined),
            ),
            trailing: Icon(Icons.arrow_right),
            content: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "ID",
              ),
            ),
            subMenuItems: [
              MLSubmenu(
                  onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => UserActive()));
                  },
                  submenuContent: Text("ID Activation")),
              MLSubmenu(
                  onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => IDActivationHistory()));
                  },
                  submenuContent: Text("ID Activation History")),
            ],
            onClick: () {}),
        MLMenuItem(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(Icons.task),
          ),
          content: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Referal Bonus History"),
          ),
          onClick: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ReferralBonusHistory()));
          },
        ),
        MLMenuItem(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(Icons.person),
            ),
            trailing: Icon(Icons.arrow_right),
            content: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "My Profile",
              ),
            ),
            subMenuItems: [
              MLSubmenu(
                  onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UserDetails(
                              isBottomnav: true,
                            )));
                  },
                  submenuContent: Text("Profile")),
              MLSubmenu(
                  onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BankKyc(
                              isBottomnav: true,
                            )));
                  },
                  submenuContent: Text("Bank KYC")),
              MLSubmenu(onClick: () {}, submenuContent: Text("Password")),
              MLSubmenu(onClick: () {}, submenuContent: Text("Trans Password")),
            ],
            onClick: () {}),
        MLMenuItem(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(Icons.supervised_user_circle),
            ),
            trailing: Icon(Icons.arrow_right),
            content: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("My Team"),
            ),
            onClick: () {},
            subMenuItems: [
              MLSubmenu(
                  onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyReferalTeam()));
                  },
                  submenuContent: Text("My Referal Team")),
              MLSubmenu(
                  onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyDownTeam()));
                  },
                  submenuContent: Text("My Down Team"))
            ]),
        MLMenuItem(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(Icons.perm_identity_outlined),
            ),
            trailing: Icon(Icons.arrow_right),
            content: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Transaction History",
              ),
            ),
            subMenuItems: [
              MLSubmenu(
                  onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TransactionHistory()));
                  },
                  submenuContent: Text("View Transaction History")),
            ],
            onClick: () {}),
        MLMenuItem(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(Icons.monetization_on),
            ),
            trailing: Icon(Icons.arrow_right),
            content: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "My Earning",
              ),
            ),
            subMenuItems: [
              MLSubmenu(
                  onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RefferalBonus()));
                  },
                  submenuContent: Text("Refferal Bonus")),
              MLSubmenu(
                  onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => DailyTaskBonus()));
                  },
                  submenuContent: Text("Daily Taskn Bonus")),
              MLSubmenu(
                  onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => TeamTaskBonus()));
                  },
                  submenuContent: Text("Team Task Bonus")),
              MLSubmenu(
                  onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => BonusSummary()));
                  },
                  submenuContent: Text("Bonus Summary")),
            ],
            onClick: () {}),
        MLMenuItem(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(Icons.perm_identity_outlined),
            ),
            trailing: Icon(Icons.arrow_right),
            content: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Reward",
              ),
            ),
            subMenuItems: [
              MLSubmenu(
                  onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UserDetails(
                              isBottomnav: true,
                            )));
                  },
                  submenuContent: Text("ID Activation")),
              MLSubmenu(
                  onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BankKyc(
                              isBottomnav: true,
                            )));
                  },
                  submenuContent: Text("ID Activation History")),
            ],
            onClick: () {}),
        MLMenuItem(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(Icons.payment),
            ),
            trailing: Icon(Icons.arrow_right),
            content: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Payout",
              ),
            ),
            subMenuItems: [
              MLSubmenu(
                  onClick: () {
                    Navigator.pop(context);
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Withdrawel()));
                  },
                  submenuContent: Text("Withdrawal")),
              MLSubmenu(
                  onClick: () {
                    Navigator.pop(context);
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => WithdrawelHistory()));
                  },
                  submenuContent: Text("Withdrawal History")),
            ],
            onClick: () {}),
        MLMenuItem(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(Icons.payment),
            ),
            trailing: Icon(Icons.arrow_right),
            content: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Supports",
              ),
            ),
            subMenuItems: [
              MLSubmenu(onClick: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CreateQuery()));

              }, submenuContent: Text("Create Query")),
              MLSubmenu(onClick: () {}, submenuContent: Text("Query Summary")),
            ],
            onClick: () {}),
        MLMenuItem(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(Icons.logout),
          ),
          content: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Logout"),
          ),
          onClick: () async{
            SharedPreferences preferences = await SharedPreferences.getInstance();
            preferences.setBool('isLogin', false);
            preferences.setString('email', '');
            preferences.setString('userId', '');
            Navigator.pushNamedAndRemoveUntil(context, RouteGenerator.signIn, (Route<dynamic> route) => false);
          },
        ),
      ],
    );
  }
}
