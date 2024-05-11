import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interest_app/config/textfromfieldwidget.dart';
import 'package:validatorless/validatorless.dart';

//Pago vencido
Widget textMonto(var monto, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFromFieldWidget(
      labeText: "Monto",
      keyboardTye: TextInputType.number,
      prefixIcon: const Icon(FontAwesomeIcons.moneyBill1Wave),
      onSaved: onSaved,
      validator: Validatorless.multiple([
        Validatorless.required("Este campo es requerido"),
        Validatorless.regex(RegExp(r'^[0-9]\d*'), "Solo numeros positivos")
      ]),
    ),
  );
}

//Deposito anualidad
Widget textValorFuturo(var valorFuturo, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFromFieldWidget(
      labeText: "Valor Futuro",
      keyboardTye: TextInputType.number,
      prefixIcon: const Icon(FontAwesomeIcons.moneyBill1),
      onSaved: onSaved,
      validator: Validatorless.multiple([
        Validatorless.required("Este campo es requerido"),
        Validatorless.regex(RegExp(r'^[0-9]\d*'), "Solo numeros positivos")
      ]),
    ),
  );
}

//Valor Futuro anualidad
Widget textDeposito(var deposito, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFromFieldWidget(
      labeText: "Deposito",
      keyboardTye: TextInputType.number,
      prefixIcon: const Icon(FontAwesomeIcons.moneyBill1),
      onSaved: onSaved,
      validator: Validatorless.multiple([
        Validatorless.required("Este campo es requerido"),
        Validatorless.regex(RegExp(r'^[0-9]\d*'), "Solo numeros positivos")
      ]),
    ),
  );
}

//Valor actual anualidad
Widget textPago(var pago, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFromFieldWidget(
      labeText: "Pago",
      keyboardTye: TextInputType.number,
      prefixIcon: const Icon(FontAwesomeIcons.moneyBill1),
      onSaved: onSaved,
      validator: Validatorless.multiple([
        Validatorless.required("Este campo es requerido"),
        Validatorless.regex(RegExp(r'^[0-9]\d*'), "Solo numeros positivos")
      ]),
    ),
  );
}

Widget textTasaInteresAnualidad(var tasaInteres, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFromFieldWidget(
      labeText: "Tasa Interes",
      keyboardTye: TextInputType.number,
      prefixIcon: const Icon(FontAwesomeIcons.percent),
      onSaved: onSaved,
      validator: Validatorless.multiple([
        Validatorless.required("Este campo es requerido"),
        Validatorless.regex(RegExp(r'^[0-9]\d*'), "Solo numeros positivos")
      ]),
    ),
  );
}

Widget textTiempoAnualidad(var tiempo, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFromFieldWidget(
      labeText: "Tiempo",
      keyboardTye: TextInputType.number,
      prefixIcon: const Icon(FontAwesomeIcons.clock),
      onSaved: onSaved,
      validator: Validatorless.multiple([
        Validatorless.required("Este campo es requerido"),
        Validatorless.regex(RegExp(r'^[0-9]\d*'), "Solo numeros positivos")
      ]),
    ),
  );
}

Widget textNumeroPeriodo(var numeroPeriodo, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFromFieldWidget(
      labeText: "Numero Periodo",
      keyboardTye: TextInputType.number,
      prefixIcon: const Icon(FontAwesomeIcons.one),
      onSaved: onSaved,
      validator: Validatorless.multiple([
        Validatorless.required("Este campo es requerido"),
        Validatorless.regex(RegExp(r'^[0-9]\d*'), "Solo numeros positivos")
      ]),
    ),
  );
}

Widget textFrecuencia(var frecuencia, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFromFieldWidget(
      labeText: "Frecuencia",
      keyboardTye: TextInputType.number,
      prefixIcon: const Icon(FontAwesomeIcons.chair),
      onSaved: onSaved,
      validator: Validatorless.multiple([
        Validatorless.required("Este campo es requerido"),
        Validatorless.regex(RegExp(r'^[0-9]\d*'), "Solo numeros positivos")
      ]),
    ),
  );
}

Widget textTiempo(var tiempo, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFromFieldWidget(
      labeText: "Tiempo",
      keyboardTye: TextInputType.number,
      prefixIcon: const Icon(FontAwesomeIcons.clock),
      onSaved: onSaved,
      validator: Validatorless.multiple([
        Validatorless.required("Este campo es requerido"),
        Validatorless.regex(RegExp(r'^[0-9]\d*'), "Solo numeros positivos")
      ]),
    ),
  );
}

Widget textValorTotalPrestamo(
    var valorTotalPrestamo, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFromFieldWidget(
      labeText: "Valor Total Prestamo",
      keyboardTye: TextInputType.number,
      prefixIcon: const Icon(FontAwesomeIcons.moneyBill),
      onSaved: onSaved,
      validator: Validatorless.multiple([
        Validatorless.required("Este campo es requerido"),
        Validatorless.regex(RegExp(r'^[0-9]\d*'), "Solo numeros positivos")
      ]),
    ),
  );
}

Widget textFromFieldInteres2(var interes2, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFromFieldWidget(
      labeText: "Interes",
      keyboardTye: TextInputType.number,
      prefixIcon: const Icon(FontAwesomeIcons.percent),
      onSaved: onSaved,
      validator: Validatorless.multiple([]),
    ),
  );
}

Widget textFromFieldDynamic(var anos, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFromFieldWidget(
      labeText: "Dinero",
      prefixIcon: const Icon(FontAwesomeIcons.moneyBill),
      keyboardTye: TextInputType.number,
      onSaved: onSaved,
      validator: Validatorless.multiple([
        Validatorless.required("Este campo es requerido"),
        Validatorless.regex(RegExp(r'^[0-9]\d*'), "Solo numeros positivos")
      ]),
    ),
  );
}

Widget textFromFieldInversion(var inversion, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFromFieldWidget(
      labeText: "Inversion",
      prefixIcon: Icon(FontAwesomeIcons.dollar),
      keyboardTye: TextInputType.number,
      onSaved: onSaved,
      validator: Validatorless.multiple([
        Validatorless.required("Este campo es requerido"),
        Validatorless.regex(RegExp(r'^[0-9]\d*'), "Solo numeros positivos")
      ]),
    ),
  );
}

Widget textFromFieldMontoCompuesto(var monto, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFromFieldWidget(
      labeText: "Monto Compuesto",
      prefixIcon: const Icon(FontAwesomeIcons.moneyBill1Wave),
      controller: MoneyMaskedTextController(
        thousandSeparator: ",",
        decimalSeparator: ".",
        precision: 1,
      ),
      keyboardTye: TextInputType.number,
      onSaved: onSaved,
      validator: Validatorless.multiple([
        Validatorless.required("Este campo es requerido"),
        Validatorless.regex(RegExp(r'^[0-9]\d*'), "Solo numeros positivos")
      ]),
    ),
  );
}

Widget textFromFieldCapital(var capital, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFromFieldWidget(
      labeText: "Capital",
      prefixIcon: const Icon(FontAwesomeIcons.moneyBill1Wave),
      controller: MoneyMaskedTextController(
        thousandSeparator: ",",
        decimalSeparator: ".",
        precision: 1,
      ),
      keyboardTye: TextInputType.number,
      onSaved: onSaved,
      validator: Validatorless.multiple([
        Validatorless.required("Este campo es requerido"),
        Validatorless.regex(RegExp(r'^[0-9]\d*'), "Solo numeros positivos")
      ]),
    ),
  );
}

Widget textFromFieldTasaInteres(var tasaInteres, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFromFieldWidget(
      labeText: "Tasa de interes",
      prefixIcon: const Icon(FontAwesomeIcons.chartLine),
      keyboardTye: TextInputType.number,
      onSaved: onSaved,
      validator: Validatorless.multiple([
        Validatorless.required("Este campo es requerido"),
        Validatorless.regex(RegExp(r'^[0-9]\d*'), "Solo numeros positivos"),
        Validatorless.regex(
            RegExp(r'^\d+(\.\d{0,2})?$'), "Porfavor usa el (.) como separador"),
      ]),
    ),
  );
}

Widget textFromFieldInteres(var interes, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFromFieldWidget(
      labeText: "Interes",
      prefixIcon: const Icon(FontAwesomeIcons.moneyBill1Wave),
      controller: MoneyMaskedTextController(
        thousandSeparator: ",",
        decimalSeparator: ".",
        precision: 1,
      ),
      keyboardTye: TextInputType.number,
      onSaved: onSaved,
      validator: Validatorless.multiple([
        Validatorless.regex(RegExp(r'^[0-9]\d*'), "Solo numeros positivos")
      ]),
    ),
  );
}

Widget textFromFieldAno(
  var ano,
  Function(String?)? onSaved,
) {
  return Padding(
    padding: const EdgeInsets.only(right: 120, left: 100),
    child: TextFromFieldWidget(
      labeText: "Año",
      controller: TextEditingController(text: "0"),
      //enable: _btnSelected2 != "MESES" ? false : true,
      prefixIcon: const Icon(FontAwesomeIcons.calendar),
      keyboardTye: TextInputType.number,
      onSaved: onSaved,
      validator: Validatorless.multiple(
          [Validatorless.regex(RegExp(r'^[0-9]\d*'), "Numeros positivos")]),
    ),
  );
}

Widget textFromFieldMeses(var otros, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.only(right: 120, left: 100),
    child: TextFromFieldWidget(
      labeText: "Meses",
      controller: TextEditingController(text: "0"),
      prefixIcon: const Icon(FontAwesomeIcons.calendar),
      keyboardTye: TextInputType.number,
      onSaved: onSaved,
      validator: Validatorless.multiple(
          [Validatorless.regex(RegExp(r'^[0-9]\d*'), "Numeros positivos")]),
    ),
  );
}

Widget textFromFieldDias(var dias, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.only(right: 120, left: 100),
    child: TextFromFieldWidget(
      labeText: "Dias",
      controller: TextEditingController(text: "0"),
      //enable: _btnSelected2 != "MESES" ? false : true,
      prefixIcon: const Icon(FontAwesomeIcons.calendar),
      keyboardTye: TextInputType.number,
      onSaved: onSaved,
      validator: Validatorless.multiple(
          [Validatorless.regex(RegExp(r'^[0-9]\d*'), "Numeros positivos")]),
    ),
  );
}

Widget textFromFieldSemestre(var semestre, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.only(right: 120, left: 100),
    child: TextFromFieldWidget(
      labeText: "Semestres",
      controller: TextEditingController(text: "0"),
      //enable: _btnSelected2 != "MESES" ? false : true,
      prefixIcon: const Icon(FontAwesomeIcons.calendar),
      keyboardTye: TextInputType.number,
      onSaved: onSaved,
      validator: Validatorless.multiple(
          [Validatorless.regex(RegExp(r'^[0-9]\d*'), "Numeros positivos")]),
    ),
  );
}

Widget textFromFieldTrimestres(var trimestre, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.only(right: 120, left: 100),
    child: TextFromFieldWidget(
      labeText: "Trimestres",
      controller: TextEditingController(text: "0"),
      //enable: _btnSelected2 != "MESES" ? false : true,
      prefixIcon: const Icon(FontAwesomeIcons.calendar),
      keyboardTye: TextInputType.number,
      onSaved: onSaved,
      validator: Validatorless.multiple(
          [Validatorless.regex(RegExp(r'^[0-9]\d*'), "Numeros positivos")]),
    ),
  );
}

Widget textFromFieldBimestre(var bimestre, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.only(right: 120, left: 100),
    child: TextFromFieldWidget(
      labeText: "Bimestre",
      controller: TextEditingController(text: "0"),
      //enable: _btnSelected2 != "MESES" ? false : true,
      prefixIcon: const Icon(FontAwesomeIcons.calendar),
      keyboardTye: TextInputType.number,
      onSaved: onSaved,
      validator: Validatorless.multiple(
          [Validatorless.regex(RegExp(r'^[0-9]\d*'), "Numeros positivos")]),
    ),
  );
}

Widget textFromFieldValorFinal(var valorFinal, Function(String?)? onSaved) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFromFieldWidget(
      labeText: "ValorFinal",
      prefixIcon: const Icon(FontAwesomeIcons.moneyBill1Wave),
      controller: MoneyMaskedTextController(
        thousandSeparator: ",",
        decimalSeparator: ".",
        precision: 1,
      ),
      keyboardTye: TextInputType.number,
      onSaved: onSaved,
      validator: Validatorless.multiple([
        Validatorless.required("Este campo es requerido"),
        Validatorless.regex(RegExp(r'^[0-9]\d*'), "Solo numeros positivos")
      ]),
    ),
  );
}
