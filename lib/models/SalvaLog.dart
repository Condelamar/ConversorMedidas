import 'package:flutter/material.dart';

class SalvaLog {
  static List<String> valoresLog = [];

  SalvaLog() {}

  void setValoreslog(String value) {
    valoresLog.add(value);
  }
}
