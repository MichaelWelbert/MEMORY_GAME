import 'package:flutter/material.dart';
import 'package:memory_game/kIcons.dart';
import 'package:memory_game/presentation/domain_access/access_domain.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'card_button.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => AccessDomain.isEndGame() ? EndGame() : InitiateGame(),
      ),
    );
  }
}

class EndGame extends StatelessWidget {
  const EndGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Você conseguiu comcluir o jogo em ${AccessDomain.numberOfSteps()} passos. Deseja tentar se superar?"),
          Container(
            width: 160,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                AccessDomain.reset();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Game(),
                  ),
                );
              },
              child: Text("Jogar Novamente"),
            ),
          ),
        ],
      ),
    );
  }
}

class InitiateGame extends StatelessWidget {
  const InitiateGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1200,
          height: 50,
          child: Observer(
            builder: (_) => Text("Numero de passos: ${AccessDomain.numberOfSteps()} "),
          ),
        ),
        Container(
          width: 1400,
          height: 500,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: AccessDomain.boardLenght(),
              itemBuilder: (BuildContext ctx, index) {
                return Observer(
                  builder: (_) => AccessDomain.cardIsMarked(id: index)
                      ? Container()
                      : CardButton(
                          id: AccessDomain.cardId(indexPosition: index),
                          iconPath: KIcons.generationIconLink(AccessDomain.cardIconId(id: index)),
                        ),
                );
              }),
        ),
      ],
    );
  }
}
