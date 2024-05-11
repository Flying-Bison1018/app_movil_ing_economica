import 'package:flutter/material.dart';
import 'package:interest_app/screens/amortizacion_info_screen.dart';
import 'package:interest_app/screens/anualidades_info_screen.dart';
import 'package:interest_app/screens/screen_calculator_amortizacion/abono_capital_calculator.dart';
import 'package:interest_app/screens/screen_calculator_amortizacion/metodo_calculator.dart';
import 'package:interest_app/screens/screen_calculator_anualidades/anualidades.dart';
import 'package:interest_app/screens/screen_calculator_interes_compuesto/Capital/capital_compuesto_screen.dart';
import 'package:interest_app/screens/screen_calculator_interes_compuesto/MontoCompuesto/monto_compuesto_screen.dart';
import 'package:interest_app/screens/screen_calculator_interes_compuesto/TasaInteres/tasa_interes_screen.dart';
import 'package:interest_app/screens/screen_calculator_interes_compuesto/TasaInteresCompuesto/tasa_interes_compuesto_screen.dart';
import 'package:interest_app/screens/screen_calculator_interes_simple/Capital/capital_calculator_2_screen.dart';
import 'package:interest_app/screens/screen_calculator_interes_simple/Capital/capital_calculator_screen.dart';
import 'package:interest_app/screens/screen_calculator_interes_simple/Interes/interes_calculator_2_screen.dart';
import 'package:interest_app/screens/screen_calculator_interes_simple/Interes/interes_calculator_screen.dart';
import 'package:interest_app/screens/screen_calculator_interes_simple/TasaInteres/tasa_interes_calculator.dart';
import 'package:interest_app/screens/screen_calculator_interes_simple/TasaInteres/tasa_interes_calculator2.dart';
import 'package:interest_app/screens/screen_calculator_interes_simple/Tiempo/tiempo_calculator2_screen.dart';
import 'package:interest_app/screens/screen_calculator_interes_simple/Tiempo/tiempo_calculator_screen.dart';
import 'package:interest_app/screens/screen_calculator_interes_simple/ValorFinal/valor_final_calculator_screen.dart';
import 'package:interest_app/screens/interes_compuesto_info_screen.dart';
import 'package:interest_app/screens/interes_simple_info_screen.dart';
import 'package:interest_app/screens/principal_screen.dart';
import 'package:interest_app/screens/screen_calculator_tir/tir_screen.dart';
import 'package:interest_app/screens/tasa_interes_info_screen.dart';
import 'package:interest_app/screens/tir_info_screen.dart';
import 'package:interest_app/theme/app_theme.dart';
import 'package:interest_app/widgets/amortizacion/calculo_abono_capital.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Interest App",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: AppTheme().themes(),
      routes: {
        "/": (context) => const PrincipalScreen(),

        //? INICIO INTERES SIMPLE
        "/interesSimple": (context) => const InteresSimpleScreen(),

        "/calcularInteres": (context) => const InteresCalculator(),
        "/calcularInteres2": (context) => const InteresCalculator2(),

        "/calcularCapital": (context) => const CapitalCalculator(),
        "/calcularCapital2": (context) => const CapitalCalculator2(),

        "/calcularTiempo": (context) => const TiempoCalculator(),
        "/calcularTiempo2": (context) => const TiempoCalculator2(),

        "/calcularValorFinal": (context) => const CalcularValorFinal(),

        "/calcularTasaInteres": (context) => const TasaInteresCalculator(),
        "/calcularTasaInteres2": (context) => const TasaInteresCalculator2(),
        //!FIN INTERES SIMPLE

        //? INICIO INTERES COMPUESTO
        "/interesCompuesto": (context) => const InteresCompuestoScreen(),
        "/calcularMontoCompuesto": (context) => const MontoCompuesto(),
        "/calcularTasaInteresCompuesto": (context) =>
            const TasaInteresCompuesto(),
        "/calcularTasaInteres2Compuesto": (context) =>
            const TasaInteresScreen2(),
        "/calcularCapitalCompuesto": (context) =>
            const CapitalCompuestoScreen(),
        //! FIN DE INTERES COMPUESTO

        //! TASA INTERES
        "/tasaInteres": (context) => const TasaInteresScreen(),
        "/calcularTir": (context) => const TirScreen(),
        //! FIN TASA INTERES

        //! TIR
        "/tir": (context) => const TirScreenInfo(),

        //! AMORTIZACION

        "/amortizacion": (context) => const AmortizacionScreenInfo(),
        "/metodos": (context) => const CalculoMetodos(),
        "/abonoCapital": (context) => const AbonoCapital(),
        "/tablaAbono": (context) => const AmortizacionTabla(),

        //! ANUALIDADES

        "/anualidades": (context) => const AnualidadesScreenInfo(),
        "/calculatorAnualidad": (context) => const AnualidadesCalculator()
      },
    );
  }
}
