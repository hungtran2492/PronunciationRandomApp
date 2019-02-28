import 'package:random_number/components/BoardLanguage.dart';
import 'package:random_number/functions/SoundManagerGameScreen.dart';
import 'package:random_number/data/AlphabetData.dart';
import 'package:random_number/data/Animal.dart';
import 'package:random_number/data/ColorData.dart';
import 'package:random_number/data/Fruits.dart';
import 'package:random_number/data/Number.dart';
import 'package:random_number/data/Vehicle.dart';
import 'package:random_number/screen/game_screen.dart';

SoundManagerGameScreen soundManager = SoundManagerGameScreen();

void playSound(gameName) {
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
          .playLocal("${soundNumberVietnamese[index]}", "audio", "vietnamese",
              "number")
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
          .playLocal("${soundAlphabet[index]}", "audio", "english", "alphabet")
          .then((onValue) {
        print("${soundAlphabet[index]}");
      });
    } else if (language == 'vietnamese') {
      soundManager
          .playLocal("${soundAlphabetVietnamese[index]}", "audio", "vietnamese",
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
          .playLocal("${soundAnimalVietnamese[index]}", "audio", "vietnamese",
              "animal")
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
          .playLocal("${soundVehicleVietnamese[index]}", "audio", "vietnamese",
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
          .playLocal("${soundFruitsVietnamese[index]}", "audio", "vietnamese",
              "fruits")
          .then((onValue) {
        print("${soundFruitsVietnamese[index]}");
      });
    }
  }
}
