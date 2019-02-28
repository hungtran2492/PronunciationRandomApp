import 'package:random_number/components/BoardLanguage.dart';
import 'package:random_number/data/VarGlobal.dart';
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

  ///Mixed Category Game
  else if (gameName == 7) {
    if (language == 'english') {
      if (indexMix1 == 0) {
        soundManager
            .playLocal(
                "${soundNumber[indexMix2]}", "audio", "english", "number")
            .then((onValue) {
          print("${soundNumber[indexMix2]}");
        });
      } else if (indexMix1 == 1) {
        soundManager
            .playLocal(
                "${soundAlphabet[indexMix2]}", "audio", "english", "alphabet")
            .then((onValue) {
          print("${soundAlphabet[indexMix2]}");
        });
      } else if (indexMix1 == 2) {
        soundManager
            .playLocal("${soundColors[indexMix2]}", "audio", "english", "color")
            .then((onValue) {
          print("${soundColors[indexMix2]}");
        });
      } else if (indexMix1 == 3) {
        soundManager
            .playLocal(
                "${soundAnimal[indexMix2]}", "audio", "english", "animal")
            .then((onValue) {
          print("${soundAnimal[indexMix2]}");
        });
      } else if (indexMix1 == 4) {
        soundManager
            .playLocal(
                "${soundVehicle[indexMix2]}", "audio", "english", "vehicle")
            .then((onValue) {
          print("${soundVehicle[indexMix2]}");
        });
      } else if (indexMix1 == 5) {
        soundManager
            .playLocal(
                "${soundFruits[indexMix2]}", "audio", "english", "fruits")
            .then((onValue) {
          print("${soundFruits[indexMix2]}");
        });
      }

      /// MIXED CATEGORY VIETNAMESE
    } else if (language == 'vietnamese') {
      if(indexMix1 == 0){
        soundManager
            .playLocal("${soundNumberVietnamese[indexMix2]}", "audio", "vietnamese",
            "number")
            .then((onValue) {
          print("${soundNumberVietnamese[indexMix2]}");
        });
      }else if(indexMix1 == 1){
        soundManager
            .playLocal("${soundAlphabetVietnamese[indexMix2]}", "audio", "vietnamese",
            "alphabet")
            .then((onValue) {
          print("${soundAlphabetVietnamese[indexMix2]}");
        });
      }else if(indexMix1 == 2){
        soundManager
            .playLocal("${soundColorsVietnamese[indexMix2]}", "audio", "vietnamese",
            "color")
            .then((onValue) {
          print("${soundColorsVietnamese[indexMix2]}");
        });
      }else if(indexMix1 == 3){
        soundManager
            .playLocal("${soundAnimalVietnamese[indexMix2]}", "audio", "vietnamese",
            "animal")
            .then((onValue) {
          print("${soundAnimalVietnamese[indexMix2]}");
        });
      }else if(indexMix1 == 4){
        soundManager
            .playLocal("${soundVehicleVietnamese[indexMix2]}", "audio", "vietnamese",
            "vehicle")
            .then((onValue) {
          print("${soundVehicleVietnamese[indexMix2]}");
        });
      }else if(indexMix1 == 5){
        soundManager
            .playLocal("${soundFruitsVietnamese[indexMix2]}", "audio", "vietnamese",
            "fruits")
            .then((onValue) {
          print("${soundFruitsVietnamese[indexMix2]}");
        });
      }
    }
  }
}
