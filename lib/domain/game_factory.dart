import 'package:memory_game/domain/usecase/mark_hit_card.dart';
import 'package:memory_game/util/setup.dart';

import 'entity/board.dart';
import 'entity/steps.dart';

class GameFactory {
  late Steps steps;
  late Board board;
  late MarkHitCard markHitCard;

  GameFactory() {
    _create();
  }

  _create() {
    steps = Steps();
    board = Board(lenght: BOARDTOTALCARD);
    markHitCard = MarkHitCard(board: board);
  }

  void reset() {
    _create();
  }
}
