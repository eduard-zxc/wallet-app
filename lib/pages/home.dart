import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app/util/action_button.dart';
import 'package:wallet_app/util/info_banner.dart';
import 'package:wallet_app/util/my_card.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Text(
                  'My',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                Text(
                  ' Cards',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
            FloatingActionButton.small(
              heroTag: 'btn2',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                      appBar: AppBar(
                        title: const Text('Profile'),
                      ),
                      showDeleteConfirmationDialog: true,
                      actions: [
                        SignedOutAction(
                          (context) {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                      // cupertinoNavigationBar: const CupertinoNavigationBar(
                      //   leading: const Icon(Icons.abc),
                      //   backgroundColor: Colors.amber,
                      //   middle: Text('Some text'),
                      // ),
                    ),
                  ),
                );
              },
              backgroundColor: Colors.grey[350],
              child: SizedBox(width: 25, child: Image.asset('icons/user.png')),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              // cards
              SizedBox(
                height: 200,
                child: PageView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    MyCard(
                      balance: 5200.20,
                      cardNumber: '**** 7800',
                      expirationDate: '10/24',
                      cardColor: Colors.amber,
                    ),
                    MyCard(
                      balance: 12555.00,
                      cardNumber: '1456 **21',
                      expirationDate: '11/26',
                      cardColor: Colors.indigo,
                    ),
                    MyCard(
                      balance: 586.10,
                      cardNumber: '5670 ****',
                      expirationDate: '03/25',
                      cardColor: Colors.green,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const ExpandingDotsEffect(activeDotColor: Colors.black),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 3 buttons -> send + pay + bills
                    ActionButton(label: 'Send', customIcon: 'icons/send.png'),
                    ActionButton(
                        label: 'Pay', customIcon: 'icons/card-payment.png'),
                    ActionButton(label: 'Bills', customIcon: 'icons/bill.png'),
                  ],
                ),
              ),
              // stats + transactions
              const InfoBanner(
                  title: 'Statistics',
                  subtitle: 'Payments and income',
                  icon: 'icons/analytics.png'),
              const InfoBanner(
                  title: 'Transactions',
                  subtitle: 'Transaction history',
                  icon: 'icons/atm-card.png')
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn1',
        backgroundColor: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        child: const Icon(Icons.beach_access_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[350],
        child: Container(
          color: Colors.grey[400],
          height: 100,
          width: 100,
          child: Theme(
            data: Theme.of(context).copyWith(
                dividerTheme:
                    const DividerThemeData(color: Colors.transparent)),
            child: const DrawerHeader(
              child: Column(),
            ),
          ),
        ),
      ),
    );
  }
}
