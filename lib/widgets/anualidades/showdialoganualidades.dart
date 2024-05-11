// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:interest_app/formula_tiempo/formulatiempo3.dart';

void showDialogPressValorFuturo(
    BuildContext context,
    String deposito,
    String tasaInteres,
    String tiempo,
    String btnSelected,
    String btnSelected2) {
  double deposito2 = double.parse(deposito);
  double tasaInteres2 = double.parse(tasaInteres) / 100;
  double M4 = double.parse(tiempo);

  var resultadoTiempo;
  var tasaInteresNueva;

  var VF; //valor futuro anualidad

  showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          void calcularValorFuturo() {
            resultadoTiempo = formulaTiempoAnualidad(M4, btnSelected2);

            if (btnSelected2 == "ANUAL") {
              tasaInteresNueva = tasaInteres2 / 1;
            }

            if (btnSelected2 == "MENSUAL") {
              tasaInteresNueva = tasaInteres2 / 12;
            }

            if (btnSelected2 == "SEMESTRAL") {
              tasaInteresNueva = tasaInteres2 / 2;
            }

            if (btnSelected2 == "TRIMESTRAL") {
              tasaInteresNueva = tasaInteres2 / 4;
            }

            if (btnSelected2 == "BIMESTRAL") {
              tasaInteresNueva = tasaInteres2 / 6;
            }

            VF = deposito2 *
                (pow(1 + tasaInteresNueva, resultadoTiempo) - 1) /
                tasaInteresNueva;
          }

          calcularValorFuturo();

          return AlertDialog(
            title: const Column(
              children: [Text("RESULTADO")],
            ),
            content: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                children: [
                  Text(btnSelected),
                  const SizedBox(
                    height: 20,
                  ),
                  // Text("Resultado tiempo : $M4"),

                  Math.tex(
                      "VF = ${deposito2.toStringAsFixed(0)} * [ \\frac{(1 + ${tasaInteresNueva.toStringAsFixed(5)})^{${resultadoTiempo.toStringAsFixed(0)}} -1}{${tasaInteresNueva.toStringAsFixed(5)}}]"),
                  const SizedBox(
                    height: 20,
                  ),
                  //Text("Resultado tiempo : $resultadoTiempo"),
                  // Text("tasa interes : $tasaInteres2"),
                  // Text("Nueva t: $tasaInteresNueva"),
                  Text("Valor Futuro: ${VF.toStringAsFixed(2)}")
                ],
              ),
            ),
          );
        });
      });
}

void showDialogPressValorActual(
    BuildContext context,
    String pago,
    String tasaInteres,
    String tiempo,
    String btnSelected,
    String btnSelected2) {
  double pago2 = double.parse(pago);
  double tasaInteres2 = double.parse(tasaInteres) / 100;
  double M4 = double.parse(tiempo);

  var resultadoTiempo;
  var tasaInteresNueva;

  var VA; //valor actual anualidad

  showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          void calcularValorActual() {
            resultadoTiempo = formulaTiempoAnualidad(M4, btnSelected2);

            if (btnSelected2 == "ANUAL") {
              tasaInteresNueva = tasaInteres2 / 1;
            }

            if (btnSelected2 == "MENSUAL") {
              tasaInteresNueva = tasaInteres2 / 12;
            }

            if (btnSelected2 == "SEMESTRAL") {
              tasaInteresNueva = tasaInteres2 / 2;
            }

            if (btnSelected2 == "TRIMESTRAL") {
              tasaInteresNueva = tasaInteres2 / 4;
            }

            if (btnSelected2 == "BIMESTRAL") {
              tasaInteresNueva = tasaInteres2 / 6;
            }

            var resultadoTiempoNegativo = resultadoTiempo * -1;

            VA = pago2 *
                (1 - pow(1 + tasaInteresNueva, resultadoTiempoNegativo)) /
                tasaInteresNueva;
          }

          calcularValorActual();

          return AlertDialog(
            title: const Column(
              children: [Text("RESULTADO")],
            ),
            content: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                children: [
                  Text(btnSelected),
                  const SizedBox(
                    height: 20,
                  ),
                  Math.tex(
                      "VF = ${pago2.toStringAsFixed(0)} [ \\frac{1 - (1 + ${tasaInteresNueva.toStringAsFixed(5)})^{-${resultadoTiempo.toStringAsFixed(0)}}}{${tasaInteresNueva.toStringAsFixed(5)}}]"),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Valor actual: ${VA.toStringAsFixed(2)}")
                ],
              ),
            ),
          );
        });
      });
}

void showDialogPressDepositos(
    BuildContext context,
    String valorFuturo,
    String tasaInteres,
    String tiempo,
    String btnSelected,
    String btnSelected2) {
  double valorFuturo2 = double.parse(valorFuturo);
  double tasaInteres2 = double.parse(tasaInteres) / 100;
  double M4 = double.parse(tiempo);

  var resultadoTiempo;
  var tasaInteresNueva;

  var A; // Deposito anualidades

  showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          void calcularDepositoAnulidad() {
            resultadoTiempo = formulaTiempoAnualidad(M4, btnSelected2);

            if (btnSelected2 == "ANUAL") {
              tasaInteresNueva = tasaInteres2 / 1;
            }

            if (btnSelected2 == "MENSUAL") {
              tasaInteresNueva = tasaInteres2 / 12;
            }

            if (btnSelected2 == "SEMESTRAL") {
              tasaInteresNueva = tasaInteres2 / 2;
            }

            if (btnSelected2 == "TRIMESTRAL") {
              tasaInteresNueva = tasaInteres2 / 4;
            }

            if (btnSelected2 == "BIMESTRAL") {
              tasaInteresNueva = tasaInteres2 / 6;
            }

            A = valorFuturo2 *
                (tasaInteresNueva /
                    ((pow(1 + tasaInteresNueva, resultadoTiempo)) - 1));
          }

          calcularDepositoAnulidad();

          return AlertDialog(
            title: const Column(
              children: [Text("RESULTADO")],
            ),
            content: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                children: [
                  Text(btnSelected),
                  const SizedBox(
                    height: 20,
                  ),
                  Math.tex(
                      "A = ${valorFuturo2.toStringAsFixed(0)} [ \\frac{${tasaInteresNueva.toStringAsFixed(5)}}{(1 + ${tasaInteresNueva.toStringAsFixed(5)})^{-${resultadoTiempo.toStringAsFixed(0)}}- 1}]"),
                  const SizedBox(
                    height: 20,
                  ),

                  // Text("Resultado tiempo : $M4"),
                  // Text("Resultado tiempo : $resultadoTiempo"),
                  // Text("tasa interes : $tasaInteres2"),
                  // Text("Nueva t: $tasaInteresNueva"),
                  Text("Depositos: ${A.toStringAsFixed(2)}")
                ],
              ),
            ),
          );
        });
      });
}

void showDialogPressPagosVencidos(
    BuildContext context,
    String monto,
    String tasaInteres,
    String tiempo,
    String btnSelected,
    String btnSelected2) {
  double monto2 = double.parse(monto);
  // double pago2 = double.parse(pago);
  // double valorFuturo2 = double.parse(valorFuturo);
  // double monto2 = double.parse(monto);
  double tasaInteres2 = double.parse(tasaInteres) / 100;
  double M4 = double.parse(tiempo);

  var resultadoTiempo;
  var tasaInteresNueva;

  var A; //Pagos vencido anualidad;

  showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          void calcularPagosVencidos() {
            resultadoTiempo = formulaTiempoAnualidad(M4, btnSelected2);

            if (btnSelected2 == "ANUAL") {
              tasaInteresNueva = tasaInteres2 / 1;
            }

            if (btnSelected2 == "MENSUAL") {
              tasaInteresNueva = tasaInteres2 / 12;
            }

            if (btnSelected2 == "SEMESTRAL") {
              tasaInteresNueva = tasaInteres2 / 2;
            }

            if (btnSelected2 == "TRIMESTRAL") {
              tasaInteresNueva = tasaInteres2 / 4;
            }

            if (btnSelected2 == "BIMESTRAL") {
              tasaInteresNueva = tasaInteres2 / 6;
            }
            var resultadoTiempoNegativo = resultadoTiempo * -1;

            A = monto2 *
                (tasaInteresNueva /
                    (1 - pow(1 + tasaInteresNueva, resultadoTiempoNegativo)));
          }

          calcularPagosVencidos();

          return AlertDialog(
            title: const Column(
              children: [Text("RESULTADO")],
            ),
            content: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                children: [
                  Text(btnSelected),
                  const SizedBox(
                    height: 20,
                  ),
                  Math.tex(
                      "A = ${monto2.toStringAsFixed(0)} [ \\frac{${tasaInteresNueva.toStringAsFixed(5)}}{1 -(1 + ${tasaInteresNueva.toStringAsFixed(5)})^{-${resultadoTiempo.toStringAsFixed(0)}}}]"),
                  const SizedBox(
                    height: 20,
                  ),
                  // Text("Resultado tiempo : $M4"),
                  // Text("Resultado tiempo : $resultadoTiempo"),
                  // Text("tasa interes : $tasaInteres2"),
                  // Text("Nueva t: $tasaInteresNueva"),
                  Text("Pagos Vencidos: ${A.toStringAsFixed(2)}")
                ],
              ),
            ),
          );
        });
      });
}
