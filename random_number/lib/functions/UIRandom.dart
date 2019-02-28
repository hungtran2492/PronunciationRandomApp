import 'package:flutter/material.dart';

import 'package:random_number/data/AlphabetData.dart';
import 'package:random_number/data/Animal.dart';
import 'package:random_number/data/ColorData.dart';
import 'package:random_number/data/Fruits.dart';
import 'package:random_number/data/Number.dart';
import 'package:random_number/data/VarGlobal.dart';
import 'package:random_number/data/Vehicle.dart';


uiRandom(gameName, int index, {List<Color> listRandom = colorsRandom}) {
  if (gameName == 1) {
    return Container(
      height: 200,
      width: 200,
      child: Image.asset('${numberRandom[index]}'),
    );
  }
  if (gameName == 2) {
    if (language == 'english') {
      return Container(
        height: 200,
        width: 200,
        child: Image.asset('${alphabetRandom[index]}'),
      );
    } else if (language == 'vietnamese') {
      return Container(
        height: 200,
        width: 200,
        child: Image.asset('${alphabetVietnameseRandom[index]}'),
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
  }else if (gameName == 7) {
    return Container(
      height: 200,
      width: 200,
      child: (indexMix1 == 2)?Image.asset(
        'assets/image/color/balloons.png',
        color: colorsRandom[indexMix2],
      ):Image.asset('$mixedValue')
    );
  }
}