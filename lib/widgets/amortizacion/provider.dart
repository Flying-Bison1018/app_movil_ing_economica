import 'package:flutter/material.dart';

class SumaInteres extends ChangeNotifier {
  int _interes = 0;

  int get interes => _interes;

  void actualizarInteres(int nuevoInteres) {
    _interes = nuevoInteres;
    notifyListeners();
  }
}
