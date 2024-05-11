import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerAnualidadesInfoScreen extends StatefulWidget {
  const DrawerAnualidadesInfoScreen({super.key});

  @override
  State<DrawerAnualidadesInfoScreen> createState() =>
      _DrawerAnualidadesInfoScreenState();
}

class _DrawerAnualidadesInfoScreenState
    extends State<DrawerAnualidadesInfoScreen> {
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
                      "ANUALIDADES",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              )),
          ListTile(
            title: const Text(
              "Calcular Anualidades ",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Future.delayed(const Duration(milliseconds: 500), () {
                Navigator.of(context).pushNamed("/calculatorAnualidad");
              });
            },
            leading: const Icon(FontAwesomeIcons.a),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
