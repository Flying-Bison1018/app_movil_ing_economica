import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interest_app/Text/text_interes_simple.dart';
import 'package:interest_app/widgets/drawers/drawer_interes_simple_info_screen.dart';

class InteresSimpleScreen extends StatefulWidget {
  const InteresSimpleScreen({super.key});

  @override
  State<InteresSimpleScreen> createState() => _InteresSimpleScreenState();
}

class _InteresSimpleScreenState extends State<InteresSimpleScreen> {
  Future<String> _loadMarkDownData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return textInteresSimple;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("INTERES SIMPLE"),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/");
              },
              icon: const Icon(FontAwesomeIcons.arrowLeft)),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        endDrawer: const SafeArea(
          child: DrawerInteresSimpleInfoScreen()
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
