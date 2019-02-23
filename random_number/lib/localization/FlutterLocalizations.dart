import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterLocalizations {
  final Locale locale;
  Map<String, dynamic> _sentences;

  FlutterLocalizations(this.locale);

  static FlutterLocalizations of(BuildContext context) {
    return Localizations.of<FlutterLocalizations>(
        context, FlutterLocalizations);
  }

  Future<bool> load() async {
    String data = await rootBundle
        .loadString('res/strings/${this.locale.languageCode}.json');
    this._sentences = json.decode(data);
    return true;
  }

  String getString(String key) {
    return this._sentences[key];
  }
}
