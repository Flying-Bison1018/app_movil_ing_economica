// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:math';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:interest_app/widgets/amortizacion/calculo.dart';
import 'package:interest_app/widgets/amortizacion/dropdownbuttonwidget_metodo.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:interest_app/widgets/textfromfield.dart';

class CalculoMetodos extends StatefulWidget {
  const CalculoMetodos({super.key});

  @override
  State<CalculoMetodos> createState() => _CalculoMetodosState();
}

class _CalculoMetodosState extends State<CalculoMetodos> {
  var valorTotalPrestado;
  var tasaInteres;
  var frecuencia;
  var numeroPeriodo;
  var cuota;
  var formatoResultado;
  var _btnSelectedMetodo;
  final _formKey = GlobalKey<FormState>();

  int valorTotalPrestado2 = 0;
  double tasaInteres2 = 0;
  int frecuencia2 = 0;
  int numeroPeriodo2 = 0;

  bool mostarTabla = false;
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AMORTIZACION"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "METODO",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  DropDownButtonWidgetMetodo(
                    value: _btnSelectedMetodo,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _btnSelectedMetodo = value;
                          error = true;
                        });
                      }
                    },
                  ),
                ],
              ),
              textValorTotalPrestamo(textValorTotalPrestamo, (value) {
                valorTotalPrestado = value;
              }),
              textFromFieldTasaInteres(tasaInteres, (value) {
                tasaInteres = value;
              }),
              textFrecuencia(frecuencia, (value) {
                frecuencia = value;
              }),
              textNumeroPeriodo(numeroPeriodo, (value) {
                numeroPeriodo = value;
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "CN: ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    cuota == null ? "0" : formatoResultado,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          if (error == false) {
                            ElegantNotification.error(
                                    title: const Text("ERROR"),
                                    description: const Text("Elegir un metodo"))
                                .show(context);
                          } else {
                            setState(() {
                              valorTotalPrestado2 =
                                  int.parse(valorTotalPrestado);

                              numeroPeriodo2 = int.parse(numeroPeriodo);

                              frecuencia2 = int.parse(frecuencia);

                              tasaInteres2 =
                                  (double.parse(tasaInteres) / frecuencia2) /
                                      100;

                              double tasaInteres3 =
                                  (double.parse(tasaInteres) / 100);

                              if (_btnSelectedMetodo == "FRANCES") {
                                cuota = (valorTotalPrestado2 * tasaInteres2) /
                                    (1 -
                                        (pow(1 + tasaInteres2,
                                            -numeroPeriodo2)));
                              }

                              if (_btnSelectedMetodo == "ALEMAN") {
                                cuota = valorTotalPrestado2 / numeroPeriodo2;
                              }

                              if (_btnSelectedMetodo == "USA") {
                                cuota = (valorTotalPrestado2 * tasaInteres3) /
                                    frecuencia2;
                              }

                              formatoResultado = NumberFormat.currency(
                                locale: "es",
                                symbol: r"$",
                              ).format(cuota);

                              mostarTabla = true;
                            });
                          }
                        }
                      },
                      child: const Text("Continuar")),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              mostarTabla == true && _btnSelectedMetodo == "FRANCES"
                  ? tablaFrances(context, valorTotalPrestado2, tasaInteres2,
                      frecuencia2, numeroPeriodo2, cuota)
                  : mostarTabla == true && _btnSelectedMetodo == "ALEMAN"
                      ? tablaAleman(context, valorTotalPrestado2, tasaInteres2,
                          frecuencia2, numeroPeriodo2, cuota)
                      : mostarTabla == true && _btnSelectedMetodo == "USA"
                          ? tablaUSA(context, valorTotalPrestado2, tasaInteres2,
                              frecuencia2, numeroPeriodo2, cuota)
                          : Container()
            ],
          ),
        ),
      ),
    );
  }
}
