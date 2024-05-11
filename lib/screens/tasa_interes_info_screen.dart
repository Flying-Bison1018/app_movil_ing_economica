import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interest_app/Text/text_tasa_interes.dart';
import 'package:interest_app/widgets/drawers/drawer_tasa_interes_info_screen.dart';

class TasaInteresScreen extends StatefulWidget {
  const TasaInteresScreen({super.key});

  @override
  State<TasaInteresScreen> createState() => _TasaInteresScreenState();
}

class _TasaInteresScreenState extends State<TasaInteresScreen> {
  Future<String> _loadMarkDownData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return textTasaInteres;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TASAS INTERES"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/");
            },
            icon: const Icon(FontAwesomeIcons.arrowLeft)),
      ),
      endDrawer: const SafeArea(
        child: Drawer(child: DrawerTasaInteresInfoScreen()),
      ),
      body: FutureBuilder(
        future: _loadMarkDownData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          } else {
            return Markdown(
              data: snapshot.data!,
              physics: const BouncingScrollPhysics(),
            );
          }
        },
      ),
    );
  }
}
