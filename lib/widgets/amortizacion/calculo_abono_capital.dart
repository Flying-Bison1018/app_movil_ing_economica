import 'package:flutter/material.dart';

class AmortizacionTabla extends StatefulWidget {
  const AmortizacionTabla({Key? key}) : super(key: key);

  @override
  State<AmortizacionTabla> createState() => _AmortizacionTablaState();
}

class _AmortizacionTablaState extends State<AmortizacionTabla> {
  var valorTotalPrestado;
  var tasaInteres;
  var frecuencia;
  var numeroPeriodo;
  var cuota;
  late List<Map<String, dynamic>> tablaAmortizacion;

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context)!.settings.arguments as Map;
    valorTotalPrestado = args["Prestamo"];
    tasaInteres = args["TasaInteres"];
    frecuencia = args["Frecuencia"];
    numeroPeriodo = args["NumeroPeriodo"];
    cuota = args["Cuota"];

    tablaAmortizacion = [];

    var saldoInicial = valorTotalPrestado;
    var cuotaActual = cuota;

    var abono = 0;

    for (var i = 0; i < numeroPeriodo; i++) {
      var intereses = saldoInicial * tasaInteres;
      var amortizacion = cuotaActual + abono - intereses;
      var saldoFinal = saldoInicial - amortizacion;

      tablaAmortizacion.add({
        "Cuota": cuota.toStringAsFixed(2),
        "Interes": intereses.toStringAsFixed(2),
        "Amortizacion": amortizacion.toStringAsFixed(2),
        "Saldo": saldoFinal.toStringAsFixed(2)
      });
      saldoInicial = saldoFinal;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("ABONO CAPITAL"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1),
                      3: FlexColumnWidth(1),
                      4: FlexColumnWidth(1),
                    },
                    children: [
                      const TableRow(
                        children: [
                          TableCell(child: Center(child: Text('Periodo'))),
                          TableCell(child: Center(child: Text('Cuota'))),
                          TableCell(child: Center(child: Text('Abono'))),
                          TableCell(child: Center(child: Text('Intereses'))),
                          TableCell(child: Center(child: Text('Amortizacion'))),
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
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      var abono = double.tryParse(value) ??
                                          0; // Usar double para permitir decimales
                                      tablaAmortizacion[i]["Abono"] = abono;

                                      realizarAbono(i, abono);
                                    });
                                  },
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child:
                                    Text("${tablaAmortizacion[i]["Interes"]}"),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Text(
                                    "${tablaAmortizacion[i]["Amortizacion"]}"),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Text("${tablaAmortizacion[i]["Saldo"]}"),
                              ),
                            )
                          ],
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void realizarAbono(int periodo, double abono) {
    // Calcular los intereses en base al saldo del periodo anterior al periodo del abono
    var saldoAnterior = periodo > 0
        ? double.parse(tablaAmortizacion[periodo - 1]["Saldo"])
        : valorTotalPrestado;
    var intereses = saldoAnterior * (tasaInteres / frecuencia);

    // Calcular la cuota actual teniendo en cuenta el abono
    var cuotaActual = cuota - abono;

    // La amortización es la diferencia entre la cuota y los intereses
    var amortizacion = cuotaActual - intereses;

    // Aplicar el abono al saldo restante en el periodo del abono
    var saldoFinal = saldoAnterior - abono;

    // Actualizar los valores en la tabla de amortización para el periodo del abono
    tablaAmortizacion[periodo]["Abono"] = abono;
    tablaAmortizacion[periodo]["Interes"] =
        intereses < 0 ? "0.00" : intereses.toStringAsFixed(2);
    tablaAmortizacion[periodo]["Amortizacion"] =
        amortizacion < 0 ? "0.00" : amortizacion.toStringAsFixed(2);
    tablaAmortizacion[periodo]["Saldo"] =
        saldoFinal < 0 ? "0.00" : saldoFinal.toStringAsFixed(2);

    // Actualizar el saldo anterior para los próximos periodos
    saldoAnterior = saldoFinal;
    intereses = saldoAnterior * (tasaInteres / frecuencia);

    // Recalcular los valores para los siguientes periodos
    for (var i = periodo + 1; i < tablaAmortizacion.length; i++) {
      // La cuota no cambia después del periodo del abono
      cuotaActual = cuota;

      // La amortización es la diferencia entre la cuota y los intereses
      amortizacion = cuotaActual - intereses;

      // Aplicar la amortización al saldo restante en el periodo actual
      saldoFinal = saldoAnterior - amortizacion;

      // Actualizar los valores en la tabla de amortización para el periodo actual
      tablaAmortizacion[i]["Interes"] =
          intereses < 0 ? "0.00" : intereses.toStringAsFixed(2);
      tablaAmortizacion[i]["Amortizacion"] =
          amortizacion < 0 ? "0.00" : amortizacion.toStringAsFixed(2);
      tablaAmortizacion[i]["Saldo"] =
          saldoFinal < 0 ? "0.00" : saldoFinal.toStringAsFixed(2);

      // Actualizar el saldo anterior para el próximo periodo
      saldoAnterior = saldoFinal;
      intereses = saldoAnterior * (tasaInteres / frecuencia);
    }
  }
}
