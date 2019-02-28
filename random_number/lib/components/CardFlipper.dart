
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:random_number/components/CardGame.dart';
import 'package:random_number/data/Category.dart';

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

  Matrix4 _buildCardProjection(double scrollPercent) {
    final perspective = 0.002;
    final radius = 1.0;
    final angle = scrollPercent * pi / 8;
    final horizontalTranslation = 0.0;
    Matrix4 projection = Matrix4.identity()
      ..setEntry(0, 0, 1 / radius)
      ..setEntry(1, 1, 1)
      ..setEntry(3, 2, -perspective)
      ..setEntry(2, 3, -radius)
      ..setEntry(3, 3, perspective * radius + 1.0);
    final rotationPointMultiplier = angle > 0.0 ? angle / angle.abs() : 1.0;
    projection *= Matrix4.translationValues(
        horizontalTranslation + (rotationPointMultiplier * 300.0),
        0.0,
        0.0) *
        Matrix4.rotationY(angle) *
        Matrix4.translationValues(0.0, 0.0, radius) *
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