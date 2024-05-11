// ignore_for_file: prefer_typing_uninitialized_variables


import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interest_app/widgets/Navegacion/bottomnavigation2.dart';
import 'package:interest_app/widgets/interes_compuesto_widgets/tasa_interes/showdialogwidget_tasa_interes2_compuesto.dart';
import 'package:interest_app/widgets/dropdownbuttonwidget_periodicidad.dart';
import 'package:interest_app/widgets/textfromfield.dart';

class TasaInteresScreen2 extends StatefulWidget {
  const TasaInteresScreen2({super.key});

  @override
  State<TasaInteresScreen2> createState() => _TasaInteresScreen2State();
}

class _TasaInteresScreen2State extends State<TasaInteresScreen2> {
  final _formKey = GlobalKey<FormState>();
  var _btnSelected;
  var meses; //MESES
  var ano;
  var bimestre;
  var dias;
  var trimestre;
  var semestre;

  var monto;

  var capital;
  final _selectedIndex = 2;
  List<String> routes = [
    "/calcularMontoCompuesto",
    "/calcularTasaInteresCompuesto",
    "/calcularTasaInteres2Compuesto",
    "/calcularCapitalCompuesto",
  ];

  bool error = false;
  
  bool error2 = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TASA INTERES"),
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
                            "i = (MC / C)^{1/n} - 1",
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
                      textFromFieldCapital(capital, (value) {
                        capital = value;
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
                                  color: error == false
                                      ? Colors.red
                                      : Colors.green),
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
                      Transform.translate(
                          offset: const Offset(0, 13),
                          child: const Text(
                            "TIEMPO",
                            style: TextStyle(fontSize: 20),
                          )),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Transform.translate(
                            offset: const Offset(-50, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                textFromFieldAno(ano, (value) {
                                  ano = value;
                                }),
                                const SizedBox(height: 20),
                                textFromFieldMeses(meses, (value) {
                                  meses = value;
                                }),
                                const SizedBox(height: 20),
                                textFromFieldDias(dias, (value) {
                                  dias = value;
                                }),
                                Transform.translate(
                                  offset: const Offset(140, -232),
                                  child: Column(
                                    children: [
                                      textFromFieldSemestre(semestre, (value) {
                                        semestre = value;
                                      }),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      textFromFieldTrimestres(trimestre,
                                          (value) {
                                        trimestre = value;
                                      }),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      textFromFieldBimestre(bimestre, (value) {
                                        bimestre = value;
                                      }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -200),
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                if (error == true) {
                                 var capitalSinComaNiPunto = capital
                                      .replaceAll(".0", "")
                                      .replaceAll(",", "");
                                  capital = capitalSinComaNiPunto;

                                  var montoCompuestoSinComaNiPunto = monto
                                      .replaceAll(".0", "")
                                      .replaceAll(",", "");
                                  monto = montoCompuestoSinComaNiPunto;

                                  showDialogPressTasaInteres2Compuesto(
                                      context,
                                      capital,
                                      monto,
                                      _btnSelected,
                                      ano,
                                      meses,
                                      dias,
                                      semestre,
                                      trimestre,
                                      bimestre);
                                } else {
                                  ElegantNotification.error(
                                          title: const Text("Error"),
                                          description: const Text(
                                              "Elige la periodicidad de la tasa de interes"))
                                      .show(context);
                                }
                              }
                            },
                            child: const Text("Siguiente")),
                      )
                    ],
                  ))),
        ),
        bottomNavigationBar: Navegacion2Compuesto(
            selectedIndex: _selectedIndex, routes: routes));
  }
}
