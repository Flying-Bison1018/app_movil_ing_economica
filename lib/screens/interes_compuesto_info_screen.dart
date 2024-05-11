import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interest_app/Text/text_interes_compuesto.dart';
import 'package:interest_app/widgets/drawers/drawer_interes_compuesto_info_screen.dart';

class InteresCompuestoScreen extends StatefulWidget {
  const InteresCompuestoScreen({super.key});

  @override
  State<InteresCompuestoScreen> createState() => _InteresCompuestoScreenState();
}

class _InteresCompuestoScreenState extends State<InteresCompuestoScreen> {
  Future<String> _loadMarkDownData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return textInteresCompuesto;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("INTERES COMPUESTO"),
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
          child: DrawerInteresCompuestoInfoScreen()
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
        ));
  }
}
