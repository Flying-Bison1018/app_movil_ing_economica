import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerInteresCompuestoInfoScreen extends StatefulWidget {
  const DrawerInteresCompuestoInfoScreen({super.key});

  @override
  State<DrawerInteresCompuestoInfoScreen> createState() =>
      _DrawerInteresCompuestoInfoScreenState();
}

class _DrawerInteresCompuestoInfoScreenState
    extends State<DrawerInteresCompuestoInfoScreen> {
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
                    image: AssetImage("assets/drawerimage.png"),
                    alignment: Alignment.bottomLeft,
                  )),
              child: Transform.translate(
                offset: const Offset(79, 5),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CALCULADORA",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "INTERES",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      "COMPUESTO",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              )),
          ListTile(
            title: const Text(
              "Calular Monto Compuesto",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Future.delayed(const Duration(milliseconds: 500), () {
                Navigator.of(context).pushNamed("/calcularMontoCompuesto");
              });
            },
            leading: const Icon(FontAwesomeIcons.piggyBank),
          ),
          ListTile(
            title: const Text(
              "Calcular Tiempo",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Future.delayed(const Duration(milliseconds: 500), () {
                Navigator.of(context)
                    .pushNamed("/calcularTasaInteresCompuesto");
              });
            },
            leading: const Icon(FontAwesomeIcons.clock),
          ),
          ListTile(
            title: const Text(
              "Calcular Tasa Interes",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Future.delayed(const Duration(milliseconds: 500), () {
                Navigator.of(context)
                    .pushNamed("/calcularTasaInteres2Compuesto");
              });
            },
            leading: const Icon(FontAwesomeIcons.chartLine),
          ),
          ListTile(
            title: const Text(
              "Calcular Capital",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Future.delayed(const Duration(milliseconds: 500), () {
                Navigator.of(context).pushNamed("/calcularCapitalCompuesto");
              });
            },
            leading: const Icon(FontAwesomeIcons.c),
          ),
        ],
      ),
    );
  }
}
