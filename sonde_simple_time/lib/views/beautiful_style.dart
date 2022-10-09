import 'package:flutter/material.dart';

class ElegantButtonStyle extends ButtonStyle {
  Color mainColor = Colors.blue;
  ElegantButtonStyle({this.mainColor: Colors.green});

  @override
  // TODO: implement backgroundColor
  MaterialStateProperty<Color?>? get backgroundColor =>
      MaterialStateProperty.all<Color>(mainColor);
  @override
  // TODO: implement foregroundColor
  MaterialStateProperty<Color?>? get foregroundColor =>
      MaterialStateProperty.all<Color>(Colors.white);
}
