import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerTasaInteres extends StatefulWidget {
  const DrawerTasaInteres({super.key});

  @override
  State<DrawerTasaInteres> createState() => _DrawerTasaInteresState();
}

class _DrawerTasaInteresState extends State<DrawerTasaInteres> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    //margin: EdgeInsets.all(),
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        image: DecorationImage(
                          image: AssetImage("assets/informacion.png"),
                          alignment: Alignment.bottomLeft,
                        )),
                    child: Transform.translate(
                      offset: const Offset(79, 5),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "INFORMACION",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            "ADICIONAL",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    )),
                Column(
                  children: [
                    Math.tex(
                        r"i = \dfrac{\dfrac{VF}{C} - 1}{t}",
                        textStyle: const TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ListTile(
                      title: const Text(
                        "Calcular Tasa Interes (2) ",
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed("/calcularTasaInteres2");
                      },
                      leading: const Icon(FontAwesomeIcons.chartLine),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}