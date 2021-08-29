import 'package:memory_game/domain/game_factory.dart';
import 'package:memory_game/presentation/domain_access/interface_presentation_domain_access.dart';

class PresentationDomainAccess implements IPresentationDomainAccess {
  late GameFactory gameFactory;

  PresentationDomainAccess() {
    gameFactory = GameFactory();
  }

  int boardGetLenght() {
    return gameFactory.board.get().length;
  }

  @override
  int cardIconId({required int id}) {
    return gameFactory.board.get()[id].iconId;
  }

  @override
  int cardId({required int indexPosition}) {
    return gameFactory.board.get()[indexPosition].id;
  }

  @override
  bool cardIsMarked({required int id}) {
    return gameFactory.board.get()[id].mark;
  }

  @override
  bool playGame({required int firstCardSelect, required int secondCardSelect}) {
    gameFactory.steps.add();
    return gameFactory.markHitCard(firstCardSelect: firstCardSelect, secondCardSelect: secondCardSelect);
  }

  @override
  int numberOfSteps() {
    return gameFactory.steps.get();
  }

  @override
  bool isEndGame() {
    return gameFactory.board.endCards;
  }

  @override
  void reset() {
    gameFactory.reset();
  }
}
