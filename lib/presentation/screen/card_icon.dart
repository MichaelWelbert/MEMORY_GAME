import 'package:flutter/material.dart';

class CardIcon extends StatelessWidget {
  final int id;
  final String iconPath;

  const CardIcon({Key? key, required this.id, required this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(iconPath), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
