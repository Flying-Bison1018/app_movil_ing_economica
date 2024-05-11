import 'package:flutter/material.dart';

class DropDownButtonWidgetAnualidad extends StatefulWidget {
  final void Function(Object?)? onChanged;
  final Object? value;
  const DropDownButtonWidgetAnualidad({super.key, this.onChanged, this.value});

  @override
  State<DropDownButtonWidgetAnualidad> createState() =>
      _DropDownButtonWidgetAnualidadState();
}

class _DropDownButtonWidgetAnualidadState
    extends State<DropDownButtonWidgetAnualidad> {
  static const menuOptions = [
    "VALOR FUTURO",
    "VALOR ACTUAL",
    "DEPOSITO",
    "PAGOS VENCIDO"
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuOptions
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: _dropDownMenuItems,
      value: widget.value,
      onChanged: widget.onChanged,
    );
  }
}
