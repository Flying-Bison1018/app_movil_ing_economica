// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:interest_app/formula_tiempo/formulatiempo.dart';

void showDialogPressTasaInteres(
    BuildContext context,
    String interes,
    String capital,
    String btnSelected,
    String ano,
    String meses,
    String dias,
    String semestre,
    String trimestre,
    String bimestre) {
  double interes2 = double.parse(interes);
  double capital2 = double.parse(capital);
  double M4 = double.parse(ano);
  double M5 = double.parse(meses);
  double M6 = double.parse(dias);
  double M7 = double.parse(bimestre);
  double M8 = double.parse(trimestre);
  double M9 = double.parse(semestre);

  var tiempo;
  var resultado;

  showDialog(
    useSafeArea: true,
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          void calcularResultado() {
            tiempo = formulaTiempo(M4, M5, M6, M7, M8, M9, btnSelected);

            resultado = (interes2 / (capital2 * tiempo)) * 100;
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
                  Text("Interes: $interes2"),
                  Text("Capital: $capital2"),
                  Text("Tiempo: $tiempo"),
                  const Divider(),
                  Math.tex(
                    "i = \\dfrac{$interes2}{$capital2 * ${tiempo.toStringAsFixed(1)}}",
                  ),
                  const Divider(),
                  const Text("RESULTADO"),
                  Text(
                      "Resultado : ${resultado.toStringAsFixed(1)} % $btnSelected")
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
