import 'package:calculator/core/models/buttons.dart';
import 'package:calculator/core/models/texts.dart';
import 'package:calculator/core/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final controller = CalculatorController();

final digits = [
  ["C", Colors.red, () { controller.clearOperation();}],
  ["0", Colors.grey, () { controller.putDigital(0);}],
  ["1", Colors.grey, () { controller.putDigital(1);}],
  ["2", Colors.grey, () { controller.putDigital(2);}],
  ["3", Colors.grey, () { controller.putDigital(3);}],
  ["4", Colors.grey, () { controller.putDigital(4);}],
  ["5", Colors.grey, () { controller.putDigital(5);}],
  ["6", Colors.grey, () { controller.putDigital(6);}],
  ["7", Colors.grey, () { controller.putDigital(7);}],
  ["8", Colors.grey, () { controller.putDigital(8);}],
  ["9", Colors.grey, () { controller.putDigital(9);}],
  ["=", Colors.red, () { controller.resolve();}],
  ["+", Colors.orange, () { controller.callPlus();}],
  ["-", Colors.orange, () { controller.callMinus();}],
  ["*", Colors.orange, () { controller.callTimes();}],
  ["/", Colors.orange, () { controller.callDivider();}],
];


// ignore: must_be_immutable
class KeyboardAndroid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, crossAxisSpacing: 8, mainAxisSpacing: 4),
      padding: EdgeInsets.all(8),
      shrinkWrap: true,
      itemCount: digits.length,
      itemBuilder: (context, index) {
        return ButtonRet(
            digits[index][0], digits[index][1], digits[index][2]);
      },
    );
  }
}

// ignore: must_be_immutable
class KeyboardIOS extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, crossAxisSpacing: 8, mainAxisSpacing: 4),
      padding: EdgeInsets.all(8),
      shrinkWrap: true,
      itemCount: digits.length,
      itemBuilder: (context, index) {
        return ButtonRounded(
            digits[index][0], digits[index][1], digits[index][2]);
      },
    );
  }
}

class Visor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      alignment: Alignment.bottomRight,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Observer(
          builder: (_) => LabelBig(controller.response, Colors.white),
        ),
      ),
    );
  }
}