import 'package:flutter/material.dart';

class PayServiceByNumberForm extends StatelessWidget {
  const PayServiceByNumberForm(
      {super.key,
      required this.numberLabelText,
      this.amountLabelText = 'amount',
      this.onSubmit,
      this.disableNumberField = false});

  final String numberLabelText;
  final String amountLabelText;
  final VoidCallback? onSubmit;
  final bool disableNumberField;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          if (!disableNumberField)
            TextField(
              decoration: InputDecoration(labelText: numberLabelText),
            ),
          TextField(
            decoration: InputDecoration(labelText: amountLabelText),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onSubmit,
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
