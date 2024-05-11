// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showDialogPressInteres2(
    BuildContext context, String capital, String valorFinal) {
  var resultado;
  var formatoResultado;

  var capitalSinComaNiPunto = capital.replaceAll(".0", "").replaceAll(",", "");
  var valorFinalSinComaNiPunto =
      valorFinal.replaceAll(".0", "").replaceAll(",", "");

  var capital2 = double.parse(capitalSinComaNiPunto);
  var valorfinal2 = double.parse(valorFinalSinComaNiPunto);
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          void calcularResultado() {
            resultado = valorfinal2 - capital2;
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
                  Text("Capital: $capital"),
                  Text("Valor final: $valorFinal"),
                  Text("Resultado: $formatoResultado")
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
