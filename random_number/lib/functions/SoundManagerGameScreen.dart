import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart'show rootBundle;
import 'package:path_provider/path_provider.dart';

class SoundManagerGameScreen {
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