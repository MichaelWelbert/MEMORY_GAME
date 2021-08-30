import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:memory_game/presentation/store/cardcontroller.dart';
import 'package:memory_game/presentation/play.dart';

class CardButton extends StatefulWidget {
  final int id;
  final String iconPath;

  const CardButton({Key? key, required this.id, required this.iconPath}) : super(key: key);

  @override
  _CardButtonState createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  void _selectCard(CardController cardController) {
    if (cardController.active == false) {
      PlayGame.execute(cardController);
    }
  }

  @override
  Widget build(BuildContext context) {
    CardController cardController = CardController(widget.id, widget.iconPath);
    cardController.setActiveCard(false);

    return IconButton(
      onPressed: () => _selectCard(cardController),
      icon: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(
            builder: (_) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image: cardController.active
                    ? DecorationImage(
                        image: AssetImage(widget.iconPath),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: AssetImage('who.png'),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
