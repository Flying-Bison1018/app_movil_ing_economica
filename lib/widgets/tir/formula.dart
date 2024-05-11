import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

Widget formulaVista1(List<int> anos, double interes2) {
  return Expanded(
    flex: 10,
    child: Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(anos.length, (index) {
              if (index == anos.length - 1) {
                return Math.tex(
                  textStyle: const TextStyle(fontSize: 20),
                  "\\frac{${anos[index]}}{(1 + $interes2)^{${index + 1}}}",
                );
              } else {
                return Row(
                  children: [
                    Math.tex(
                      textStyle: const TextStyle(fontSize: 20),
                      "\\frac{${anos[index]}}{(1 + $interes2)^{${index + 1}}}",
                    ),
                    const Text(" + "),
                  ],
                );
              }
            }),
          ),
        ),
      ],
    ),
  );
}

Widget formulaVista2(List<double> anos3, List<int> anos) {
  return Expanded(
    flex: 10,
    child: Transform.translate(
      offset: const Offset(0, -110),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(anos.length, (index) {
                if (index == anos.length - 1) {
                  return Math.tex(
                    textStyle: const TextStyle(fontSize: 20),
                    "\\frac{${anos[index]}}{${anos3[index].toStringAsFixed(2)}}",
                  );
                } else {
                  return Row(
                    children: [
                      Math.tex(
                        textStyle: const TextStyle(fontSize: 20),
                        "\\frac{${anos[index]}}{${anos3[index].toStringAsFixed(2)}}",
                      ),
                      const Text(" + "),
                    ],
                  );
                }
              }),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget formulaVista3(List<int> anos, List<double> resultados4) {
  return Expanded(
    flex: 10,
    child: Transform.translate(
      offset: const Offset(0, -230),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(anos.length, (index) {
                if (index == anos.length - 1) {
                  return Math.tex(
                    textStyle: const TextStyle(fontSize: 20),
                    "{${resultados4[index].toStringAsFixed(2)}}",
                  );
                } else {
                  return Row(
                    children: [
                      Math.tex(
                        textStyle: const TextStyle(fontSize: 20),
                        "{${resultados4[index].toStringAsFixed(2)}}",
                      ),
                      const Text(" + "),
                    ],
                  );
                }
              }),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget vanRentable(
    var resultado, var interes, var tir, var indice, var resultadoNegativo) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Cuando i = ${(interes * 100)} %"),
          const SizedBox(width: 10),
          const Text(","),
          const SizedBox(width: 10),
          Text("VAN = ${resultado.toStringAsFixed(2)}"),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Cuando TIR = ${(tir ?? "?").toStringAsFixed(3)} %"),
          const SizedBox(width: 10),
          const Text(","),
          const SizedBox(width: 10),
          const Text("VAN = 0"),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Cuando i = ${(indice * 100 ?? "?").toStringAsFixed(0)} % "),
          const SizedBox(width: 10),
          const Text(","),
          const SizedBox(width: 10),
          Text("VAN = ${(resultadoNegativo ?? "- ?").toStringAsFixed(2)}"),
        ],
      ),
    ],
  );
}

Widget vanNoRentable(
    var indice, var resultadoPositivo, var tir, var interes, var resultado) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Cuando i = ${(indice * 100 ?? "?")} % "),
          const SizedBox(width: 10),
          const Text(","),
          const SizedBox(width: 10),
          Text("VAN = ${(resultadoPositivo ?? " ?").toStringAsFixed(2)}"),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Cuando TIR = ${(tir ?? "?").toStringAsFixed(3)} %"),
          const SizedBox(width: 10),
          const Text(","),
          const SizedBox(width: 10),
          const Text("VAN = 0"),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Cuando i = ${(interes * 100)} %"),
          const SizedBox(width: 10),
          const Text(","),
          const SizedBox(width: 10),
          Text("VAN = ${resultado.toStringAsFixed(2)}"),
        ],
      ),
    ],
  );
}
