import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerTiempoInteresSimple extends StatefulWidget {
  const DrawerTiempoInteresSimple({super.key});

  @override
  State<DrawerTiempoInteresSimple> createState() => _DrawerTiempoInteresSimpleState();
}

class _DrawerTiempoInteresSimpleState extends State<DrawerTiempoInteresSimple> {
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
                      textStyle: const TextStyle(fontSize: 30),
                      r"t = \dfrac{\dfrac{VF}{C} - 1 }{i}",
                    ),
                    ListTile(
                      title: const Text(
                        "Calcular Tiempo (2) ",
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed("/calcularTiempo2");
                      },
                      leading: const Icon(FontAwesomeIcons.clock),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}