import 'package:flutter/material.dart';

class DropDownButtonWidgetMetodo extends StatefulWidget {
  final void Function(Object?)? onChanged;
  final Object? value;
  const DropDownButtonWidgetMetodo({super.key, this.onChanged, this.value});

  @override
  State<DropDownButtonWidgetMetodo> createState() =>
      _DropDownButtonWidgetMetodoState();
}

class _DropDownButtonWidgetMetodoState
    extends State<DropDownButtonWidgetMetodo> {
  static const menuOptions = ["FRANCES", "ALEMAN", "USA"];
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
