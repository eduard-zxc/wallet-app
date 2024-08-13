import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/util/my_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              scrollDirection: Axis.horizontal,
              children: const [
                MyCard(),
                MyCard(),
                MyCard(),
              ],
            ),
          ),

          // 3 buttons -> send + pay + bills

          // column -> stats + transactions
        ],
      ),
    );
  }
}
