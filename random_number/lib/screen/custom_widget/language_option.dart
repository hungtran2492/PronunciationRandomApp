import 'package:flutter/material.dart';
String language;
class LanguageOption extends StatefulWidget {
  int languageValue ;
  LanguageOption({this.languageValue});
  @override
  _LanguageOptionState createState() => _LanguageOptionState();
}

class _LanguageOptionState extends State<LanguageOption> {


  void _handleRadioValueChange(int value) {
    setState(() {
      widget.languageValue = value;

      switch (widget.languageValue) {
        case 0:
          print('choose English');
          language = 'english';
          break;
        case 1:
          print('choose Vietnamese');
          language = 'vietnamese';
          break;
        case 2:
          print('choose French');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        //margin: EdgeInsets.all(50.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
              image: AssetImage('assets/image/background/background_wooden.png'),
              fit: BoxFit.cover),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Choose your Language'.toUpperCase(),style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(width:30.0,height: 30.0,child: Image.asset('assets/image/icon/english.png')),
                    Radio(
                        value: 0,
                        groupValue: widget.languageValue,
                        onChanged: _handleRadioValueChange),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(width:30.0,height: 30.0,child: Image.asset('assets/image/icon/vietnamese.png')),
                    Radio(
                        value: 1,
                        groupValue: widget.languageValue,
                        onChanged: _handleRadioValueChange),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(width:30.0,height: 30.0,child: Image.asset('assets/image/icon/french.png')),
                    Radio(
                        value: 2,
                        groupValue: widget.languageValue,
                        onChanged: _handleRadioValueChange),
                  ],
                ),

              ],
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
class LanguageOptionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),child: LanguageOption(),);
  }
}

