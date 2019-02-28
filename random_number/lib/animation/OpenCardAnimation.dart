import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:random_number/components/CardGame.dart';
import 'package:random_number/screen/game_screen.dart';

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.buttonController})
      : buttonZoomOutAnimation = new Tween(
    begin: 60.0,
    end: 1000.0,
  )
      .animate(
    new CurvedAnimation(parent: buttonController, curve: Curves.easeOut),
  ),
        buttonBottomtoCenterAnimation = new AlignmentTween(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
        )
            .animate(
          new CurvedAnimation(
            parent: buttonController,
            curve: new Interval(
              0.0,
              0.200,
              curve: Curves.easeOut,
            ),
          ),
        ),
        super(key: key);

  final Animation<double> buttonController;
  final Animation buttonZoomOutAnimation;
  final Animation<Alignment> buttonBottomtoCenterAnimation;

  Widget _buildAnimation(BuildContext context, Widget child) {
    timeDilation = 0.4;

    return  CardGame();
  }

  @override
  Widget build(BuildContext context) {
    buttonController.addListener(() {
      if (buttonController.isCompleted) {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> GameScreen()));
      }
    });
    return new AnimatedBuilder(
      builder: _buildAnimation,
      animation: buttonController,
    );
  }
}