// ignore_for_file: unnecessary_string_escapes, prefer_typing_uninitialized_variables

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interest_app/widgets/Navegacion/bottomnavigation.dart';
import 'package:interest_app/widgets/drawers/interes_simple_drawers/Capital/drawer_capital_interes_simple.dart';
import 'package:interest_app/widgets/interes_simple_widgets/Capital/showdialogwidget_capital_calculator.dart';
import 'package:interest_app/widgets/dropdownbuttonwidget_periodicidad.dart';
import 'package:interest_app/widgets/textfromfield.dart';

class CapitalCalculator extends StatefulWidget {
  const CapitalCalculator({super.key});

  @override
  State<CapitalCalculator> createState() => _CapitalCalculatorState();
}

class _CapitalCalculatorState extends State<CapitalCalculator> {
  final _formKey = GlobalKey<FormState>();

  var interes;
  var _btnSelected;
  var tasaInteres;
  var meses; //MESES
  var ano;
  var bimestre;
  var dias;
  var trimestre;
  var semestre;

  final _selectedIndex = 1;
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
        title: const Text("CALCULAR CAPITAL"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/interesSimple");
            },
            icon: const Icon(FontAwesomeIcons.house)),
      ),
      endDrawer: const SafeArea(
        child: DrawerCapitalInteresSimple()
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
                    r"C = \dfrac{I}{i*t}",
                    textStyle: const TextStyle(fontSize: 50),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              textFromFieldInteres(interes, (value) {
                interes = value;
              }),
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
                const Divider(),
                 const SizedBox(
                  height: 15,
                ),
                Transform.translate(
                  offset: const Offset(0, 13),
                  child: const Text("TIEMPO", style: TextStyle(fontSize: 20),)),
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
                              textFromFieldTrimestres(trimestre, (value) {
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Transform.translate(
                offset: const Offset(0, -200),
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        if (error == true) {
                          var interesSinComaNiPunto =
                            interes.replaceAll(".0", "").replaceAll(",", "");
                        interes = interesSinComaNiPunto;

                        showDialogPressCapital(
                            context,
                            interes,
                            tasaInteres,
                            _btnSelected,
                            ano,
                            meses,
                            dias,
                            semestre,
                            trimestre,
                            bimestre);
                        }else{
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
          ),
        ),
      ),
      bottomNavigationBar: Navegacion(selectedIndex: _selectedIndex, routes: routes),
    );
  }
}
