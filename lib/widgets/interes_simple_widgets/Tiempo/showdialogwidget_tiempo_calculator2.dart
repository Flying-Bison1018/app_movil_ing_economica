// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'package:flutter/material.dart';

void showDialogPressTiempo2(BuildContext context, String valorFinal,
    String capital, String tasaInteres, String btnSelected) {
  var capitalSinComaNiPunto = capital.replaceAll(".0", "").replaceAll(",", "");
  var valorFinalSinComaNiPunto =
      valorFinal.replaceAll(".0", "").replaceAll(",", "");
  var resultado;

  var capital2 = double.parse(capitalSinComaNiPunto);
  var valorFinal2 = double.parse(valorFinalSinComaNiPunto);

  var convertirTasaInteres = double.parse(tasaInteres);
  var porcentaje = convertirTasaInteres / 100;

  var tiempoEnDias;
  var meses;
  var fraccion;
  var dias;
  var parteFraccionaria;
  var parteFraccionaria2;

  Text? tiempo;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          void calcularResultado() {
            if (btnSelected == "ANUAL") {
              resultado = ((valorFinal2 / capital2) - 1) / porcentaje;
              parteFraccionaria = resultado % 1;

              fraccion = parteFraccionaria * 360;

              meses = fraccion / 30;
              parteFraccionaria2 = meses % 1;

              dias = parteFraccionaria2 * 30;

              tiempo = Text(
                  "Tiempo: ${resultado.toStringAsFixed(0)} años,${meses.toStringAsFixed(0)} meses,${dias.toStringAsFixed(0)} dias");
            }

            if (btnSelected == "MENSUAL") {
              resultado = ((valorFinal2 / capital2) - 1) / porcentaje;
              parteFraccionaria = resultado % 1;

              dias = parteFraccionaria * 30;

              tiempo = Text(
                  "Tiempo: ${resultado.toStringAsFixed(0)} meses,${dias.toStringAsFixed(0)} dias");
            }

            if (btnSelected == "SEMESTRAL") {
              resultado = ((valorFinal2 / capital2) - 1) / porcentaje;
              parteFraccionaria = (resultado % 1) * 6;

              dias = (parteFraccionaria % 1) * 180;

              tiempo = Text(
                  "Tiempo: ${resultado.toStringAsFixed(0)} semestres,${dias.toStringAsFixed(0)} dias");
            }

            if (btnSelected == "TRIMESTRAL") {
              resultado = ((valorFinal2 / capital2) - 1) / porcentaje;
              parteFraccionaria = (resultado % 1) * 3;

              dias = (parteFraccionaria % 1) * 90;

              tiempo = Text(
                  "Tiempo: ${resultado.toStringAsFixed(0)} trimestres,${dias.toStringAsFixed(0)} dias");
            }

            if (btnSelected == "BIMESTRAL") {
              resultado = ((valorFinal2 / capital2) - 1) / porcentaje;
              parteFraccionaria = (resultado % 1) * 2;

              dias = (parteFraccionaria % 1) * 60;

              tiempo = Text(
                  "Tiempo: ${resultado.toStringAsFixed(0)} bimestres,${dias.toStringAsFixed(0)} dias");
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
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                children: [
                  Text("Valor Final: $valorFinal"),
                  Text("Capital: $capital"),
                  Text("Tasa Interes: $porcentaje $btnSelected"),
                  Text("Resultado: ${resultado.toStringAsFixed(4)}"),
                  Text("Tiempo: ${tiempo.toString().replaceAll("Text", "")},")
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
