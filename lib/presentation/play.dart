import 'dart:async';

import 'package:memory_game/presentation/domain_access/access_domain.dart';
import 'package:memory_game/presentation/store/cardcontroller.dart';

class PlayGame {
  static CardController? _firstCardSelect;
  static CardController? _secondCardSelect;

  static void execute(CardController cardselect) async {
    if (_firstCardSelect == null) {
      _firstCardSelect = cardselect;
      _firstCardSelect!.setActiveCard(true);
    } else if (_secondCardSelect == null) {
      _secondCardSelect = cardselect;
      _secondCardSelect!.setActiveCard(true);

      bool removedCard = await delayPlay(delaySecond: 1, firstCard: _firstCardSelect!.id, secondCard: _secondCardSelect!.id);

      if (removedCard == false) {
        _firstCardSelect!.setActiveCard(false);
        _secondCardSelect!.setActiveCard(false);
      }

      reset();
    }
  }

  static Future<bool> delayPlay({required int delaySecond, required int firstCard, required int secondCard}) async {
    return Future<bool>.delayed(
        Duration(seconds: delaySecond),
        () => AccessDomain.playGame(
              firstCardSelect: firstCard,
              secondCardSelect: secondCard,
            ));
  }

  static void reset() {
    _firstCardSelect = null;
    _secondCardSelect = null;
  }
}
