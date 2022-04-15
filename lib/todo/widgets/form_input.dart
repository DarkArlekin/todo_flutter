import 'package:flutter/material.dart';

class FormInput extends TextFormField {
  FormInput({Key? key, required String initialValue, required String labelText})
      : super(
          key: key,
          decoration: InputDecoration(
              labelText: labelText,
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16)),
          initialValue: initialValue,
        );
}
