// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interest_app/widgets/textfromfield.dart';
import 'package:interest_app/widgets/tir/dialogfullscreenwidget.dart';

class TirScreen extends StatefulWidget {
  const TirScreen({super.key});

  @override
  State<TirScreen> createState() => _TirScreenState();
}

class _TirScreenState extends State<TirScreen> {
  final _formKey = GlobalKey<FormState>();
  List<String?> anos = [];
  var inversion;
  var interes;
  int count = 0;

  @override
  void initState() {
    super.initState();
    count = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TIR"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                increment();
              },
              icon: const Icon(FontAwesomeIcons.plus)),
          IconButton(
              onPressed: () {
                decrement(count);
              },
              icon: const Icon(FontAwesomeIcons.minus)),
          IconButton(
              onPressed: () {
                refresh();
              },
              icon: const Icon(FontAwesomeIcons.arrowRotateRight)),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Math.tex(
                  textStyle: const TextStyle(fontSize: 25),
                  r"VAN = - I_0 + \sum\limits^{n}_{t = 1} \frac{F_t}{(1 + TIR)^t} "),
            ),
            const SizedBox(
              height: 20,
            ),
            textFromFieldInversion(inversion, (value) {
              inversion = value;
            }),
            const SizedBox(
              height: 10,
            ),
            textFromFieldInteres2(interes, (value) {
              interes = value;
            }),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: count,
                itemBuilder: (BuildContext context, int index) {
                  return row(index);
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    dialogfullScreen(context, inversion, interes, anos);
                  }
                },
                child: const Text("Continuar"))
          ],
        ),
      ),
    );
  }

  row(int index) {
    int index2 = index + 1;
    return Row(
      children: [
        Text(
          "Año: $index2",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 3.0,
        ),
        Expanded(
          child: textFromFieldDynamic(anos, (value) {
            if (anos.length > index && anos[index] != value) {
              anos[index] = value;
            } else if (anos.length <= index) {
              anos.add(value);
            }
          }),
        )
      ],
    );
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement(int count2) {
    setState(() {
      if (anos.isNotEmpty) {
        anos.removeLast();
      }

      if (count > 1) {
        count--;
      }
    });
  }

  void refresh() {
    setState(() {
      count = 1;
    });

    anos.clear();
  }
}
