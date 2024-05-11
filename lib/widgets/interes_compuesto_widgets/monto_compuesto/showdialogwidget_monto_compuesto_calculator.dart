// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_math_fork/flutter_math.dart';
import 'package:interest_app/formula_tiempo/formulatiempo.dart';
import 'package:interest_app/formula_tiempo/formulatiempo2.dart';
import 'package:intl/intl.dart';

void showDialogPressMontoCompuesto(
    BuildContext context,
    String capital,
    String tasaInteres,
    String btnSelected,
    String btnSelected2,
    String ano,
    String meses,
    String dias,
    String semestre,
    String trimestre,
    String bimestre) {
  double capital2 = double.parse(capital);
  double tasasInteres2 = double.parse(tasaInteres) / 100;
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
  var tasasInteres3;

  showDialog(
    useSafeArea: true,
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          void calcularResultado() {
            tiempo = formulaTiempo2(M4, M5, M6, M7, M8, M9, btnSelected2);
            if (btnSelected == btnSelected2) {
              resultado = capital2 * pow(1 + tasasInteres2, tiempo);

              formatoResultado = NumberFormat.currency(
                locale: "es",
                symbol: r'$',
              ).format(resultado);
            } else {
              tasasInteres3 = tasaInteresCompuestoCapitalizable( tasasInteres2, btnSelected, btnSelected2);
              //print(tasasInteres3);
              resultado2 = capital2 * pow(1 + tasasInteres3, tiempo);
              formatoResultado = NumberFormat.currency(
                locale: "es",
                symbol: r'$',
              ).format(resultado2);
            }
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
                  btnSelected == btnSelected2 ? Text("Tasa Interes: $tasasInteres2") : Text("Tasa Interes: $tasasInteres3"),
                  Text("Tiempo: $tiempo"),
                  const Divider(),
                  btnSelected == btnSelected2 ? Math.tex(
                      "MC = $capital2 * (1 + $tasasInteres2) ^ {$tiempo}") : Math.tex(
                      "MC = $capital2 * (1 + $tasasInteres3) ^ {$tiempo}"),
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
