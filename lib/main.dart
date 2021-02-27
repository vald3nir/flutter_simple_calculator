import 'dart:ui';

import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _firstNumber = "";
  String _secondNumber = "";
  int __operationSelected = -1;
  String _operations = " ";

  void _clearOperation() {
    setState(() {
      _operations = " ";
      _firstNumber = "";
      _secondNumber = "";
      __operationSelected = -1;
    });
  }

  void _setOperation(int type) {
    setState(() {
      __operationSelected = type;
    });
    joinOperation();
  }

  void joinOperation() {
    setState(() {
      if (__operationSelected == -1) {
        _operations = _firstNumber;
      } else {
        if (_secondNumber.length > 0 && int.parse(_secondNumber) > 0) {
          _operations = _firstNumber +
              " " +
              _getOperationFromId(__operationSelected) +
              " " +
              _secondNumber +
              " = " +
              _runOperation(__operationSelected).toString();
        } else {
          _operations =
              _firstNumber + " " + _getOperationFromId(__operationSelected);
        }
      }
    });
  }

  String _getOperationFromId(int id) {
    switch (id) {
      case 0:
        return "+";
      case 1:
        return "-";
      case 2:
        return "*";
      case 3:
        return "/";
      case 4:
        return "%";
      default:
        return " ";
    }
  }

  double _runOperation(int operation) {
    switch (operation) {
      case 0:
        return double.parse(_firstNumber) + double.parse(_secondNumber);
      case 1:
        return double.parse(_firstNumber) - double.parse(_secondNumber);
      case 2:
        return double.parse(_firstNumber) * double.parse(_secondNumber);
      case 3:
        return double.parse(_firstNumber) / double.parse(_secondNumber);
      case 4:
        return double.parse(_firstNumber) % double.parse(_secondNumber);
      default:
        return 0;
    }
  }

  void _setFirstNumber(String number) {
    setState(() {
      _firstNumber += number;
    });
    joinOperation();
  }

  void _setSecondNumber(String number) {
    if (__operationSelected >= 0) {
      if (number == "0" && _secondNumber.length == 0) {
        return;
      }

      setState(() {
        _secondNumber += number;
      });
      joinOperation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 140,
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 2,
                    children: List.generate(10, (index) {
                      return GestureDetector(
                          onTap: () {
                            _setFirstNumber('$index');
                          },
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('$index',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 24)),
                            ),
                          ));
                    }),
                  ),
                ),
                Container(
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              child: RaisedButton(
                                  onPressed: () {
                                    _setOperation(0);
                                  },
                                  child: Text("+"))),
                          Expanded(
                              child: RaisedButton(
                                  onPressed: () {
                                    _setOperation(1);
                                  },
                                  child: Text("-"))),
                          Expanded(
                              child: RaisedButton(
                                  onPressed: () {
                                    _setOperation(2);
                                  },
                                  child: Text("*"))),
                          Expanded(
                              child: RaisedButton(
                                  onPressed: () {
                                    _setOperation(3);
                                  },
                                  child: Text("/"))),
                          Expanded(
                              child: RaisedButton(
                                  onPressed: () {
                                    _setOperation(4);
                                  },
                                  child: Text("%"))),
                        ]),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 140,
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 2,
                    children: List.generate(10, (index) {
                      return GestureDetector(
                          onTap: () {
                            _setSecondNumber('$index');
                          },
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('$index',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 24)),
                            ),
                          ));
                    }),
                  ),
                ),
                Container(
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Expanded(
                          //     child: RaisedButton(
                          //         color: Colors.blue,
                          //         onPressed: () {
                          //         },
                          //         child: Text("Calcular",
                          //             style: TextStyle(color: Colors.white)))),
                          Expanded(
                              child: RaisedButton(
                                  color: Colors.blue,
                                  onPressed: () {
                                    _clearOperation();
                                  },
                                  child: Text("Zerar",
                                      style: TextStyle(color: Colors.white))))
                        ]),
                  ),
                ),
                Column(children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Text(_operations),
                          ],
                        )),
                    // child: Text(
                    //   'Headline',
                    //   style: TextStyle(fontSize: 22),
                    // ),
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
