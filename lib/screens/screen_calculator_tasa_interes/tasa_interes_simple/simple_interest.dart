// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class SimpleInterestPage extends StatefulWidget {
  final String selectedTime;

  SimpleInterestPage({required this.selectedTime});

  @override
  _SimpleInterestPageState createState() => _SimpleInterestPageState();
}

class _SimpleInterestPageState extends State<SimpleInterestPage> {
  
  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController yearsController = TextEditingController();
  TextEditingController monthsController = TextEditingController();
  TextEditingController daysController = TextEditingController();

  double simpleInterest = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasa de Interés Simple'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cuadro de texto para el capital principal
            TextField(
              controller: principalController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Capital principal'),
            ),
            // Cuadro de texto para la tasa de interés
            TextField(
              controller: rateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Tasa de interés'),
            ),
            // Cuadro de texto para los años (si aplica)
            if (widget.selectedTime.contains('Año'))
              TextField(
                controller: yearsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Años'),
              ),
            // Cuadro de texto para los meses (si aplica)
            if (widget.selectedTime.contains('Mes'))
              TextField(
                controller: monthsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Meses'),
              ),
            // Cuadro de texto para los días (si aplica)
            if (widget.selectedTime.contains('Día'))
              TextField(
                controller: daysController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Días'),
              ),
            const SizedBox(height: 20),
            // Botón para calcular la Tasa de Interés Simple
            ElevatedButton(
              onPressed: () {
                double principal = double.parse(principalController.text);
                double rate = double.parse(rateController.text);
                int years = int.parse(yearsController.text);
                int months = int.parse(monthsController.text);
                int days = int.parse(daysController.text);

                // Convertir el tiempo total a años para el cálculo
                double totalTimeInYears = years + months / 12 + days / 360;
                simpleInterest = principal * rate/100 * totalTimeInYears;

                // Mostrar el resultado en un diálogo
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Resultado'),
                      content: Text('La tasa de interés simple es: ${simpleInterest.toStringAsFixed(2)}'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Aceptar'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text('Calcular Tasa de Interés Simple'),
            ),
          ],
        ),
      ),
    );
  }
}
