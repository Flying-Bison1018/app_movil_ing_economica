import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerInteresSimpleInfoScreen extends StatefulWidget {
  const DrawerInteresSimpleInfoScreen({super.key});

  @override
  State<DrawerInteresSimpleInfoScreen> createState() =>
      _DrawerInteresSimpleInfoScreenState();
}

class _DrawerInteresSimpleInfoScreenState
    extends State<DrawerInteresSimpleInfoScreen> {
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
                      "INTERES SIMPLE",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              )),
          ListTile(
            title: const Text(
              "Calular el Interes",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Future.delayed(const Duration(milliseconds: 500), () {
                Navigator.of(context).pushNamed("/calcularInteres");
              });
            },
            leading: const Icon(FontAwesomeIcons.i),
          ),
          ListTile(
            title: const Text(
              "Calular el Capital",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Future.delayed(const Duration(milliseconds: 500), () {
                Navigator.of(context).pushNamed("/calcularCapital");
              });
            },
            leading: const Icon(FontAwesomeIcons.c),
          ),
          ListTile(
            title: const Text(
              "Calular el Tiempo",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Future.delayed(const Duration(milliseconds: 500), () {
                Navigator.of(context).pushNamed("/calcularTiempo");
              });
            },
            leading: const Icon(FontAwesomeIcons.clock),
          ),
          ListTile(
            title: const Text(
              "Calular el Valor Final",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Future.delayed(const Duration(milliseconds: 500), () {
                Navigator.of(context).pushNamed("/calcularValorFinal");
              });
            },
            leading: const Icon(FontAwesomeIcons.moneyBill1),
          ),
          ListTile(
            title: const Text(
              "Calular la Tasa de Interes",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Future.delayed(const Duration(milliseconds: 500), () {
                Navigator.of(context).pushNamed("/calcularTasaInteres");
              });
            },
            leading: const Icon(FontAwesomeIcons.percent),
          ),
          //Image.asset("assets/riqueza.gif")
        ],
      ),
    );
  }
}
