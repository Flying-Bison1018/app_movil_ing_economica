import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerAmortizacionInfoScreen extends StatefulWidget {
  const DrawerAmortizacionInfoScreen({super.key});

  @override
  State<DrawerAmortizacionInfoScreen> createState() =>
      _DrawerAmortizacionInfoScreenState();
}

class _DrawerAmortizacionInfoScreenState
    extends State<DrawerAmortizacionInfoScreen> {
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
                      "AMORTIZACION",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              )),
          ListTile(
            title: const Text(
              "Metodo Capitalizacion ",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Future.delayed(const Duration(milliseconds: 500), () {
                Navigator.of(context).pushNamed("/metodos");
              });
            },
            leading: const Icon(FontAwesomeIcons.m),
          ),
          // ListTile(
          //   title: const Text(
          //     "Abono a Capital",
          //     style: TextStyle(color: Colors.black),
          //   ),
          //   onTap: () {
          //     Future.delayed(const Duration(milliseconds: 500), () {
          //       Navigator.of(context).pushNamed("/abonoCapital");
          //     });
          //   },
          //   leading: const Icon(FontAwesomeIcons.circleDollarToSlot),
          // ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
