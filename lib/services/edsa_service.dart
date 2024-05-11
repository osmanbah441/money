import 'package:flutter/material.dart';
import 'package:money/components/components.dart';

class EdsaService extends StatelessWidget {
  const EdsaService({super.key});

  @override
  Widget build(BuildContext context) {
    return PayServiceByNumberForm(
      numberLabelText: 'meter number',
      validateNumber: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your meter number";
        }
        if (!(value.length == 11)) {
          return "must be extactly 11 digit";
        }
        try {
          int.parse(value);
          return null;
        } catch (e) {
          return "must be numbers";
        }
      },
      onSubmit: () {},
    );
  }
}
