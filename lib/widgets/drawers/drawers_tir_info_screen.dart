import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerTirInfoScreen extends StatefulWidget {
  const DrawerTirInfoScreen({super.key});

  @override
  State<DrawerTirInfoScreen> createState() => _DrawerTirInfoScreenState();
}

class _DrawerTirInfoScreenState extends State<DrawerTirInfoScreen> {
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
                      "TIR",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              )),
          ListTile(
            title: const Text(
              "Calcular TIR",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Future.delayed(const Duration(milliseconds: 500), () {
                Navigator.of(context).pushNamed("/calcularTir");
              });
            },
            leading: const Icon(FontAwesomeIcons.calculator),
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
              child: Text(
            "Formula",
            style: TextStyle(fontSize: 20),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Math.tex(
                textStyle: const TextStyle(fontSize: 20),
                r"VAN = - I_0 + \sum\limits^{n}_{t = 1} \frac{F_t}{(1 + TIR)^t} "),
          )
        ],
      ),
    );
  }
}
