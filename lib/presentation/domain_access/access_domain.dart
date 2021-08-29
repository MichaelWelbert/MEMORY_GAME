import 'package:memory_game/domain/presentetaion_domain_access.dart';
import 'package:memory_game/presentation/domain_access/interface_presentation_domain_access.dart';

class AccessDomain {
  static IPresentationDomainAccess _game = PresentationDomainAccess();

  static int boardLenght() => _game.boardGetLenght();
  static int cardIconId({required id}) => _game.cardIconId(id: id);
  static bool cardIsMarked({required id}) => _game.cardIsMarked(id: id);
  static int cardId({required indexPosition}) => _game.cardId(indexPosition: indexPosition);
  static bool playGame({required int firstCardSelect, required int secondCardSelect}) => _game.playGame(
        firstCardSelect: firstCardSelect,
        secondCardSelect: secondCardSelect,
      );
  static int numberOfSteps() => _game.numberOfSteps();
  static bool isEndGame() => _game.isEndGame();
  static void reset() => _game.reset();
}
