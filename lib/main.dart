import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:interest_app/app.dart';
import 'package:interest_app/widgets/amortizacion/provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  setup();
  runApp(ChangeNotifierProvider(
    create: (context) => SumaInteres(),
    child: const MyApp(),
  ));
}

void setup() async {
  await Future.delayed(const Duration(seconds: 5));
  FlutterNativeSplash.remove();
}
