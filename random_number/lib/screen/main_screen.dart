import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:random_number/screen/custom_widget/custom_appbar.dart';
import 'package:random_number/screen/game_screen.dart';
import 'package:random_number/theme/images.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Images.background), fit: BoxFit.cover)),
          child: Column(
            children: <Widget>[
              GradientAppBar('Main Screen', 120),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Choose your game',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Categories(),
              )
            ],
          )),
    );
  }
}

int gameName = 0;

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [
          Images.number,
          Images.color,
          Images.animal,
          Images.vehicle,
          Images.fruit
        ].map((categories) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.lightGreenAccent, Colors.green],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(0.5, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: InkWell(
                    child: Image.asset(
                      categories,
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      if (categories.contains(Images.number)) {
                        setState(() {
                          gameName = 1;
                        });
                        print(gameName);
                        print('Navigate To Number Game');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GameScreen()));
                      } else if (categories.contains(Images.color)) {
                        setState(() {
                          gameName = 2;
                        });
                        print(gameName);
                        print('Navigate To Color Game');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GameScreen()));
                      } else if (categories.contains(Images.animal)) {
                        setState(() {
                          gameName = 3;
                        });
                        print(gameName);
                        print('Navigate To Animal Game');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GameScreen()));
                      } else if (categories.contains(Images.vehicle)) {
                        setState(() {
                          gameName = 4;
                        });
                        print(gameName);
                        print('Navigate To Vehicle Game');
                      } else if (categories.contains(Images.fruit)) {
                        setState(() {
                          gameName = 5;
                        });
                        print(gameName);
                        print('Navigate To Fruit Game');
                      }
                    },
                  ));
            },
          );
        }).toList(),
        height: MediaQuery.of(context).size.height / 3,
        autoPlay: false);
  }
}
