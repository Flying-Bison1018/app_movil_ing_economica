import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interest_app/Text/tir.dart';
import 'package:interest_app/widgets/drawers/drawers_tir_info_screen.dart';

class TirScreenInfo extends StatefulWidget {
  const TirScreenInfo({super.key});

  @override
  State<TirScreenInfo> createState() => _TirScreenInfoState();
}

class _TirScreenInfoState extends State<TirScreenInfo> {
  Future<String> _loadMarkDownData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return textTir;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TIR"),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/");
              },
              icon: const Icon(FontAwesomeIcons.arrowLeft)),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        endDrawer: const SafeArea(child: DrawerTirInfoScreen()),
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
