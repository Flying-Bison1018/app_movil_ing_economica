import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({super.key});

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 180,
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                )),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Text("BIENVENIDO",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.white)),
                Text("INTEREST APP",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white54)),
                Image.asset(
                  "assets/dinero.png",
                  height: 60,
                  width: 60,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.green,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100))),
              child: GridView.count(
                crossAxisSpacing: 40,
                shrinkWrap: true,
                mainAxisSpacing: 30,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: <Widget>[
                  itemDashboard(
                      "Interes Simple", FontAwesomeIcons.coins, Colors.green,
                      () {
                    Navigator.of(context).pushNamed("/interesSimple");
                  }),

                  itemDashboard("Interes Compuesto",
                      FontAwesomeIcons.hourglassHalf, Colors.green, () {
                    Navigator.of(context).pushNamed("/interesCompuesto");
                  }),

                  itemDashboard(
                      "Tasa de interes", FontAwesomeIcons.percent, Colors.green,
                      () {
                    Navigator.of(context).pushNamed("/tasaInteres");
                  }),

                  itemDashboard(
                      "Anualidades", FontAwesomeIcons.arrowUp, Colors.green,
                      () {
                    Navigator.of(context).pushNamed("/anualidades");
                  }),

                  itemDashboard(
                      "Amortizacion", FontAwesomeIcons.building, Colors.green,
                      () {
                    Navigator.of(context).pushNamed("/amortizacion");
                  }),

                  itemDashboard(
                      "TIR", FontAwesomeIcons.calculator, Colors.green, () {
                    Navigator.of(context).pushNamed("/tir");
                  }),

                  itemDashboard("Proximamente", Icons.youtube_searched_for,
                      Colors.red, () {}),
                  //itemDashboard("Interes Simple", Icons.youtube_searched_for, Colors.red),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  itemDashboard(
      String title, IconData iconData, Color background, Function()? ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Theme.of(context).primaryColor.withOpacity(.2),
                  spreadRadius: 3,
                  blurRadius: 1)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }
}
