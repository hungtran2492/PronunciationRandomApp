import 'package:flutter/material.dart';
import 'package:random_number/components/BoardLanguage.dart';
import 'package:random_number/data/AlphabetData.dart';
import 'package:random_number/data/Animal.dart';
import 'package:random_number/data/ColorData.dart';
import 'package:random_number/data/Fruits.dart';
import 'package:random_number/data/Number.dart';
import 'package:random_number/data/Vehicle.dart';

uiRandom(gameName, int index, {List<Color> listRandom = colorsRandom}) {
  if (gameName == 1) {
    return Container(
      height: 200,
      width: 200,
      child: Center(
          child: Text(
            '${numberRandom[index]}',
            style: TextStyle(fontSize: 150.0, color: Colors.white),
          )),
    );
  }
  if (gameName == 2) {
    if (language == 'english') {
      return Container(
        height: 200,
        width: 200,
        child: Center(
            child: Text(
              '${alphabetRandom[index]}',
              style: TextStyle(fontSize: 150.0, color: Colors.white),
            )),
      );
    } else if (language == 'vietnamese') {
      return Container(
        height: 200,
        width: 200,
        child: Center(
            child: Text(
              '${alphabetVietnameseRandom[index]}',
              style: TextStyle(fontSize: 150.0, color: Colors.white),
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