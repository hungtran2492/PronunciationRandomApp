import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight;

  GradientAppBar(this.title, this.barHeight);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Container(
        padding: EdgeInsets.only(top: statusbarHeight),
        height: statusbarHeight + barHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.pinkAccent, Colors.redAccent],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(child: Row(mainAxisAlignment:MainAxisAlignment.end ,children: <Widget>[About(),],))
          ],
        ));
  }
}

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.error),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text('About'),
                    content: Text(
                        '''NF Learning Kids Game - A new & creative way to learn speaking
The game is most suitable for children under 3 years old, at their very first stage of life. It is full of color images and amusing animation, moving around by a light shake that helps kids enjoy themselves while learning how to speak.'''));
              });
        });
  }
}
class MultipleLanguage extends StatefulWidget {
  @override
  _MultipleLanguageState createState() => _MultipleLanguageState();
}

class _MultipleLanguageState extends State<MultipleLanguage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

