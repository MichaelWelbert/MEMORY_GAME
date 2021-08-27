import 'dart:math';

import 'package:memory_game/domain/entity/cardtile.dart';
import 'package:mobx/mobx.dart';

part 'board.g.dart';

class Board = _Board with _$Board;

abstract class _Board with Store {
  late List<CardTile> _board;
  late int _remainingPairs;
  late int _boardLenght;

  @observable
  late bool endCards = false;

  _Board({required int lenght}) {
    _boardLenght = lenght;
    _start();
  }

  void reset() {
    _start();
  }

  void _start() {
    _boardLenght = _converter(_boardLenght);

    int totalCardPairs = (_boardLenght / 2).floor();
    List<CardTile> cards = List.generate(totalCardPairs, (index) {
      return CardTile(id: index + 1, iconId: index + 1, mark: false);
    });

    List<CardTile> cardList = [];

    cards.forEach((card) {
      cardList.add(card);
      cardList.add(card);
    });

    _board = _shuffle(cardList);

    _remainingPairs = totalCardPairs;
    endCards = false;
  }

  int _converter(int lenght) {
    lenght = _iconLenghtConverter(lenght);
    lenght = _evenConverter(lenght);
    lenght = _positiveConverter(lenght);
    return lenght;
  }

  int _iconLenghtConverter(int lenght) {
    int maxNumberOfIcons = 16;
    if (lenght > maxNumberOfIcons * 2) return maxNumberOfIcons * 2;

    return lenght;
  }

  int _evenConverter(int lenght) {
    if (lenght % 2 != 0) return lenght - 1;

    return lenght;
  }

  int _positiveConverter(int lenght) {
    if (lenght < 0) return -lenght;

    return lenght;
  }

  List<CardTile> _shuffle(List<CardTile> items) {
    Random random = new Random();

    for (int index = items.length - 1; index > 0; index--) {
      var randomElementIndex = random.nextInt(index + 1);

      CardTile temporaryItem = items[index];
      items[index] = items[randomElementIndex];
      items[randomElementIndex] = temporaryItem;
    }

    return items;
  }

  void markHit(int hitCardId) {
    List<CardTile> boardCards = _board;
    boardCards.forEach((card) {
      if (card.id == hitCardId) {
        card.markCard(true);
      }
    });

    _board = boardCards;
  }

  bool checkHasRemainPairs() {
    if (_remainingPairs > 0) return true;

    return false;
  }

  @action
  void removeRemainingPairs() {
    _remainingPairs--;
  }

  int getRemainingPairs() => _remainingPairs;

  List<CardTile> get() => _board;
}
