import 'dart:ui';

import 'package:flutter/material.dart';

class _TextBase extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textSize;

  const _TextBase({this.text, this.textColor, this.textSize});

  @override
  Widget build(BuildContext context) {
    return Text(this.text,
        style: TextStyle(color: this.textColor, fontSize: this.textSize));
  }
}

class TitleDefault extends _TextBase {
  TitleDefault(String text)
      : super(text: text, textColor: Colors.black, textSize: 24.0);
}

class TextButtonsDefault extends _TextBase {
  TextButtonsDefault(String text)
      : super(text: text, textColor: Colors.white, textSize: 22.0);
}

class LabelDefault extends _TextBase {
  LabelDefault(String text)
      : super(text: text, textColor: Colors.black, textSize: 14.0);
}

class LabelShort extends _TextBase {
  LabelShort(String text)
      : super(text: text, textColor: Colors.black, textSize: 8.0);
}

class LabelBig extends _TextBase {
  LabelBig(String text, Color color)
      : super(text: text, textColor: color, textSize: 42.0);
}
