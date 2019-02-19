import 'package:flutter/material.dart';
import 'package:random_number/screen/custom_widget/custom_appbar.dart';
import 'package:random_number/theme/images.dart';
import 'package:sensors/sensors.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'main_screen.dart';
import 'package:random_number/data/dataRandom.dart';

class NumberGameScreen extends StatefulWidget {
  @override
  _NumberGameScreenState createState() => _NumberGameScreenState();
}

bool changeUI = false;
class _NumberGameScreenState extends State<NumberGameScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  SoundManager soundManager = new SoundManager();
  int index = 0;

  Random number = Random();
  void _playSound(gameName) {
    if(gameName == 1){
      soundManager.playLocal("${soundNumber[index]}").then((onValue) {
      print("${soundAlphabet[index]}");
    });
    }
    else if(gameName == 2){
      soundManager.playLocal("${soundColors[index]}").then((onValue) {
        print("${soundColors[index]}");
      });
    }else if(gameName == 3){
      soundManager.playLocal("${soundAlphabet[index]}").then((onValue) {
        print("${soundAlphabet[index]}");
      });}
  }

  void randomNumber() {
    setState(() {
      if(gameName == 1){
      index = number.nextInt(11);
      }else if (gameName == 2){
        index = number.nextInt(12);
      }else if (gameName == 3){
        index = number.nextInt(24);
      }
    });
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Stack(
      children: <Widget>[
        Container(
          child: AnimatedBuilder(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Images.clock_background),
                        fit: BoxFit.fitHeight)),
              ),
              animation: animationController,
              builder: (BuildContext context, Widget _widget) {
                return Transform.rotate(
                  angle: animationController.value * 6.3,
                  child: _widget,
                );
              }),
        ),
        Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  height: 100,
                  color: Colors.transparent,
                )),
            Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      uiRandom(gameName, index),
                      RaisedButton(onPressed: () {
                        randomNumber();
                        _playSound(gameName);
                      }),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(Images.background))),
                )),
          ],
        )
      ],
    ));
  }
}

class SoundManager {
  AudioPlayer audioPlayer = new AudioPlayer();

  Future playLocal(localFileName) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = new File("${dir.path}/$localFileName");
    if (!(await file.exists())) {
      final soundData = await rootBundle.load("assets/$localFileName");
      final bytes = soundData.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
    }
    await audioPlayer.play(file.path, isLocal: true);
  }
}

Widget uiRandom (gameName,int index, {List<Color> listRandom = colorsRandom} ){
  if(gameName == 2){
    return Container (
      height: 200.0,
      width: 200.0,
      color: colorsRandom[index],
    );
  } else if(gameName == 1 || gameName == 3){
    if (gameName == 1){
      changeUI = true;
    }
    return  Container (
      height: 200.0,
      width: 200.0,
      child: Center(child: Text(changeUI?'${numberRandom[index]}':'${alphabetRandom[index]}',style: TextStyle(fontSize: 100.0),)),
    );
  }


}