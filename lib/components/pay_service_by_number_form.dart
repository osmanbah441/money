import 'package:flutter/material.dart';
import 'package:money/components/expanded_elevated_button.dart';

class PayServiceByNumberForm extends StatefulWidget {
  const PayServiceByNumberForm({
    super.key,
    required this.numberLabelText,
    this.amountLabelText = 'amount',
    this.onSubmit,
    this.disableNumberField = false,
    this.validateNumber,
  });

  final String numberLabelText;
  final String amountLabelText;
  final VoidCallback? onSubmit;
  final bool disableNumberField;
  final String? Function(String?)? validateNumber;

  @override
  State<PayServiceByNumberForm> createState() => _PayServiceByNumberFormState();
}

class _PayServiceByNumberFormState extends State<PayServiceByNumberForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (!widget.disableNumberField)
              TextFormField(
                decoration: InputDecoration(labelText: widget.numberLabelText),
                validator: widget.validateNumber,
              ),
            TextFormField(
              decoration: InputDecoration(labelText: widget.amountLabelText),
              validator: _validateAmount,
            ),
            const SizedBox(height: 24),
            ExpandedElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (widget.onSubmit != null) widget.onSubmit!();
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(const SnackBar(
                        content: Text('form submit successfull')));
                }
              },
              label: "Submit",
            ),
          ],
        ),
      ),
    );
  }

  String? _validateAmount(String? amount) {
    if (amount == null || amount.isEmpty) return "This field is required";

    try {
      final a = int.parse(amount);
      if (a < 20) return "must be at least Le 20";
    } catch (e) {
      return "must be a number";
    }
    return null;
  }
}
