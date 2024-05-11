import 'package:flutter/material.dart';

class DropDownButtonWidgetTiempo extends StatefulWidget {
  final void Function(Object?)? onChanged;
  final Object? value;
  const DropDownButtonWidgetTiempo({super.key, this.onChanged, this.value});

  @override
  State<DropDownButtonWidgetTiempo> createState() => _DropDownButtonWidgetTiempoState();
}

class _DropDownButtonWidgetTiempoState extends State<DropDownButtonWidgetTiempo> {
  static const menuOptions = ["MESES", "TRIMESTRE", "SEMESTRE","BIMESTRAL"];
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
        onChanged: widget.onChanged);
  }
}
