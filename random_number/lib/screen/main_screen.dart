import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:random_number/data/Category.dart';
import 'package:random_number/screen/custom_widget/custom_appbar.dart';
import 'package:random_number/screen/game_screen.dart';
import 'package:random_number/theme/images.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Images.background), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GradientAppBar('Main Screen', 100),

          Expanded(
              child: Padding(
            padding: EdgeInsets.all(16.0),
            child: CardFlipper(
              cards: backgroundCards,
            ),
          )),
        ],
      ),
    ));
  }
}

int gameName = 0;

class CardGame extends StatefulWidget {
  final Category category;
  final double parallaxPercent;
  CardGame({this.category,this.parallaxPercent});
  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {







  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: FractionalTranslation(
                translation: Offset(widget.parallaxPercent * 2.0, 0.0),
                child: InkWell(
                  child: Image.asset(
                    widget.category.backgroundAssetPath,
                    fit: BoxFit.cover,
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
                      print(gameName);
                      print('Navigate To Color Game');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GameScreen()));
                    } else if (widget.category.gameIndex ==3) {
                      setState(() {
                        gameName = 3;
                        changeUI = false;
                      });
                      print(gameName);
                      print('Navigate To Animal Game');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GameScreen()));
                    } else if (widget.category.gameIndex ==4) {
                      setState(() {
                        gameName = 4;
                      });
                      print(gameName);
                      print('Navigate To Vehicle Game');
                    } else if (widget.category.gameIndex==5) {
                      setState(() {
                        gameName = 5;
                      });
                      print(gameName);
                      print('Navigate To Fruit Game');
                    }
                  },
                )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                const EdgeInsets.only(top: 30, left: 20.0, right: 20.0),
                child: Text(
                  widget.category.gameName.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


class CardFlipper extends StatefulWidget {
  final List<Category> cards;

  CardFlipper({this.cards});

  @override
  _CardFlipperState createState() => _CardFlipperState();
}

class _CardFlipperState extends State<CardFlipper>
    with TickerProviderStateMixin {
  double scrollPercent = 0.0;
  Offset startDrag;
  double startDragPercentScroll;
  double finishScrollStart;
  double finishScrollEnd;
  AnimationController finishScrollController;

  void _onHorizontalDragStart(DragStartDetails details) {
    startDrag = details.globalPosition;
    startDragPercentScroll = scrollPercent;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final currDrag = details.globalPosition;
    final dragDistance = currDrag.dx - startDrag.dx;
    final singleCardDragPercent = dragDistance / context.size.width;
    setState(() {
      scrollPercent = (startDragPercentScroll +
          (-singleCardDragPercent / widget.cards.length))
          .clamp(0.0, 1.0 - (1 / widget.cards.length));
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    finishScrollStart = scrollPercent;
    finishScrollEnd =
        (scrollPercent * widget.cards.length).round() / widget.cards.length;
    finishScrollController.forward(from: 0.0);
    setState(() {
      startDrag = null;
      startDragPercentScroll = null;
    });
  }

  List<Widget> _buildCards() {
    final cardCount = widget.cards.length;
    int index = -1;
    return widget.cards.map((Category category) {
      ++index;
      return _buildCard(category, index, cardCount, scrollPercent);
    }).toList();
  }
  Matrix4 _buildCardProjection(double scrollPercent){
    final perspective = 0.002;
    final radius = 1.0;
    final angle = scrollPercent * pi/8;
    final horizontalTranslation = 0.0;
    Matrix4 projection = Matrix4.identity()
      ..setEntry(0,0,1/radius)
      ..setEntry(1,1,1)
      ..setEntry(3,2,-perspective)
      ..setEntry(2,3,-radius)
      ..setEntry(3,3,perspective *radius + 1.0);
    final rotationPointMultiplier = angle >0.0?angle/angle.abs():1.0;
    print('Angle : $angle');
    projection *= Matrix4.translationValues(horizontalTranslation + (rotationPointMultiplier * 300.0), 0.0, 0.0) *
        Matrix4.rotationY(angle)*
        Matrix4.translationValues(0.0, 0.0, radius)*
        Matrix4.translationValues(-rotationPointMultiplier * 300.0, 0.0, 0.0);
    return projection;


  }

  Widget _buildCard(
      Category category, int cardIndex, int cardCount, double scrollPercent) {
    final cardScrollPercent = scrollPercent / (1 / cardCount);
    final parallax = scrollPercent - (cardIndex / cardCount);
    return FractionalTranslation(
      translation: Offset(cardIndex - cardScrollPercent, 0.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 16.0, right: 16.0),
        child: Transform(
            transform: _buildCardProjection(cardScrollPercent - cardIndex),
            child: CardGame(category: category, parallaxPercent: parallax)),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    finishScrollController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 150))
      ..addListener(() {
        setState(() {
          scrollPercent = lerpDouble(finishScrollStart, finishScrollEnd,
              finishScrollController.value);
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    finishScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      behavior: HitTestBehavior.translucent,
      child: Stack(
        children: _buildCards(),
      ),
    );
  }
}


