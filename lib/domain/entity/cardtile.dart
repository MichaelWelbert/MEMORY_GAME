import 'package:mobx/mobx.dart';
part 'cardtile.g.dart';

class CardTile = _CardTile with _$CardTile;

abstract class _CardTile with Store {
  final int id;
  final int iconId;

  @observable
  late bool mark;

  _CardTile({
    required this.id,
    required this.iconId,
    required this.mark,
  });

  @action
  void markCard(bool value) {
    mark = value;
  }
}
