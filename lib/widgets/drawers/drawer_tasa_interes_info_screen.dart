import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerTasaInteresInfoScreen extends StatefulWidget {
  const DrawerTasaInteresInfoScreen({super.key});

  @override
  State<DrawerTasaInteresInfoScreen> createState() =>
      _DrawerTasaInteresInfoScreenState();
}

class _DrawerTasaInteresInfoScreenState
    extends State<DrawerTasaInteresInfoScreen> {
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
                      "TASA INTERES",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              )),
          ListTile(
            title: const Text(
              "TASA INTERES SIMPLE",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Future.delayed(const Duration(milliseconds: 500), () {
                Navigator.of(context).pushNamed("/calcularTasaInteres");
              });
            },
            leading: const Icon(FontAwesomeIcons.i),
          ),
          ListTile(
            title: const Text(
              "TASA INTERES COMPUESTO",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Future.delayed(const Duration(milliseconds: 500), () {
                Navigator.of(context)
                    .pushNamed("/calcularTasaInteres2Compuesto");
              });
            },
            leading: const Icon(FontAwesomeIcons.c),
          ),
        ],
      ),
    );
  }
}
