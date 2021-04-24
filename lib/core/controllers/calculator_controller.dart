import 'package:mobx/mobx.dart';

part 'calculator_controller.g.dart';

class CalculatorController = CalculatorControllerBase
    with _$CalculatorController;

enum Operation { PLUS, MINUS, TIMES, DIVIDER, NONE }

abstract class CalculatorControllerBase with Store {
  @observable
  String response = "0";
  String firstNumber = "";
  String secondNumber = "";
  bool isFirstNumber = true;
  Operation operation = Operation.NONE;

  @action
  void callPlus() {
    response = firstNumber + " + ";
    isFirstNumber = false;
    operation = Operation.PLUS;
  }

  @action
  void callMinus() {
    response = firstNumber + " - ";
    isFirstNumber = false;
    operation = Operation.MINUS;
  }

  @action
  void callTimes() {
    response = firstNumber + " * ";
    isFirstNumber = false;
    operation = Operation.TIMES;
  }

  @action
  void callDivider() {
    response = firstNumber + " / ";
    isFirstNumber = false;
    operation = Operation.DIVIDER;
  }

  @action
  void clearOperation() {
    firstNumber = "";
    secondNumber = "";
    response = "";
    isFirstNumber = true;
    operation = Operation.NONE;
    response = "0";
  }

  @action
  void putDigital(int digital) {
    if (isFirstNumber) {
      if (digital == 0 && firstNumber.length == 0) return;
      firstNumber += digital.toString();
      response = firstNumber;
    } else {
      if (digital == 0 && secondNumber.length == 0) return;
      secondNumber += digital.toString();
      response = joinNumbers();
    }
  }

  String joinNumbers() {
    return firstNumber + getOperation() + secondNumber;
  }

  String getOperation() {
    switch (operation) {
      case Operation.PLUS:
        return " + ";
      case Operation.MINUS:
        return " - ";
      case Operation.TIMES:
        return " * ";
      case Operation.DIVIDER:
        return " / ";
      default:
        return " ";
    }
  }

  @action
  void resolve() {
    double n1 = double.parse(firstNumber);
    double n2 = double.parse(secondNumber);
    String res = "";

    switch (operation) {
      case Operation.PLUS:
        res = (n1 + n2).toString();
        break;

      case Operation.MINUS:
        res = (n1 - n2).toString();
        break;

      case Operation.TIMES:
        res = (n1 * n2).toString();
        break;

      case Operation.DIVIDER:
        res = (n1 / n2).toString();
        break;

      default:
        break;
    }

    response = joinNumbers() + " = " + res;
  }
}
