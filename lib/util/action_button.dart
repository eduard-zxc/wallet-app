import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final String customIcon;
  const ActionButton(
      {super.key, required this.label, required this.customIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: GestureDetector(
            onTap: () {},
            child: Image.asset(
              customIcon,
              width: 50,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(label),
        ),
      ],
    );
  }
}
