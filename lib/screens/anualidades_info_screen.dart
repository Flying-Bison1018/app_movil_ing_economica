import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interest_app/Text/anualidades.dart';

import 'package:interest_app/widgets/drawers/drawer_anualidades_info_screen.dart';

class AnualidadesScreenInfo extends StatefulWidget {
  const AnualidadesScreenInfo({super.key});

  @override
  State<AnualidadesScreenInfo> createState() => _AnualidadesScreenInfoState();
}

class _AnualidadesScreenInfoState extends State<AnualidadesScreenInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ANUALIDADES"),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/");
              },
              icon: const Icon(FontAwesomeIcons.arrowLeft)),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        endDrawer: const SafeArea(child: DrawerAnualidadesInfoScreen()),
        body: const Markdown(data: textAnualidades));
  }
}
