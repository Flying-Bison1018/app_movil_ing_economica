// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:interest_app/formula_tiempo/formulatiempo.dart';
import 'package:intl/intl.dart';

void showDialogPressCapital2(
    BuildContext context,
    String valorFinal,
    String tasaInteres,
    String btnSelected,
    String ano,
    String meses,
    String dias,
    String semestre,
    String trimestre,
    String bimestre) {
  double valorFinal2 = double.parse(valorFinal);
  double tasasInteres2 = double.parse(tasaInteres) / 100;
  double M4 = double.parse(ano);
  double M5 = double.parse(meses);
  double M6 = double.parse(dias);
  double M7 = double.parse(bimestre);
  double M8 = double.parse(trimestre);
  double M9 = double.parse(semestre);

  var tiempo;
  var resultado;
  var formatoResultado;

  showDialog(
    useSafeArea: true,
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          void calcularResultado() {
            tiempo = formulaTiempo(M4, M5, M6, M7, M8, M9, btnSelected);

            resultado = valorFinal2 / (1 + (tasasInteres2 * tiempo));
            formatoResultado = NumberFormat.currency(
              locale: "es",
              symbol: r'$',
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
                  Text("Interes: $valorFinal2"),
                  Text("Tasa Interes: $tasasInteres2"),
                  Text("Tiempo: $tiempo"),
                  const Divider(),
                  Math.tex(
                    "C = \\dfrac{$valorFinal2}{($tasasInteres2 * ${tiempo.toStringAsFixed(1)})}",
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
