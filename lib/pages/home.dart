import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app/util/my_card.dart';

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
              onPressed: () {},
              backgroundColor: Colors.grey[350],
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
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

          // 3 buttons -> send + pay + bills

          // column -> stats + transactions
        ],
      ),
    );
  }
}
