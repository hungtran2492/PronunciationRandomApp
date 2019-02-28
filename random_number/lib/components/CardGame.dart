import 'package:flutter/material.dart';
import 'package:random_number/data/Category.dart';
import 'package:random_number/screen/game_screen.dart';
import 'package:random_number/screen/main_screen.dart';
import 'package:shimmer/shimmer.dart';
class CardGame extends StatefulWidget {
  final Category category;
  final double parallaxPercent;

  CardGame({this.category, this.parallaxPercent});

  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Shimmer.fromColors(
                      baseColor: Colors.red,
                      highlightColor: Colors.yellow,
                      child: Center(
                        child: Text(
                          widget.category.gameName.toUpperCase(),
                          style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0),
                        ),
                      ),
                    ),
                    flex: 4,
                  ),
                  Expanded(
                    child: InkWell(
                      child: SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: Image.asset('assets/image/icon/woodsign.png'),
                      ),
                      onTap: () {
                        openBoardLanguage(context);
                      },
                    ),
                    flex: 2,
                  )
                ],
              )),
          flex: 2,
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FractionalTranslation(
                  translation: Offset(widget.parallaxPercent * 2.0, 0.0),
                  child: InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        widget.category.backgroundAssetPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () {
                      print(widget.category.gameIndex);
                      if (widget.category.gameIndex == 1) {
                        setState(() {
                          gameName = 1;
                        });
                        //print(gameName);
                        print('Navigate To Number Game');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GameScreen()));
                      } else if (widget.category.gameIndex == 2) {
                        setState(() {
                          gameName = 2;
                        });
                        //print(gameName);
                        print('Navigate To Alphabet Game');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GameScreen()));
                      } else if (widget.category.gameIndex == 3) {
                        setState(() {
                          gameName = 3;
                        });
                        print(gameName);
                        print('Navigate To Color Game');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GameScreen()));
                      } else if (widget.category.gameIndex == 4) {
                        setState(() {
                          gameName = 4;
                        });
                        print(gameName);
                        print('Navigate To Animal Game');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GameScreen()));
                      } else if (widget.category.gameIndex == 5) {
                        setState(() {
                          gameName = 5;
                        });
                        print(gameName);
                        print('Navigate To Vehicle Game');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GameScreen()));
                      } else if (widget.category.gameIndex == 6) {
                        setState(() {
                          gameName = 6;
                        });
                        print(gameName);
                        print('Navigate To Fruit Game');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GameScreen()));
                      }
                    },
                  )),
            ),
          ),
        ),
        Expanded(
          child: Container(),
          flex: 2,
        )
      ],
    );
  }
}