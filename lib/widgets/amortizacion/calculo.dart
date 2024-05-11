import 'package:flutter/material.dart';

Widget tablaFrances(BuildContext context, int prestamo, double tasaInteres,
    int frecuencia, int numeroPeriodo, double cuota) {
  List<Map<String, dynamic>> tablaAmortizacion = [];
  var suma = 0.0;
  var saldoInicial = prestamo.toDouble();

  var cuotaActual = cuota.toDouble();

  for (var i = 0; i < numeroPeriodo; i++) {
    var intereses = (saldoInicial * (tasaInteres * frecuencia)) / frecuencia;

    var capital = cuotaActual - intereses;

    var saldoFinal = saldoInicial - capital;

    suma += intereses;

    tablaAmortizacion.add({
      "Cuota": cuotaActual.toStringAsFixed(2),
      "Interes": intereses.toStringAsFixed(2),
      "Capital": capital.toStringAsFixed(2),
      "Saldo": saldoFinal.toStringAsFixed(2)
    });

    // Actualizamos el saldo inicial para el próximo período
    saldoInicial = saldoFinal;
  }

  return SafeArea(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Suma Interes: ${suma.toStringAsFixed(2)}"),
              const SizedBox(
                width: 30,
              ),
              Text("Total: ${(suma + prestamo).toStringAsFixed(2)}")
            ],
          ),
          Table(
            border: TableBorder.all(),
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(1),
            },
            children: [
              const TableRow(
                children: [
                  TableCell(child: Center(child: Text('Periodo'))),
                  TableCell(child: Center(child: Text('Cuota'))),
                  TableCell(child: Center(child: Text('Intereses'))),
                  TableCell(child: Center(child: Text('Capital'))),
                  TableCell(child: Center(child: Text('Saldo'))),
                ],
              ),
              for (var i = 0; i < tablaAmortizacion.length; i++)
                TableRow(
                  children: [
                    TableCell(child: Center(child: Text("${i + 1}"))),
                    TableCell(
                        child: Center(
                      child: Text("${tablaAmortizacion[i]["Cuota"]}"),
                    )),
                    TableCell(
                        child: Center(
                      child: Text("${tablaAmortizacion[i]["Interes"]}"),
                    )),
                    TableCell(
                        child: Center(
                      child: Text("${tablaAmortizacion[i]["Capital"]}"),
                    )),
                    TableCell(
                        child: Center(
                      child: Text("${tablaAmortizacion[i]["Saldo"]}"),
                    ))
                  ],
                ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget tablaAleman(BuildContext context, int prestamo, double tasaInteres,
    int frecuencia, int numeroPeriodo, double cuota) {
  List<Map<String, dynamic>> tablaAmortizacion = [];
  var suma = 0.0;
  var saldoInicial = prestamo.toDouble();

  var capitalActual = cuota.toDouble();

  for (var i = 0; i < numeroPeriodo; i++) {
    var intereses = (saldoInicial * (tasaInteres * frecuencia)) / frecuencia;

    var cuota = capitalActual + intereses;

    var saldoFinal = saldoInicial - capitalActual;

    suma += intereses;

    tablaAmortizacion.add({
      "Cuota": cuota.toStringAsFixed(2),
      "Interes": intereses.toStringAsFixed(2),
      "Capital": capitalActual.toStringAsFixed(2),
      "Saldo": saldoFinal.toStringAsFixed(2)
    });

    saldoInicial = saldoFinal;
  }
  return SafeArea(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Suma Interes: ${suma.toStringAsFixed(2)}"),
              const SizedBox(
                width: 30,
              ),
              Text("Total: ${(suma + prestamo).toStringAsFixed(2)}")
            ],
          ),
          Table(
            border: TableBorder.all(),
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(1),
            },
            children: [
              const TableRow(
                children: [
                  TableCell(child: Center(child: Text('Periodo'))),
                  TableCell(child: Center(child: Text('Cuota'))),
                  TableCell(child: Center(child: Text('Intereses'))),
                  TableCell(child: Center(child: Text('Capital'))),
                  TableCell(child: Center(child: Text('Saldo'))),
                ],
              ),
              for (var i = 0; i < tablaAmortizacion.length; i++)
                TableRow(
                  children: [
                    TableCell(child: Center(child: Text("${i + 1}"))),
                    TableCell(
                        child: Center(
                      child: Text("${tablaAmortizacion[i]["Cuota"]}"),
                    )),
                    TableCell(
                        child: Center(
                      child: Text("${tablaAmortizacion[i]["Interes"]}"),
                    )),
                    TableCell(
                        child: Center(
                      child: Text("${tablaAmortizacion[i]["Capital"]}"),
                    )),
                    TableCell(
                        child: Center(
                      child: Text("${tablaAmortizacion[i]["Saldo"]}"),
                    ))
                  ],
                ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget tablaUSA(BuildContext context, int prestamo, double tasaInteres,
    int frecuencia, int numeroPeriodo, double cuota) {
  List<Map<String, dynamic>> tablaAmortizacion = [];
  var sumaInteres = 0.0;
  var prestamo2 = prestamo;

  for (var i = 0; i < numeroPeriodo; i++) {
    var interes = prestamo * tasaInteres;
    sumaInteres += interes;
    var capital = cuota - interes;
    if (i == numeroPeriodo - 1) {
      // Para el último período, ajusta la cuota para incluir el saldo restante
      cuota = prestamo + interes;
      capital = prestamo.toDouble();
    }
    prestamo -= capital.toInt();
    tablaAmortizacion.add({
      "Periodo": i + 1,
      "Cuota": cuota.toStringAsFixed(2),
      "Interes": interes.toStringAsFixed(2),
      "Capital": capital.toStringAsFixed(2),
      "Saldo": prestamo.toStringAsFixed(2)
    });
  }

  return SafeArea(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Suma Interes: ${sumaInteres.toStringAsFixed(2)}"),
              const SizedBox(
                width: 30,
              ),
              Text("Total: ${(sumaInteres + prestamo2).toStringAsFixed(2)}")
            ],
          ),
          Table(
            border: TableBorder.all(),
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(1),
            },
            children: [
              const TableRow(
                children: [
                  TableCell(child: Center(child: Text('Periodo'))),
                  TableCell(child: Center(child: Text('Cuota'))),
                  TableCell(child: Center(child: Text('Intereses'))),
                  TableCell(child: Center(child: Text('Capital'))),
                  TableCell(child: Center(child: Text('Saldo'))),
                ],
              ),
              for (var i = 0; i < tablaAmortizacion.length; i++)
                TableRow(
                  children: [
                    TableCell(child: Center(child: Text("${i + 1}"))),
                    TableCell(
                        child: Center(
                      child: Text("${tablaAmortizacion[i]["Cuota"]}"),
                    )),
                    TableCell(
                        child: Center(
                      child: Text("${tablaAmortizacion[i]["Interes"]}"),
                    )),
                    TableCell(
                        child: Center(
                      child: Text("${tablaAmortizacion[i]["Capital"]}"),
                    )),
                    TableCell(
                        child: Center(
                      child: Text("${tablaAmortizacion[i]["Saldo"]}"),
                    ))
                  ],
                ),
            ],
          ),
        ],
      ),
    ),
  );
}
