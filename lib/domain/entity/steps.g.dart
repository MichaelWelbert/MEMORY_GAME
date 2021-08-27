// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steps.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Steps on _Steps, Store {
  final _$_stepsAtom = Atom(name: '_Steps._steps');

  @override
  int get _steps {
    _$_stepsAtom.reportRead();
    return super._steps;
  }

  @override
  set _steps(int value) {
    _$_stepsAtom.reportWrite(value, super._steps, () {
      super._steps = value;
    });
  }

  final _$_StepsActionController = ActionController(name: '_Steps');

  @override
  void add() {
    final _$actionInfo =
        _$_StepsActionController.startAction(name: '_Steps.add');
    try {
      return super.add();
    } finally {
      _$_StepsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo =
        _$_StepsActionController.startAction(name: '_Steps.reset');
    try {
      return super.reset();
    } finally {
      _$_StepsActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
