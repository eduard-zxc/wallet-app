import 'package:flutter/material.dart';

class InfoBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;

  const InfoBanner(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
      leading: Image.asset(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: IconButton(
        highlightColor: Colors.black,
        onPressed: () {},
        icon: Icon(
          Icons.arrow_forward_ios_outlined,
          size: 40,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}
