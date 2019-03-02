
import 'dart:math';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:random_number/components/CardFlipper.dart';
import 'package:random_number/functions/SoundManagerMainScreen.dart';
import 'package:random_number/data/Category.dart';
import 'package:random_number/components/BoardGuide.dart';
import 'package:random_number/components/BoardLanguage.dart';
import 'package:random_number/components/CustomBoard.dart';
import 'package:random_number/theme/images.dart';
import 'package:flutter/widgets.dart';
import 'package:random_number/data/VarGlobal.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';



class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with TickerProviderStateMixin {
  SoundManagerMainScreen soundManager = new SoundManagerMainScreen();
  CustomNextFuncBoard board;
  AnimationController _controller;

  Animation _animation1;
  Animation _animation2;
  Animation _animation3;
  var state;


  @override
  void initState() {
    super.initState();
    checkFirstSeen();
    readLanguage('language2');
    readLanguageValue('languageValue2');
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));

    _animation1 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.fastLinearToSlowEaseIn,
        )))
      ..addStatusListener(handler);
    _animation2 = Tween(begin: 0.2, end: -1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.2, 1.0, curve: Curves.fastOutSlowIn)))
      ..addStatusListener(handler);
    _animation3 = Tween(begin: -0.2, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 1.0, curve: Curves.fastOutSlowIn)))
      ..addStatusListener(handler);
  }

  void handler(status) {
    if (status == AnimationStatus.completed) {
      _controller.repeat();
      _animation1 = Tween(begin: -0.2, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
      _animation2 = Tween(begin: 0.2, end: -1.0).animate(CurvedAnimation(
          parent: _controller,
          curve: Interval(0.2, 1.0, curve: Curves.fastOutSlowIn)));
      _animation3 = Tween(begin: -0.2, end: 1.0).animate(CurvedAnimation(
          parent: _controller,
          curve: Interval(0.4, 1.0, curve: Curves.fastOutSlowIn)));
      _controller.forward();
    }
  }

  void playSound(state) async {
    soundManager.playLocal("sparrow_audio.mp3", "background_audio").then((_) {
      soundManager.audioPlayer
          .audioPlayerStateChangeHandler(AudioPlayerState.COMPLETED);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();

    super.dispose();
  }

  //Check first seen
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = prefs.getBool('seen') ?? false;

    if (_seen) {
      print('abc');
    } else {
      prefs.setBool('seen', true);
      Future.delayed(Duration(milliseconds: 100),(){
        openBoardGuide(context);
      });
    }
  }
  //read language
  readLanguage(String text) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      language = prefs.getString(text) ?? 'english';
    });

  }
  //read language value
  readLanguageValue(String text) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      languageValue = prefs.getInt(text) ?? 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    _controller.forward();
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
              body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Images.background),
                        fit: BoxFit.cover)),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Transform(
                      transform: Matrix4.translationValues(
                          _animation1.value * width, 0.0, 0.0),
                      child: SizedBox(
                        child: Image.asset('assets/image/icon/dove1.png'),
                        width: 30,
                        height: 30,
                      )),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child:
                      // Icon(Icons.arrow_back)
                      Transform(
                          transform: Matrix4.translationValues(
                              _animation2.value * width, 0.0, 0.0),
                          child: SizedBox(
                            child: Image.asset('assets/image/icon/dove2.png'),
                            width: 30,
                            height: 30,
                          )),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child:
                      // Icon(Icons.arrow_back)
                      Transform(
                          transform: Matrix4.translationValues(
                              _animation3.value * width, 0.0, 0.0),
                          child: SizedBox(
                            child: Image.asset('assets/image/icon/dove1.png'),
                            width: 30,
                            height: 30,
                          )),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: CardFlipper(
                  cards: backgroundCards,
                ),
              )
            ],
          ));
        });
  }


}

void openDialogLanguage(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: LanguageOption(),
        );
      });
}

void openBoardLanguage(BuildContext context) {
  var board;
  if (board != null && board.isOpen) {
    board.close();
    return;
  }
  board = CustomNextFuncBoard(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
      popupDirection: BoardDirection.up,
      borderColor: Colors.transparent,
      snapsFarAwayHorizontally: false,
      hasShadow: false,
      arrowTipDistance: 0.0,
      backgroundColor: Colors.transparent,
      touchThroughAreaCornerRadius: 0.0,
      showCloseButton: ShowCloseButton.inside,
      arrowLength: 0.0,
      arrowBaseWidth: 0.0,
      content: LanguageOption());
  board.show(context, MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height / 1.2);
}

void openBoardGuide(BuildContext context) {
  var board;
  if (board != null && board.isOpen) {
    board.close();
    return;
  }
  board = CustomNextFuncBoard(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
      popupDirection: BoardDirection.up,
      borderColor: Colors.transparent,
      snapsFarAwayHorizontally: false,
      hasShadow: false,
      arrowTipDistance: 0.0,
      backgroundColor: Colors.transparent,
      touchThroughAreaCornerRadius: 0.0,
      onClose: () {
        openBoardLanguage(context);
      },
      closeButtonSize: 50.0,
      showCloseButton: ShowCloseButton.inside,
      arrowBaseWidth: 0.0,
      arrowLength: 0.0,
      content: BoardGuide());
  board.show(context, MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height / 1.2);
}


