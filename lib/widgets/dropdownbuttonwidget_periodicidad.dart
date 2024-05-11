import 'package:flutter/material.dart';

class DropDownButtonWidgetPeriodicidad extends StatefulWidget {
  final void Function(Object?)? onChanged;
  final Object? value;
  const DropDownButtonWidgetPeriodicidad({super.key, this.onChanged, this.value});

  @override
  State<DropDownButtonWidgetPeriodicidad> createState() => _DropDownButtonWidgetPeriodicidadState();
}

class _DropDownButtonWidgetPeriodicidadState extends State<DropDownButtonWidgetPeriodicidad> {
  static const menuOptions = ["ANUAL", "MENSUAL", "SEMESTRAL","TRIMESTRAL","BIMESTRAL",];
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
