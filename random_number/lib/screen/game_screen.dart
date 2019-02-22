import 'package:flutter/material.dart';
import 'package:random_number/data/AlphabetData.dart';
import 'package:random_number/data/Animal.dart';
import 'package:random_number/data/Category.dart';
import 'package:random_number/screen/custom_widget/custom_appbar.dart';
import 'package:random_number/theme/images.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'main_screen.dart';
import 'package:random_number/data/ColorData.dart';
import 'package:sensors/sensors.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  SoundManager soundManager = new SoundManager();
  int index = 0;

  Random number = Random();

  void _playSound(gameName) {
    if (gameName == 1) {
      soundManager
          .playLocal("${soundAlphabetAndNumber[index]}", "alphabet")
          .then((onValue) {
        print("${soundAlphabetAndNumber[index]}");
      });
    } else if (gameName == 2) {
      soundManager.playLocal("${soundColors[index]}", "color").then((onValue) {
        print("${soundColors[index]}");
      });
    }else if (gameName == 3) {
      soundManager.playLocal("${soundAnimal[index]}", "animal").then((onValue) {
        print("${soundAnimal[index]}");
      });
    }
    
  }

  void randomNumber() {
    setState(() {
      if (gameName == 1) {
        index = number.nextInt(35);
      } else if (gameName == 2) {
        index = number.nextInt(12);
      }
      else if (gameName == 3){
        index = number.nextInt(10);
      }
    });
  }

  @override
  void initState() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (event.x > 10 || event.x < -10) {
        randomNumber();
        _playSound(gameName);
      }
    });
//    animationController =
//        AnimationController(vsync: this, duration: Duration(seconds: 5));
//    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: changeBackground(gameName), fit: BoxFit.fill)),
            ),
            changeUI(gameName)
          ],
        ));
  }

  changeBackground(gameName) {
    if (gameName == 1) {
      return AssetImage(backgroundCards[0].backgroundGamePath);
    } else if (gameName == 2) {
      return AssetImage(backgroundCards[1].backgroundGamePath);
    }
    else if (gameName == 3) {
      return AssetImage(backgroundCards[2].backgroundGamePath);
    }
  }

  changeUI(gameName) {
    if (gameName == 1) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[uiRandom(gameName, index), playButton()],
          ),
        ),
      );
    }
    else if (gameName == 2) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[uiRandom(gameName, index), playButton()],
          ),
        ),
      );
    }
    else if (gameName == 3) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[uiRandom(gameName, index), playButton()],
          ),
        ),
      );
    }
    
      
  }

  playButton() {
    return InkWell(
      child: Container(
        height: 100,
        width: 100,
        child: Image.asset('lib/res/images/playapp.png'),
      ),
      onTap: () {
        randomNumber();
        _playSound(gameName);
        print('${animalRandom[index]}');
      },
    );
  }

  uiRandom(gameName, int index, {List<Color> listRandom = colorsRandom}) {
    if (gameName == 1) {
      return Container(
        child: Center(
            child: Text(
          '${alphabetAndNumberRandom[index]}',
          style: TextStyle(fontSize: 200.0, color: Colors.white),
        )),
      );
    } else if (gameName == 3) {
      return Container(
        height: 200,
        width:  200,
        child: Image.asset('${animalRandom[index]}'),
      );
    }
  }
}

class SoundManager {
  AudioPlayer audioPlayer = new AudioPlayer();

  Future playLocal(localFileName, soundFolder) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = new File("${dir.path}/$localFileName");
    if (!(await file.exists())) {
      final soundData =
          await rootBundle.load("assets/$soundFolder/$localFileName");
      final bytes = soundData.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
    }
    await audioPlayer.play(file.path, isLocal: true);
  }
}
