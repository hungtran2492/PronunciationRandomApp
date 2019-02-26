import 'package:flutter/material.dart';

class BoardGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.5,
        child: Center(
          child: Text('Guide How To Play'),
        ),
      ),
    );
  }
}
