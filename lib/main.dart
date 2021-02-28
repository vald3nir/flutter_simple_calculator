import 'package:calculator/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/buttons.dart';
import 'controllers/calculator_controller.dart';

final controller = CalculatorController();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class _Visor extends StatelessWidget {
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

// ignore: must_be_immutable
class _Keyboard extends StatelessWidget {
  var widgetList = [
    ["C", Colors.red, () {
      controller.clearOperation();
    }    ],
    ["0", Colors.grey, () { controller.putDigital(0) ;}    ],
    ["1", Colors.grey, () { controller.putDigital(1); }    ],
    ["2", Colors.grey, () { controller.putDigital(2); }    ],
    ["3", Colors.grey, () { controller.putDigital(3); }    ],
    ["4", Colors.grey, () { controller.putDigital(4); }    ],
    ["5", Colors.grey, () { controller.putDigital(5); }    ],
    ["6", Colors.grey, () { controller.putDigital(6); }    ],
    ["7", Colors.grey, () { controller.putDigital(7); }    ],
    ["8", Colors.grey, () { controller.putDigital(8); }    ],
    ["9", Colors.grey, () { controller.putDigital(9); }    ],
    ["=", Colors.red, () { controller.resolve(); }    ],
    ["+", Colors.orange, () { controller.callPlus(); }    ],
    ["-", Colors.orange, () { controller.callMinus(); }    ],
    ["*", Colors.orange, () { controller.callTimes(); }    ],
    ["/", Colors.orange, () { controller.callDivider(); }    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, crossAxisSpacing: 8, mainAxisSpacing: 4),
      padding: EdgeInsets.all(8),
      shrinkWrap: true,
      itemCount: widgetList.length,
      itemBuilder: (context, index) {
        return ButtonRounded(
            widgetList[index][0], widgetList[index][1], widgetList[index][2]);
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[_Visor(), _Keyboard()],
            ),
          ),
        ),
      ),
    );
  }
}
