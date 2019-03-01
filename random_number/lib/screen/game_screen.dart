import 'package:flutter/material.dart';
import 'package:random_number/components/PlayButton.dart';
import 'package:random_number/data/AlphabetData.dart';
import 'package:random_number/data/Animal.dart';
import 'package:random_number/data/ColorData.dart';
import 'package:random_number/data/Fruits.dart';
import 'package:random_number/data/MixedCatogery.dart';
import 'package:random_number/data/Number.dart';
import 'package:random_number/data/VarGlobal.dart';
import 'package:random_number/data/Vehicle.dart';
import 'package:random_number/functions/ChangeBackground.dart';
import 'package:random_number/functions/PlaySound.dart';
import 'package:random_number/functions/SoundManagerGameScreen.dart';
import 'package:random_number/functions/UIRandom.dart';
import 'dart:async';
import 'dart:math';
import 'package:sensors/sensors.dart';
import 'package:flutter/widgets.dart';



class GameScreen extends StatefulWidget {
  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  AppLifecycleState _lastLifecycleState;
  AnimationController animationController;
  SoundManagerGameScreen soundManager = SoundManagerGameScreen();

  Random number = Random();
  bool shake = true;

  ///random number function
  randomNumber() {
    setState(() {
      if (gameName == 1) {
        index = number.nextInt(numberRandom.length);
      } else if (gameName == 2) {
        if (language == 'english') {
          index = number.nextInt(alphabetRandom.length);
        } else if (language == 'vietnamese') {
          index = number.nextInt(alphabetVietnameseRandom.length);
        }
      } else if (gameName == 3) {
        index = number.nextInt(colorsRandom.length);
      } else if (gameName == 4) {
        index = number.nextInt(animalRandom.length);
      } else if (gameName == 5) {
        index = number.nextInt(vehicleRandom.length);
      } else if (gameName == 6) {
        index = number.nextInt(fruitsRandom.length);
      }
      if (gameName == 7) {
        if (language == 'english') {
          setState(() {
            indexMix1 = number.nextInt(mixedCategory.length);
            indexMix2 = number.nextInt(mixedCategory[indexMix1].length);
            mixedValue = mixedCategory[indexMix1][indexMix2];
          });
        } else if (language == 'vietnamese') {
          setState(() {
            indexMix1 = number.nextInt(mixedCategoryVietnamese.length);
            indexMix2 =
                number.nextInt(mixedCategoryVietnamese[indexMix1].length);
            mixedValue = mixedCategoryVietnamese[indexMix1][indexMix2];
          });
        }
      }
    });
  }

  @override
  void initState() {
    //shake function
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (shake == true) {
        if (event.x > 15 ||
            event.x < -15 ||
            event.y > 15 ||
            event.y < -15 ||
            event.z > 15 ||
            event.z < -15) {
          randomNumber();
          Future.delayed(Duration(milliseconds: 800),(){
            playSound(gameName);
          });
        }
      }
    });
    randomNumber();
    playSound(gameName);

//    animationController =
//        AnimationController(vsync: this, duration: Duration(seconds: 5));
//    animationController.repeat();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _lastLifecycleState = state;
      if (_lastLifecycleState == AppLifecycleState.inactive) {
        setState(() {
          shake = false;
        });
      } else if (_lastLifecycleState == AppLifecycleState.resumed) {
        setState(() {
          shake = true;
        });
      }
    });
    print('state : $_lastLifecycleState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: changeBackground(gameName), fit: BoxFit.fill)),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: shakeOption(),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: backButton(),
            ),
          ),
          changeUI(
            gameName,
            index,
          )
        ],
      ),
    );
  }

  changeUI(gameName, index) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              child: uiRandom(gameName, index),
              onTap: () {
                playSound(gameName);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[playButton(), nextButton()],
            )
          ],
        ),
      ),
    );
  }

  nextButton() {
    return InkWell(
      child: Container(
        height: 100,
        width: 100,
        child: Image.asset('assets/image/icon/nextIcon.png'),
      ),
      onTap: () {
        randomNumber();

        playSound(gameName);
      },
    );
  }

  shakeOption() {
    if (shake == true) {
      return InkWell(
          onTap: () {
            setState(() {
              shake = false;
              print('turn off shake');
            });
          },
          child: Container(
            height: 70,
            width: 70,
            child: Image.asset('assets/image/icon/shake.png'),
          ));
    } else
      return InkWell(
          onTap: () {
            setState(() {
              shake = true;
              print('turn on shake');
            });
          },
          child: Container(
            height: 70,
            width: 70,
            child: Image.asset('assets/image/icon/no_shake.png'),
          ));
  }

  backButton() {
    return InkWell(
        onTap: () {
          setState(() {
            Navigator.pop(context);
          });
        },
        child: Container(
            height: 70,
            width: 70,
            child: Icon(
              Icons.arrow_back,
              size: 70.0,
            )));
  }
}
