// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:interest_app/widgets/textfromfield.dart';
import 'package:intl/intl.dart';

class AbonoCapital extends StatefulWidget {
  const AbonoCapital({super.key});

  @override
  State<AbonoCapital> createState() => _AbonoCapitalState();
}

class _AbonoCapitalState extends State<AbonoCapital> {
  var valorTotalPrestado;
  var tasaInteres;
  var frecuencia;
  var numeroPeriodo;
  var cuota;
  final _formKey = GlobalKey<FormState>();
  var formatoResultado;
  int valorTotalPrestado2 = 0;
  double tasaInteres2 = 0;
  int frecuencia2 = 0;
  int numeroPeriodo2 = 0;
  double tasaInteres3 = 0;
  bool mostarTabla = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ABONO CAPITAL"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              textValorTotalPrestamo(textValorTotalPrestamo, (value) {
                valorTotalPrestado = value;
              }),
              textFromFieldTasaInteres(tasaInteres, (value) {
                tasaInteres = value;
              }),
              textFrecuencia(frecuencia, (value) {
                frecuencia = value;
              }),
              textNumeroPeriodo(numeroPeriodo, (value) {
                numeroPeriodo = value;
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "CN: ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    cuota == null ? "0" : formatoResultado,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          setState(() {
                            valorTotalPrestado2 = int.parse(valorTotalPrestado);

                            numeroPeriodo2 = int.parse(numeroPeriodo);

                            frecuencia2 = int.parse(frecuencia);

                            tasaInteres2 =
                                (int.parse(tasaInteres) / frecuencia2) / 100;

                            tasaInteres3 = (double.parse(tasaInteres) / 100);

                            cuota = (valorTotalPrestado2 * tasaInteres3) /
                                (1 - (pow(1 + tasaInteres3, -numeroPeriodo2)));

                            formatoResultado = NumberFormat.currency(
                              locale: "es",
                              symbol: r"$",
                            ).format(cuota);

                            Navigator.of(context)
                                .pushNamed("/tablaAbono", arguments: {
                              "Prestamo": valorTotalPrestado2,
                              "TasaInteres": tasaInteres3,
                              "Frecuencia": frecuencia2,
                              "NumeroPeriodo": numeroPeriodo2,
                              "Cuota": cuota
                            });
                          });
                        }
                      },
                      child: const Text("Continuar")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
