import 'package:flutter/material.dart';
import 'package:money/components/components.dart';

class EdsaService extends StatelessWidget {
  const EdsaService({super.key});

  @override
  Widget build(BuildContext context) {
    return PayServiceByNumberForm(
      numberLabelText: 'meter number',
      onSubmit: () {},
    );
  }
}
