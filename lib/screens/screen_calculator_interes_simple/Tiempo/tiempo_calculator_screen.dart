// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interest_app/widgets/Navegacion/bottomnavigation.dart';
import 'package:interest_app/widgets/drawers/interes_simple_drawers/Tiempo/drawer_tiempo_interes_simple.dart';
import 'package:interest_app/widgets/interes_simple_widgets/Tiempo/showdialogwidget_tiempo_calculator.dart';
import 'package:interest_app/widgets/dropdownbuttonwidget_periodicidad.dart';
import 'package:interest_app/widgets/textfromfield.dart';

class TiempoCalculator extends StatefulWidget {
  const TiempoCalculator({super.key});

  @override
  State<TiempoCalculator> createState() => _TiempoCalculatorState();
}

class _TiempoCalculatorState extends State<TiempoCalculator> {
  final _formKey = GlobalKey<FormState>();
  var interes;
  var capital;
  var tasaInteres;
  var _btnSelected;

  final _selectedIndex = 2;
  List<String> routes = [
    "/calcularInteres",
    "/calcularCapital",
    "/calcularTiempo",
    "/calcularValorFinal",
    "/calcularTasaInteres"
  ];

  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CALCULAR TIEMPO"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/interesSimple");
            },
            icon: const Icon(FontAwesomeIcons.house)),
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
                      r"t = \dfrac{I}{C*i}",
                      textStyle: const TextStyle(fontSize: 50),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                textFromFieldInteres(
                  interes,
                  (value) {
                    interes = value;
                  },
                ),
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
                          showDialogPressTiempo(context, interes, capital,
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
      bottomNavigationBar:
          Navegacion(selectedIndex: _selectedIndex, routes: routes),
    );
  }
}
