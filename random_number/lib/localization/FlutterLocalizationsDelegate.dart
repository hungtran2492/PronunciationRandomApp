import 'dart:async';

import 'package:flutter/material.dart';
import 'package:random_number/localization/FlutterLocalizations.dart';

class FlutterLocalizationsDelegate
    extends LocalizationsDelegate<FlutterLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'vi'].contains(locale.languageCode);
  }

  @override
  Future<FlutterLocalizations> load(Locale locale) async {
    FlutterLocalizations localizations = new FlutterLocalizations(locale);
    await localizations.load();

    print("Load ${locale.languageCode}");

    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<FlutterLocalizations> old) {
    return false;
  }
}
