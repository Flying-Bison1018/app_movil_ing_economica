// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interest_app/widgets/Navegacion/bottomnavigation2.dart';
import 'package:interest_app/widgets/interes_compuesto_widgets/tasa_interes_compuesto/showdialogwidget_tasa_interes_compuesto.dart';
import 'package:interest_app/widgets/dropdownbuttonwidget_periodicidad.dart';
import 'package:interest_app/widgets/textfromfield.dart';

class TasaInteresCompuesto extends StatefulWidget {
  const TasaInteresCompuesto({super.key});

  @override
  State<TasaInteresCompuesto> createState() => _TasaInteresCompuestoState();
}

class _TasaInteresCompuestoState extends State<TasaInteresCompuesto> {
  final _formKey = GlobalKey<FormState>();
  var capital;
  var tasaInteres;
  var _btnSelected;
  var meses; //MESES
  var ano;
  var bimestre;
  var dias;
  var trimestre;
  var semestre;

  var monto;
  //int tasaInteres = 0;
  final _selectedIndex = 1;
  List<String> routes = [
    "/calcularMontoCompuesto",
    "/calcularTasaInteresCompuesto",
    "/calcularTasaInteres2Compuesto",
    "/calcularCapitalCompuesto",
  ];

  bool error = false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TIEMPO"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/interesCompuesto");
            },
            icon: const Icon(FontAwesomeIcons.house)),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Transform.translate(
                  offset: const Offset(0, 20),
                  child: Center(
                    child: Math.tex(
                      "N = \\frac{Log_{MC} - Log_{C}}{Log_{1 + i}}",
                      textStyle: const TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                textFromFieldMontoCompuesto(monto, (value) {
                  monto = value;
                }),
                const SizedBox(
                  height: 15,
                ),
                textFromFieldCapital(capital, (value) {
                  capital = value;
                }),
                const SizedBox(
                  height: 15,
                ),
                textFromFieldTasaInteres(tasaInteres, (value) {
                  tasaInteres = value;
                }),
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
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        if (error == true) {
                          var capitalSinComaNiPunto =
                              capital.replaceAll(".0", "").replaceAll(",", "");
                          capital = capitalSinComaNiPunto;

                          var montoSinComaNiPunto =
                              monto.replaceAll(".0", "").replaceAll(",", "");
                          monto = montoSinComaNiPunto;

                          showDialogPressTasaInteresCompuesto(
                            context,
                            capital,
                            monto,
                            tasaInteres,
                          );
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
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          Navegacion2Compuesto(selectedIndex: _selectedIndex, routes: routes),
    );
  }
}
