import 'package:flutter/material.dart';

class SalvaLog {
  static double valueLog = 0;
  static List<String> valoresLog = [];

  SalvaLog() {}

  double getValueLog() {
    return valueLog;
  }

  void setValueLog(double value) {
    valueLog = value;
  }

  void setValoreslog(String value) {
    valoresLog.add(value);
  }

  @override
  String toString() {
    return 'Valor de conversão: {$valueLog}';
  }
}
