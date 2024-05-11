// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:interest_app/widgets/drawers/interes_simple_drawers/Tiempo/drawer_tiempo_interes_simple.dart';
import 'package:interest_app/widgets/dropdownbuttonwidget_periodicidad.dart';
import 'package:interest_app/widgets/interes_simple_widgets/Tiempo/showdialogwidget_tiempo_calculator2.dart';
import 'package:interest_app/widgets/textfromfield.dart';

class TiempoCalculator2 extends StatefulWidget {
  const TiempoCalculator2({super.key});

  @override
  State<TiempoCalculator2> createState() => _TiempoCalculator2State();
}

class _TiempoCalculator2State extends State<TiempoCalculator2> {
  final _formKey = GlobalKey<FormState>();
  var valorFinal;
  var capital;
  var tasaInteres;
  var _btnSelected;

  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CALCULAR TIEMPO 2"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      endDrawer: const Drawer(
        child: DrawerTiempoInteresSimple(),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Transform.translate(
                  offset: const Offset(0, 20),
                  child: Center(
                    child: Math.tex(
                      textStyle: const TextStyle(fontSize: 50),
                      r"t = \dfrac{\dfrac{VF}{C} - 1 }{i}",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                textFromFieldValorFinal(valorFinal, (value) {
                  valorFinal = value;
                }),
                const SizedBox(
                  height: 15,
                ),
                textFromFieldCapital(
                  capital,
                  (value) {
                    capital = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                textFromFieldTasaInteres(
                  tasaInteres,
                  (value) {
                    tasaInteres = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                StatefulBuilder(
                  builder: (BuildContext context, setState) {
                    return Container(
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: error == false ? Colors.red : Colors.green),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const Text("Selecciona la periodicidad"),
                          const Text("de la tasa de interes"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              DropDownButtonWidgetPeriodicidad(
                                value: _btnSelected,
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      _btnSelected = value;
                                      error = true;
                                    });
                                  }
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        if (error == true) {
                          showDialogPressTiempo2(context, valorFinal, capital,
                              tasaInteres, _btnSelected);
                        } else {
                          ElegantNotification.error(
                                  title: const Text("Error"),
                                  description: const Text(
                                      "Elige la periodicidad de la tasa de interes"))
                              .show(context);
                        }
                      }
                    },
                    child: const Text("Siguiente"))
              ],
            )),
      ),
    );
  }
}
