import 'package:flutter/material.dart';
import 'package:random_number/data/Category.dart';

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
  }else if (gameName == 7) {
    return AssetImage(backgroundCards[6].backgroundGamePath);
}}