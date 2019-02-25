import 'package:flutter/material.dart';
import 'package:random_number/data/AlphabetData.dart';
import 'package:random_number/data/Animal.dart';
import 'package:random_number/data/Category.dart';
import 'package:random_number/data/Fruits.dart';
import 'package:random_number/data/Number.dart';
import 'package:random_number/data/Vehicle.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'main_screen.dart';
import 'package:random_number/data/ColorData.dart';
import 'package:sensors/sensors.dart';
import 'package:random_number/screen/custom_widget/language_option.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  SoundManager soundManager = new SoundManager();
  int index = 0;
  LanguageOption value = LanguageOption();


  Random number = Random();
  bool shake = true;

  void _playSound(gameName) {
    if (gameName == 1 ) {
      if(value == 0){
        soundManager
            .playLocal("${soundNumber[index]}", "audio", "english",
            "number")
            .then((onValue) {
          print("${soundNumber[index]}");
        });
      }else if (value==1){
        soundManager
            .playLocal("${soundNumber[index]}", "audio", "vietnamese",
            "number")
            .then((onValue) {
          print("${soundNumber[index]}");
        });
      }
    }
    else if (gameName == 2) {
      soundManager
          .playLocal("${soundAlphabet[index]}", "audio", "english", "alphabet")
          .then((onValue) {
        print("${soundAlphabet[index]}");
      });
    }else if (gameName == 3) {
      soundManager
          .playLocal("${soundColors[index]}", "audio", "english", "color")
          .then((onValue) {
        print("${soundColors[index]}");
      });
    } else if (gameName == 4) {
      soundManager
          .playLocal("${soundAnimal[index]}", "audio", "english", "animal")
          .then((onValue) {
        print("${soundAnimal[index]}");
      });
    } else if (gameName == 5) {
      soundManager
          .playLocal("${soundVehicle[index]}", "audio", "english", "vehicle")
          .then((onValue) {
        print("${soundVehicle[index]}");
      });
    } else if (gameName == 6) {
      soundManager
          .playLocal("${soundFruits[index]}", "audio", "english", "fruits")
          .then((onValue) {
        print("${soundFruits[index]}");
      });
    }
  }

  void randomNumber() {
    setState(() {
      if (gameName == 1) {
        index = number.nextInt(11);
      }else if (gameName == 2) {
        index = number.nextInt(24);
      } else if (gameName == 3) {
        index = number.nextInt(12);
      } else if (gameName == 4) {
        index = number.nextInt(10);
      } else if (gameName == 5) {
        index = number.nextInt(11);
      } else if (gameName == 6) {
        index = number.nextInt(20);
      }
    });
  }

  @override
  void initState() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (shake == true) {
        if (event.x > 10 || event.x < -10) {
          randomNumber();
          _playSound(gameName);
        }
      }
    });
    randomNumber();
    _playSound(gameName);

//    animationController =
//        AnimationController(vsync: this, duration: Duration(seconds: 5));
//    animationController.repeat();
    super.initState();
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
          changeUI(gameName)
        ],
      ),
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

  changeBackground(gameName) {
    if (gameName == 1) {
      return AssetImage(backgroundCards[0].backgroundGamePath);
    } else if (gameName == 2) {
      return AssetImage(backgroundCards[1].backgroundGamePath);
    } else if (gameName == 3) {
      return AssetImage(backgroundCards[2].backgroundGamePath);
    } else if (gameName == 4) {
      return AssetImage(backgroundCards[3].backgroundGamePath);
    } else if (gameName == 5) {
      return AssetImage(backgroundCards[4].backgroundGamePath);
    }else if (gameName == 6) {
      return AssetImage(backgroundCards[5].backgroundGamePath);
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
    } else if (gameName == 2) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[uiRandom(gameName, index), playButton()],
          ),
        ),
      );
    } else if (gameName == 3) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[uiRandom(gameName, index), playButton()],
          ),
        ),
      );
    } else if (gameName == 4) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[uiRandom(gameName, index), playButton()],
          ),
        ),
      );
    } else if (gameName == 5) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[uiRandom(gameName, index), playButton()],
          ),
        ),
      );
    }else if (gameName == 6) {
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
        child: Image.asset('assets/image/icon/playapp.png'),
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
          '${numberRandom[index]}',
          style: TextStyle(fontSize: 200.0, color: Colors.white),
        )),
      );
    }if (gameName == 2) {
      return Container(
        child: Center(
            child: Text(
              '${alphabetRandom[index]}',
              style: TextStyle(fontSize: 200.0, color: Colors.white),
            )),
      );
    }else if (gameName == 3) {
      return Container(
        height: 200,
        width: 200,
        child: Image.asset(
          'assets/image/color/balloons.png',
          color: colorsRandom[index],
        ),
      );
    } else if (gameName == 4) {
      return Container(
        height: 200,
        width: 200,
        child: Image.asset('${animalRandom[index]}'),
      );
    } else if (gameName == 5) {
      return Container(
        height: 200,
        width: 200,
        child: Image.asset('${vehicleRandom[index]}'),
      );
    } else if (gameName == 6) {
      return Container(
        height: 200,
        width: 200,
        child: Image.asset('${fruitsRandom[index]}'),
      );
    }
  }
}

class SoundManager {
  AudioPlayer audioPlayer = new AudioPlayer();

  Future playLocal(
      localFileName, soundFolder, soundFolder2, soundFolder3) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = new File("${dir.path}/$localFileName");
    if (!(await file.exists())) {
      final soundData = await rootBundle.load(
          "assets/$soundFolder/$soundFolder2/$soundFolder3/$localFileName");
      final bytes = soundData.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
    }
    await audioPlayer.play(file.path, isLocal: true);
  }
}
