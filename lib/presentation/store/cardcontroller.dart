import 'package:mobx/mobx.dart';

part 'cardcontroller.g.dart';

class CardController = _CardController with _$CardController;

abstract class _CardController with Store {
  final int id;
  final String iconPath;

  @observable
  bool active = false;

  _CardController(this.id, this.iconPath);

  @action
  void setActiveCard(bool value) {
    active = value;
  }
}
