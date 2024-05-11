// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:interest_app/widgets/anualidades/dropdownbuttonwidget_tipo_anualidad.dart';
import 'package:interest_app/widgets/anualidades/showdialoganualidades.dart';
import 'package:interest_app/widgets/dropdownbuttonwidget_periodicidad.dart';
import 'package:interest_app/widgets/textfromfield.dart';

class AnualidadesCalculator extends StatefulWidget {
  const AnualidadesCalculator({super.key});

  @override
  State<AnualidadesCalculator> createState() => _AnualidadesCalculatorState();
}

class _AnualidadesCalculatorState extends State<AnualidadesCalculator> {
  var _btnSelected;
  var _btnSelected2;
  var deposito;
  var pago;
  var valorFuturo;
  var monto;
  var tasaInteres;
  var tiempo;

  final _formKey = GlobalKey<FormState>();

  bool opcion = false;
  bool capitalizacion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ANUALIDADES"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("OPCION"),
                    const SizedBox(
                      width: 20,
                    ),
                    DropDownButtonWidgetAnualidad(
                      value: _btnSelected,
                      onChanged: (value) {
                        setState(() {
                          _btnSelected = value;
                          opcion = true;
                        });
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                _btnSelected == "VALOR FUTURO"
                    ? Math.tex(
                        "VF = A [ \\frac{(1 + i)^{n} - 1}{i}]",
                        textStyle: const TextStyle(fontSize: 30),
                      )
                    : _btnSelected == "VALOR ACTUAL"
                        ? Math.tex(
                            "VA = A [ \\frac{ 1 - (1 + i)^{-n}}{i}]",
                            textStyle: const TextStyle(fontSize: 30),
                          )
                        : _btnSelected == "DEPOSITO"
                            ? Math.tex(
                                "A = VF [ \\frac{i}{(1 + i)^{n} - 1}]",
                                textStyle: const TextStyle(fontSize: 30),
                              )
                            : _btnSelected == "PAGOS VENCIDO"
                                ? Math.tex(
                                    "A = VP [ \\frac{i}{1 - (1 + i)^{-n}}]",
                                    textStyle: const TextStyle(fontSize: 30),
                                  )
                                : Container(),
                const SizedBox(
                  height: 20,
                ),
                _btnSelected == "VALOR FUTURO"
                    ? textDeposito(deposito, (value) {
                        deposito = value;
                      })
                    : _btnSelected == "VALOR ACTUAL"
                        ? textPago(pago, (value) {
                            pago = value;
                          })
                        : _btnSelected == "DEPOSITO"
                            ? textValorFuturo(valorFuturo, (value) {
                                valorFuturo = value;
                              })
                            : _btnSelected == "PAGOS VENCIDO"
                                ? textMonto(monto, (value) {
                                    monto = value;
                                  })
                                : Container(),
                textTasaInteresAnualidad(tasaInteres, (value) {
                  tasaInteres = value;
                }),
                const SizedBox(
                  height: 10,
                ),
                const Text("CAPITALIZACION"),
                DropDownButtonWidgetPeriodicidad(
                  value: _btnSelected2,
                  onChanged: (value) {
                    setState(() {
                      _btnSelected2 = value;
                      capitalizacion = true;
                    });
                  },
                ),
                textTiempoAnualidad(tiempo, (value) {
                  tiempo = value;
                }),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        if (opcion == true) {
                          if (capitalizacion == true) {
                            if (_btnSelected == "VALOR FUTURO") {
                              showDialogPressValorFuturo(
                                  context,
                                  deposito,
                                  tasaInteres,
                                  tiempo,
                                  _btnSelected,
                                  _btnSelected2);
                            }

                            if (_btnSelected == "VALOR ACTUAL") {
                              showDialogPressValorActual(
                                  context,
                                  pago,
                                  tasaInteres,
                                  tiempo,
                                  _btnSelected,
                                  _btnSelected2);
                            }

                            if (_btnSelected == "DEPOSITO") {
                              showDialogPressDepositos(
                                  context,
                                  valorFuturo,
                                  tasaInteres,
                                  tiempo,
                                  _btnSelected,
                                  _btnSelected2);
                            }

                            if (_btnSelected == "PAGOS VENCIDO") {
                              showDialogPressPagosVencidos(
                                  context,
                                  monto,
                                  tasaInteres,
                                  tiempo,
                                  _btnSelected,
                                  _btnSelected2);
                            }
                          } else {
                            ElegantNotification.error(
                                    title: const Text("ERROR"),
                                    description:
                                        const Text("Elige una capitalizacion"))
                                .show(context);
                          }
                        } else {
                          ElegantNotification.error(
                                  title: const Text("ERROR"),
                                  description: const Text(
                                      "Elige una opcion de la anualidad"))
                              .show(context);
                        }
                      }
                    },
                    child: const Text("CONTINUAR"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
