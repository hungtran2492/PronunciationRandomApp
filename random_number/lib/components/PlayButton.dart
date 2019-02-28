import 'package:flutter/material.dart';
import 'package:random_number/data/VarGlobal.dart';
import 'package:random_number/functions/PlaySound.dart';
import 'package:random_number/screen/main_screen.dart';

playButton() {
  return InkWell(
    child: Container(
      height: 100,
      width: 100,
      child: Image.asset('assets/image/icon/playapp.png'),
    ),
    onTap: () {
      playSound(gameName);
    },
  );
}