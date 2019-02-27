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
import 'package:flutter/widgets.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  AppLifecycleState _lastLifecycleState;

  AnimationController animationController;
  SoundManager soundManager = new SoundManager();
  int index = 0;

  Random number = Random();
  bool shake = true;

  void _playSound(gameName) {
    ///Number Game
    if (gameName == 1) {
      if (language == 'english') {
        soundManager
            .playLocal("${soundNumber[index]}", "audio", "english", "number")
            .then((onValue) {
          print("${soundNumber[index]}");
          print('english');
        });
      } else if (language == "vietnamese") {
        soundManager
            .playLocal(
            "${soundNumberVietnamese[index]}", "audio", "vietnamese", "number")
            .then((onValue) {
          print("${soundNumberVietnamese[index]}");
          print('english');
        });
      }
    }
    ///Alphabet Game
    else if (gameName == 2) {
      if (language == 'english') {
        soundManager
            .playLocal(
            "${soundAlphabet[index]}", "audio", "english", "alphabet")
            .then((onValue) {
          print("${soundAlphabet[index]}");
        });
      } else if (language == 'vietnamese') {
        soundManager
            .playLocal(
            "${soundAlphabetVietnamese[index]}", "audio", "vietnamese",
            "alphabet")
            .then((onValue) {
          print("${soundAlphabetVietnamese[index]}");
        });
      }
    }
    ///Colors Game
    else if (gameName == 3) {
      if (language == 'english') {
        soundManager
            .playLocal("${soundColors[index]}", "audio", "english", "color")
            .then((onValue) {
          print("${soundColors[index]}");
        });
      } else if (language == 'vietnamese') {
        soundManager
            .playLocal(
            "${soundColorsVietnamese[index]}", "audio", "vietnamese", "color")
            .then((onValue) {
          print("${soundColorsVietnamese[index]}");
        });
      }
    }
    ///Animal Game
    else if (gameName == 4) {
      if (language == 'english') {
        soundManager
            .playLocal("${soundAnimal[index]}", "audio", "english", "animal")
            .then((onValue) {
          print("${soundAnimal[index]}");
        });
      } else if (language == 'vietnamese') {
        soundManager
            .playLocal(
            "${soundAnimalVietnamese[index]}", "audio", "vietnamese", "animal")
            .then((onValue) {
          print("${soundAnimalVietnamese[index]}");
        });
      }
    }
    ///Vehicle Game
    else if (gameName == 5) {
      if (language == 'english') {
        soundManager
            .playLocal("${soundVehicle[index]}", "audio", "english", "vehicle")
            .then((onValue) {
          print("${soundVehicle[index]}");
        });
      } else if (language == 'vietnamese') {
        soundManager
            .playLocal(
            "${soundVehicleVietnamese[index]}", "audio", "vietnamese",
            "vehicle")
            .then((onValue) {
          print("${soundVehicleVietnamese[index]}");
        });
      }
    }
    ///Fruits Game
    else if (gameName == 6) {
      if (language == 'english') {
        soundManager
            .playLocal("${soundFruits[index]}", "audio", "english", "fruits")
            .then((onValue) {
          print("${soundFruits[index]}");
        });
      } else if (language == 'vietnamese') {
        soundManager
            .playLocal(
            "${soundFruitsVietnamese[index]}", "audio", "vietnamese", "fruits")
            .then((onValue) {
          print("${soundFruitsVietnamese[index]}");
        });
      }
    }
  }

  ///random number function
  void randomNumber() {
    setState(() {
      if (gameName == 1) {
        index = number.nextInt(11);
      } else if (gameName == 2) {
        if (language == 'english') {
          index = number.nextInt(24);
        } else if (language == 'vietnamese') {
          index = number.nextInt(29);
        }
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
    //shake function
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (shake == true) {
        if (event.x > 15 || event.x < -15 || event.y > 15 || event.y < -15 ||
            event.z > 15 || event.z < -15) {
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
      }
      else if (_lastLifecycleState == AppLifecycleState.resumed) {
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
          changeUI(gameName)
        ],
      ),
    );
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
    } else if (gameName == 6) {
      return AssetImage(backgroundCards[5].backgroundGamePath);
    }
  }

  changeUI(gameName) {
    //if (gameName == 1) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(child: uiRandom(gameName, index), onTap: () {
                _playSound(gameName);
              },),
              Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children: <Widget>[playButton(),nextButton()],)
            ],
          ),
        ),
      );
//    } else if (gameName == 2) {
//      return Container(
//        child: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: <Widget>[uiRandom(gameName, index), playButton()],
//          ),
//        ),
//      );
//    } else if (gameName == 3) {
//      return Container(
//        child: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: <Widget>[uiRandom(gameName, index), playButton()],
//          ),
//        ),
//      );
//    } else if (gameName == 4) {
//      return Container(
//        child: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: <Widget>[uiRandom(gameName, index), playButton()],
//          ),
//        ),
//      );
//    } else if (gameName == 5) {
//      return Container(
//        child: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: <Widget>[uiRandom(gameName, index), playButton()],
//          ),
//        ),
//      );
//    } else if (gameName == 6) {
//      return Container(
//        child: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: <Widget>[uiRandom(gameName, index), playButton()],
//          ),
//        ),
//      );
//    }
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

  playButton() {
    return InkWell(
      child: Container(
        height: 100,
        width: 100,
        child: Image.asset('assets/image/icon/playapp.png'),
      ),
      onTap: () {
        _playSound(gameName);

      },
    );
  }
  nextButton(){
    return InkWell(
      child: Container(
        height: 100,
        width: 100,
        child: Image.asset('assets/image/icon/nextIcon.png'),
      ),
      onTap: () {
        randomNumber();
        _playSound(gameName);

      },
    );
  }
  backButton(){
    return InkWell(
        onTap: () {
          setState(() {
            Navigator.pop(context);
          });
        },
        child: Container(
          height: 70,
          width: 70,
          child: Icon(Icons.arrow_back,size: 70.0,)

        ));
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
    }
    if (gameName == 2) {
      if (language == 'english') {
        return Container(
          child: Center(
              child: Text(
                '${alphabetRandom[index]}',
                style: TextStyle(fontSize: 200.0, color: Colors.white),
              )),
        );
      } else if (language == 'vietnamese') {
        return Container(
          child: Center(
              child: Text(
                '${alphabetVietnameseRandom[index]}',
                style: TextStyle(fontSize: 200.0, color: Colors.white),
              )),
        );
      }
    } else if (gameName == 3) {
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

  Future playLocal(localFileName, soundFolder, soundFolder2,
      soundFolder3) async {
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
