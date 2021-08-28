import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memory_game/util/kIcons.dart';
import 'package:memory_game/presentation/domain_access/access_domain.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:memory_game/util/colors.dart';
import 'package:memory_game/util/fonts.dart';
import 'package:memory_game/util/responsive.dart';
import 'package:memory_game/util/size_configure.dart';
import 'card_button.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfigure.setUpConfigure(MediaQuery.of(context));
    return Scaffold(
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) => AccessDomain.isEndGame() ? EndGame() : InitiateGame(),
        ),
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
      width: SizeConfigure.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 1200 * SizeConfigure.screenFactorSizeMultiplier,
            height: 200 * SizeConfigure.screenFactorSizeMultiplier,
            child: Observer(
              builder: (_) => RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Parabéns!!! Você conseguiu concluir o jogo em ${AccessDomain.numberOfSteps()} passos. Deseja tentar se superar?",
                  style: KTextStyle.body(
                    fontSize: 65 * SizeConfigure.screenFactorSizeMultiplier,
                    color: KColors.grayColor,
                    fontfamily: GoogleFonts.chewy().fontFamily,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50 * SizeConfigure.screenFactorSizeMultiplier,
          ),
          Container(
            width: 200 * SizeConfigure.screenFactorSizeMultiplier,
            height: 90 * SizeConfigure.screenFactorSizeMultiplier,
            child: ElevatedButton(
              onPressed: () {
                AccessDomain.reset();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Game(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) return KColors.grayColor.withOpacity(0.95);
                    return KColors.grayColor;
                  },
                ),
              ),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: RichText(
                  text: TextSpan(
                    text: "Jogar",
                    style: KTextStyle.title(fontSize: 28 * SizeConfigure.screenFactorSizeMultiplier, color: KColors.whiteColor),
                  ),
                ),
              ),
            ),
          )
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
    return Container(
      width: SizeConfigure.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20 * SizeConfigure.screenFactorSizeMultiplier,
          ),
          Container(
            alignment: Alignment.center,
            width: 1200 * SizeConfigure.screenFactorSizeMultiplier,
            height: 50 * SizeConfigure.screenFactorSizeMultiplier,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Observer(
                  builder: (_) => RichText(
                    text: TextSpan(
                      text: "Numero de passos:    ${AccessDomain.numberOfSteps()}",
                      style: KTextStyle.body(
                        fontSize: 35 * SizeConfigure.screenFactorSizeMultiplier,
                        color: KColors.grayColor,
                        fontfamily: GoogleFonts.chewy().fontFamily,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100 * SizeConfigure.screenFactorSizeMultiplier,
                  height: 40 * SizeConfigure.screenFactorSizeMultiplier,
                  child: ElevatedButton(
                    onPressed: () {
                      AccessDomain.reset();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => Game(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) return KColors.grayColor.withOpacity(0.95);
                          return KColors.grayColor;
                        },
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: RichText(
                        text: TextSpan(
                          text: "Reiniciar",
                          style: KTextStyle.title(fontSize: 18 * SizeConfigure.screenFactorSizeMultiplier, color: KColors.whiteColor),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10 * SizeConfigure.screenFactorSizeMultiplier,
          ),
          Container(
            width: 1300 * SizeConfigure.screenFactorSizeMultiplier,
            height: 650 * SizeConfigure.screenFactorSizeMultiplier,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Responsive.isDesktop(context) ? 8 : 4,
                  childAspectRatio: 1,
                ),
                shrinkWrap: true,
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
      ),
    );
  }
}
