// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalculatorController on CalculatorControllerBase, Store {
  final _$responseAtom = Atom(name: 'CalculatorControllerBase.response');

  @override
  String get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(String value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  final _$CalculatorControllerBaseActionController =
      ActionController(name: 'CalculatorControllerBase');

  @override
  void callPlus() {
    final _$actionInfo = _$CalculatorControllerBaseActionController.startAction(
        name: 'CalculatorControllerBase.callPlus');
    try {
      return super.callPlus();
    } finally {
      _$CalculatorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void callMinus() {
    final _$actionInfo = _$CalculatorControllerBaseActionController.startAction(
        name: 'CalculatorControllerBase.callMinus');
    try {
      return super.callMinus();
    } finally {
      _$CalculatorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void callTimes() {
    final _$actionInfo = _$CalculatorControllerBaseActionController.startAction(
        name: 'CalculatorControllerBase.callTimes');
    try {
      return super.callTimes();
    } finally {
      _$CalculatorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void callDivider() {
    final _$actionInfo = _$CalculatorControllerBaseActionController.startAction(
        name: 'CalculatorControllerBase.callDivider');
    try {
      return super.callDivider();
    } finally {
      _$CalculatorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearOperation() {
    final _$actionInfo = _$CalculatorControllerBaseActionController.startAction(
        name: 'CalculatorControllerBase.clearOperation');
    try {
      return super.clearOperation();
    } finally {
      _$CalculatorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void putDigital(int digital) {
    final _$actionInfo = _$CalculatorControllerBaseActionController.startAction(
        name: 'CalculatorControllerBase.putDigital');
    try {
      return super.putDigital(digital);
    } finally {
      _$CalculatorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resolve() {
    final _$actionInfo = _$CalculatorControllerBaseActionController.startAction(
        name: 'CalculatorControllerBase.resolve');
    try {
      return super.resolve();
    } finally {
      _$CalculatorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
response: ${response}
    ''';
  }
}
