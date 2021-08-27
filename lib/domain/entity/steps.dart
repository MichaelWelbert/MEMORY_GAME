import 'package:mobx/mobx.dart';

part 'steps.g.dart';

class Steps = _Steps with _$Steps;

abstract class _Steps with Store {
  @observable
  int _steps = 0;

  @action
  void add() {
    _steps++;
  }

  @action
  void reset() {
    _steps = 0;
  }

  int get() => _steps;
}
