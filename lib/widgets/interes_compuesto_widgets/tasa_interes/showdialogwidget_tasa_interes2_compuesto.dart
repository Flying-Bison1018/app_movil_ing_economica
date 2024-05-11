// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:interest_app/formula_tiempo/formulatiempo.dart';
import 'package:intl/intl.dart';

void showDialogPressTasaInteres2Compuesto(
    BuildContext context,
    String capital,
    String monto,
    String btnSelected,
    String ano,
    String meses,
    String dias,
    String semestre,
    String trimestre,
    String bimestre) {
  double capital2 = double.parse(capital);
  double monto2 = double.parse(monto);
  double M4 = double.parse(ano);
  double M5 = double.parse(meses);
  double M6 = double.parse(dias);
  double M7 = double.parse(bimestre);
  double M8 = double.parse(trimestre);
  double M9 = double.parse(semestre);
  var tiempo;
  var resultado;
  var resultado2;
  var formatoResultado;

  showDialog(
    useSafeArea: true,
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          void calcularResultado() {
            tiempo = formulaTiempo(M4, M5, M6, M7, M8, M9, btnSelected);
            
            resultado = pow((monto2 / capital2), 1 / tiempo) - 1;
            resultado2 = resultado * 100;
            formatoResultado = NumberFormat.currency(locale: "es", symbol: "%")
                .format(resultado2);
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
                  Text("Capital: $capital2"),
                  Text("Monto: $monto2"),
                  Text("Tiempo: $tiempo"),
                  const Divider(),
                  Math.tex(
                    "i = ($monto2 / $capital2)^{1/$tiempo} -1",
                  ),
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
