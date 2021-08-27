abstract class IGameFactory {
  int boardGetLenght();
  int cardIconId({required int id});
  bool cardIsMarked({required int id});
  int cardId({required int indexPosition});
  bool playGame({required int firstCardSelect, required int secondCardSelect});
  int numberOfSteps();
  bool isEndGame();
  void reset();
}
