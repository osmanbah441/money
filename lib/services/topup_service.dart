import 'package:flutter/material.dart';
import 'package:money/components/pay_service_by_number_form.dart';

class TopupService extends StatefulWidget {
  const TopupService({super.key});

  @override
  State<TopupService> createState() => _TopupServiceState();
}

class _TopupServiceState extends State<TopupService> {
  bool _topupSwitchValue = false;

  void _toggleTopupSwitch(bool value) =>
      setState(() => _topupSwitchValue = value);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_topupSwitchValue ? 'My Number' : 'Another Number'),
              Switch(
                value: _topupSwitchValue,
                onChanged: _toggleTopupSwitch,
              ),
            ],
          ),
        ),
        PayServiceByNumberForm(
          disableNumberField: _topupSwitchValue,
          numberLabelText: 'phone number',
          onSubmit: () {},
        ),
      ],
    );
  }
}
