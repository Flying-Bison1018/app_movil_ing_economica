// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_math_fork/flutter_math.dart';
import 'package:intl/intl.dart';

void showDialogPressTasaInteresCompuesto(
  BuildContext context,
  String capital,
  String monto,
  String tasaInteres,
) {
  double monto2 = double.parse(monto);
  double capital2 = double.parse(capital);
  double tasasInteres2 = double.parse(tasaInteres) / 100;

  var resultado;
  var formatoResultado;
  showDialog(
    useSafeArea: true,
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          void calcularResultado() {
            resultado = (log(monto2) - log(capital2)) / (log(1 + tasasInteres2));
            formatoResultado = NumberFormat.currency(
              locale: "es",
              symbol: ""
            ).format(resultado);
          }

          calcularResultado();

          return AlertDialog(
            title: const Column(
              children: [Text("CALCULO")],
            ),
            content: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                children: [
                  const Text("DATOS"),
                  Text("Monto: $monto2"),
                  Text("Capital: $capital2"),
                  Text("Tasa Interes: $tasasInteres2"),
                  const Divider(),
                  Math.tex(
                      "N = \\frac{Log_{$monto2} - Log_{$capital2}}{Log_{1 + $tasasInteres2}}"),
                  const Divider(),
                  const Text("RESULTADO"),
                  Text("Resultado : $formatoResultado")
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cerrar"))
            ],
          );
        },
      );
    },
  );
}
