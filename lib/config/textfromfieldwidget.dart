import 'package:flutter/material.dart';

class TextFromFieldWidget extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? Function(String)? onChanged;
  final String? labeText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final int? maxLenght;
  final Key? key1;
  final TextCapitalization capitalization;
  final TextInputType? keyboardTye;
  final TextEditingController? controller;
  final bool enable;

  const TextFromFieldWidget(
      {super.key,
      this.enable = true,
      this.controller,
      this.onSaved,
      this.validator,
      this.labeText,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      this.maxLenght,
      this.key1, this.keyboardTye, this.capitalization = TextCapitalization.none, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
        labelText: labeText,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        )
    );

    return TextFormField(
      key: key1,
      decoration: inputDecoration,
      obscureText: obscureText,
      keyboardType: keyboardTye,
      textCapitalization: capitalization,
      onSaved: onSaved,
      validator: validator,
      maxLength: maxLenght,
      controller: controller,
      enabled: enable,
      onChanged: onChanged,

    );
  }
}
