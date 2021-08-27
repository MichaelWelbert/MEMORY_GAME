// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardcontroller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardController on _CardController, Store {
  final _$activeAtom = Atom(name: '_CardController.active');

  @override
  bool get active {
    _$activeAtom.reportRead();
    return super.active;
  }

  @override
  set active(bool value) {
    _$activeAtom.reportWrite(value, super.active, () {
      super.active = value;
    });
  }

  final _$_CardControllerActionController =
      ActionController(name: '_CardController');

  @override
  void setActiveCard(bool value) {
    final _$actionInfo = _$_CardControllerActionController.startAction(
        name: '_CardController.setActiveCard');
    try {
      return super.setActiveCard(value);
    } finally {
      _$_CardControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
active: ${active}
    ''';
  }
}
