// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:interest_app/widgets/tir/formula.dart';

void dialogfullScreen(BuildContext context, String inversion, String interes,
    List<String?> anos) {
  int inversion2 = int.parse(inversion);
  double interes2 = 0;
  List<int> anos2 = anos.map((String? value) => int.parse(value!)).toList();
  List<double> anos3 = [];
  List<double> resultados4 = [];
  var operacion;

  if (interes.isEmpty) {
    int suma = anos2
        .reduce((valorAnterior, valorActual) => valorAnterior + valorActual);
    int n = anos2.length;

    operacion = (suma / inversion2 - 1) / n;
  } else {
    interes2 = double.parse(interes) / 100;
  }

  var resultado;
  var resultado2;
  var resultadodenomidor;
  var valorPresente;
  var vancambio;

  var resultadoNegativo;
  var resultadoPositivo;
  var tir;
  var indice;
  var indice2;

  var resta;

  showDialog(
      context: context,
      builder: (builder) => StatefulBuilder(
            builder: (BuildContext context, setState) {
              void resultadoVan() {
                resultado = 0;
                resultado2 = 0;
                for (int i = 0; i < anos2.length; i++) {
                  valorPresente = anos2[i] / pow(1 + interes2, i + 1);

                  // No es necesario poner, es uso personal
                  resultadodenomidor = pow(1 + interes2, i + 1);
                  // No es necesario poner, es uso personal
                  anos3.add(resultadodenomidor);
                  // No es necesario poner, es uso personal
                  resultados4.add(valorPresente);

                  resultado += valorPresente;
                  resultado2 += valorPresente;

                  //print(resultado);
                }

                resultado -= inversion2;
              }

              double calcularVAN(double interesc) {
                double van = 0;
                for (int i = 0; i < anos2.length; i++) {
                  double valorPresente = anos2[i] / pow(1 + interesc, i + 1);
                  van += valorPresente;
                }
                van -= inversion2;

                vancambio = van;
                return van;
              }

              void encontrarVanPositivoNegativo() {
                double interesInicial = interes.isEmpty ? operacion : interes2;

                double interesFinal = 100.0;

                double paso = 0.0001;

                for (double interes = interesInicial;
                    interes <= interesFinal;
                    interes -= paso) {
                  double van = calcularVAN(interes);
                  if (vancambio > 0) {
                    indice2 = interes;
                    resultadoPositivo = van;
                    break;
                  }
                }

                for (double interes = interesInicial;
                    interes <= interesFinal;
                    interes += paso) {
                  double van = calcularVAN(interes);
                  if (vancambio < 0) {
                    indice = interes;
                    resultadoNegativo = van;
                    break;
                  }
                }
              }

              void encontrarTir() {
                resta = indice2 - indice;

                double ecuacion = (resultadoPositivo - 0) /
                    (resultadoPositivo - resultadoNegativo);

                double ecuacion2 = ecuacion * (resta);

                if (ecuacion2 < 0) {
                  ecuacion2 *= -1;

                  tir = (indice2 + ecuacion2) * 100;
                } else {
                  ecuacion2 *= -1;

                  tir = (indice2 - ecuacion2) * 100;
                }
              }

              resultadoVan();

              encontrarVanPositivoNegativo();

              encontrarTir();

              return Dialog.fullscreen(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    //! VAN FORMULA
                    Math.tex(
                        textStyle: const TextStyle(fontSize: 20),
                        "VAN = - $inversion  + "),
                    const SizedBox(
                      height: 30,
                    ),
                    formulaVista1(anos2, interes2),

                    formulaVista2(anos3, anos2),

                    formulaVista3(anos2, resultados4),

                    //! FIN FORMULAS

                    //! RESULTADOS

                    Transform.translate(
                      offset: const Offset(0, -370),
                      child: Math.tex(
                        "VAN: $inversion2 - ${resultado2.toStringAsFixed(2)}",
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Transform.translate(
                        offset: const Offset(0, -340),
                        child: Row(
                          children: [
                            Math.tex(
                              "Resultado: ${resultado.toStringAsFixed(2)}",
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            resultado > 0
                                ? const Text(
                                    "Es Rentable",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.green),
                                  )
                                : const Text(
                                    "No es rentable",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.red),
                                  )
                          ],
                        )),

                    //! FIN RESULTADOS

                    //! CUADRO DEL RESULTADO

                    //! DIVIDER

                    Transform.translate(
                        offset: const Offset(0, -350),
                        child: const Divider(
                          color: Colors.black,
                        )),

                    resultado > 0
                        ? Transform.translate(
                            offset: const Offset(0, -340),
                            child: vanRentable(resultado, interes2, tir, indice,
                                resultadoNegativo),
                          )
                        : Transform.translate(
                            offset: const Offset(0, -340),
                            child: vanNoRentable(indice2, resultadoPositivo,
                                tir, interes2, resultado),
                          )
                  ],
                ),
              );
            },
          ));
}
