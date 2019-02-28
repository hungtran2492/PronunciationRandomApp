import 'package:flutter/material.dart';
import 'package:random_number/data/VarGlobal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHomePage(),
        routes:
        <String, WidgetBuilder>{NextPage.routeName: (context) => NextPage()
        }
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),),
      body: ListView(children: <Widget>[
        ListTile(
          title: TextField(
            controller: _controller,
          ),
        ),
        ListTile(
          title: RaisedButton(onPressed: saveName(),child: Text('Next Page'),),
        )
      ],),
    );
  }

  saveName() {
    String name = _controller.text;
    saveNamePreference(name).then((bool committed){
      Navigator.of(context).pushNamed(NextPage.routeName);
    });
  }
}

Future<bool> saveNamePreference(String name)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("name", name);
  return prefs.commit();
}
Future<String> getNamePreference()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String name = prefs.getString("name");
  return name;

}
class NextPage extends StatefulWidget {
  static String routeName = "/nextPage";
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  String _name ="";
  @override
  void initState() {
    getNamePreference().then(updateName);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Next Page'),),
      body: ListTile(title: Text(_name),),
    );
  }

  void updateName(String name) {
    setState(() {
      this._name = name;
    });
  }
}


