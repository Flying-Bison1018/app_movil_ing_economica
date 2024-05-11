import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interest_app/Text/amortizacion.dart';
import 'package:interest_app/widgets/drawers/drawer_amortizacion_info_screen.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AmortizacionScreenInfo extends StatefulWidget {
  const AmortizacionScreenInfo({super.key});

  @override
  State<AmortizacionScreenInfo> createState() => _AmortizacionScreenInfoState();
}

class _AmortizacionScreenInfoState extends State<AmortizacionScreenInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("AMORTIZACION"),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/");
              },
              icon: const Icon(FontAwesomeIcons.arrowLeft)),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        endDrawer: const SafeArea(child: DrawerAmortizacionInfoScreen()),
        body: const Markdown(
          data: textAmortizacion,
        ));
  }
}
