// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:interest_app/widgets/interes_simple_widgets/Interes/showdialogwidget_2_interes_calculator.dart';
import 'package:interest_app/widgets/textfromfield.dart';

class InteresCalculator2 extends StatefulWidget {
  const InteresCalculator2({super.key});

  @override
  State<InteresCalculator2> createState() => _InteresCalculator2State();
}

class _InteresCalculator2State extends State<InteresCalculator2> {
  final _formKey = GlobalKey<FormState>();
  var valorFinal;
  var capital;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CALCULAR INTERES (2)"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
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
                    "I = Vf - C",
                    textStyle: const TextStyle(fontSize: 50),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
               textFromFieldValorFinal(valorFinal, (value){
                valorFinal = value;
              }),
              const SizedBox(
                height: 15,
              ),
              textFromFieldCapital(capital, (value){
                  capital = value;
                }),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      var capitalSinComaNiPunto = capital.replaceAll(".0", "").replaceAll(",", "");
                      var valorFinalSinComaNiPunto = valorFinal.replaceAll(".0", "").replaceAll(",", "");

                      var capital2 = double.parse(capitalSinComaNiPunto);
                      var valorfinal2 = double.parse(valorFinalSinComaNiPunto);

                      if (valorfinal2 > capital2) {
                        showDialogPressInteres2(context, capital, valorFinal);
                      }else{
                        ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text("El valor final debe ser mayor al capital")));
                      }
                    }
                  },
                  child: const Text("Siguiente"))
            ],
          ),
        ),
      ),
    );
  }
}
