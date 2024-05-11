import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class Navegacion extends StatefulWidget {
  Navegacion(
      {super.key,
      required this.selectedIndex,
      required this.routes,
      });
  late int selectedIndex;

  late List<String> routes = [];

  @override
  State<Navegacion> createState() => _NavegacionState();
}

class _NavegacionState extends State<Navegacion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: FlashyTabBar(
        selectedIndex: widget.selectedIndex,
        showElevation: false,
        animationCurve: Curves.decelerate,
        backgroundColor: Colors.green,
        animationDuration: const Duration(seconds: 1),
        onItemSelected: (index) {
          setState(() {
            widget.selectedIndex = index;
          });
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.of(context).pushNamed(widget.routes[index]);
          });
        },
        items: [
          FlashyTabBarItem(
            icon: const Icon(FontAwesomeIcons.i, color: Colors.white),
            title: const Text(
              'Interes',
              style: TextStyle(color: Colors.white),
            ),
          ),
          FlashyTabBarItem(
            icon: const Icon(FontAwesomeIcons.c, color: Colors.white),
            title: const Text('Capital', style: TextStyle(color: Colors.white)),
          ),
          FlashyTabBarItem(
            icon: const Icon(FontAwesomeIcons.clock, color: Colors.white),
            title: const Text('Tiempo', style: TextStyle(color: Colors.white)),
          ),
          FlashyTabBarItem(
            icon: const Icon(FontAwesomeIcons.moneyBill, color: Colors.white),
            title: const Text('Valor Final',
                style: TextStyle(color: Colors.white)),
          ),
          FlashyTabBarItem(
            icon: const Icon(FontAwesomeIcons.percent, color: Colors.white),
            title: const Text('Tasa Interes',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
