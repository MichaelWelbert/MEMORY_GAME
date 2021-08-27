// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardtile.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardTile on _CardTile, Store {
  final _$markAtom = Atom(name: '_CardTile.mark');

  @override
  bool get mark {
    _$markAtom.reportRead();
    return super.mark;
  }

  @override
  set mark(bool value) {
    _$markAtom.reportWrite(value, super.mark, () {
      super.mark = value;
    });
  }

  final _$_CardTileActionController = ActionController(name: '_CardTile');

  @override
  void markCard(bool value) {
    final _$actionInfo =
        _$_CardTileActionController.startAction(name: '_CardTile.markCard');
    try {
      return super.markCard(value);
    } finally {
      _$_CardTileActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mark: ${mark}
    ''';
  }
}
