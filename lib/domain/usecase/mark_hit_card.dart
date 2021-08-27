import 'package:memory_game/domain/entity/board.dart';

class MarkHitCard {
  final Board board;

  MarkHitCard({required this.board});

  bool call({required int firstCardSelect, required int secondCardSelect}) {
    bool isHit = false;
    if (firstCardSelect == secondCardSelect) {
      board.markHit(firstCardSelect);
      if (board.checkHasRemainPairs()) board.removeRemainingPairs();
      isHit = true;
    }

    if (board.checkHasRemainPairs() == false) board.endCards = true;

    return isHit;
  }
}
