// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Board on _Board, Store {
  final _$endCardsAtom = Atom(name: '_Board.endCards');

  @override
  bool get endCards {
    _$endCardsAtom.reportRead();
    return super.endCards;
  }

  @override
  set endCards(bool value) {
    _$endCardsAtom.reportWrite(value, super.endCards, () {
      super.endCards = value;
    });
  }

  final _$_BoardActionController = ActionController(name: '_Board');

  @override
  void removeRemainingPairs() {
    final _$actionInfo = _$_BoardActionController.startAction(
        name: '_Board.removeRemainingPairs');
    try {
      return super.removeRemainingPairs();
    } finally {
      _$_BoardActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
endCards: ${endCards}
    ''';
  }
}
