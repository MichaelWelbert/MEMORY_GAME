import 'package:memory_game/domain/usecase/mark_hit_card.dart';
import 'package:memory_game/presentation/domain_access/interface_game_factory.dart';
import 'package:memory_game/util/setup.dart';

import 'entity/board.dart';
import 'entity/steps.dart';

class GameFactory implements IGameFactory {
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

  int boardGetLenght() {
    return board.get().length;
  }

  @override
  int cardIconId({required int id}) {
    return board.get()[id].iconId;
  }

  @override
  int cardId({required int indexPosition}) {
    return board.get()[indexPosition].id;
  }

  @override
  bool cardIsMarked({required int id}) {
    return board.get()[id].mark;
  }

  @override
  bool playGame({required int firstCardSelect, required int secondCardSelect}) {
    steps.add();
    return markHitCard(firstCardSelect: firstCardSelect, secondCardSelect: secondCardSelect);
  }

  @override
  int numberOfSteps() {
    return steps.get();
  }

  @override
  bool isEndGame() {
    return board.endCards;
  }

  void reset() {
    _create();
  }
}
