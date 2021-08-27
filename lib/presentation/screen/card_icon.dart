import 'package:flutter/material.dart';

class CardIcon extends StatelessWidget {
  final int id;
  final String iconPath;

  const CardIcon({Key? key, required this.id, required this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(image: AssetImage(iconPath), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
