import 'package:flutter/material.dart';

class Conversao extends ChangeNotifier {
  double _valorConvertido = 0;
  double _valorPassado = 0;

  Conversao() {}

  double getValorConvertido() {
    return _valorConvertido;
  }

  void setValorConvertido(double valor) {
    _valorConvertido = valor;
  }

  double getValorPassado() {
    return _valorPassado;
  }

  void setValorPassado(double valor) {
    _valorPassado = valor;
  }

  double converteMilhaKm() {
    return _valorConvertido = _valorPassado * 1.609;
  }

  double converteMilhaCm() {
    return _valorConvertido = _valorPassado * 0.0000062137;
  }

  double converteJardaKm() {
    return _valorConvertido = _valorPassado * 1093.6;
  }

  double converteJardaCm() {
    return _valorConvertido = _valorPassado * 0.010936;
  }

  @override
  String toString() {
    return _valorConvertido.toString();
  }
}
