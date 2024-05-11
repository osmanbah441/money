import 'package:flutter/material.dart';
import 'package:money/components/components.dart';

class DataBundleService extends StatefulWidget {
  const DataBundleService({super.key});

  @override
  State<DataBundleService> createState() => _DataBundleServiceState();
}

class _DataBundleServiceState extends State<DataBundleService> {
  bool _topupSwitchValue = false;

  void _toggleTopupSwitch(bool value) =>
      setState(() => _topupSwitchValue = value);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubscriptionOptionsSelector(
          subscriptionOptions: const {
            SubscriptionType.daily: [
              '15MB = Le 0.41',
              '70MB = Le 1.60',
              '260MB = Le 5.72',
            ],
            SubscriptionType.weekly: [
              '115MB = Le 2.50',
              '600MB = Le 12.50',
              '1240MB = Le 24.80',
            ],
            SubscriptionType.monthly: [
              '2.6GB = Le 52.00',
              '7GB = Le 140',
              '10GB = Le 200',
              '20GB = Le 400'
            ],
          },
          onChanged: (String selectedOption) {
            print('Selected option: $selectedOption');
          },
        ),
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
          onSubmit: () {},
          numberLabelText: 'phone number',
        ),
      ],
    );
  }
}

enum SubscriptionType { daily, weekly, monthly }

class SubscriptionOptionsSelector extends StatefulWidget {
  final Map<SubscriptionType, List<String>> subscriptionOptions;
  final ValueChanged<String> onChanged;

  const SubscriptionOptionsSelector({
    super.key,
    required this.subscriptionOptions,
    required this.onChanged,
  });

  @override
  State<StatefulWidget> createState() => _SubscriptionOptionsSelectorState();
}

class _SubscriptionOptionsSelectorState
    extends State<SubscriptionOptionsSelector> {
  late SubscriptionType selectedSubscriptionType;
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    selectedSubscriptionType = widget.subscriptionOptions.keys.first;
    selectedOption =
        widget.subscriptionOptions[selectedSubscriptionType]!.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DropdownButtonChip<SubscriptionType>(
          value: selectedSubscriptionType,
          onChanged: (SubscriptionType? newValue) {
            setState(() {
              selectedSubscriptionType = newValue!;
              selectedOption =
                  widget.subscriptionOptions[selectedSubscriptionType]!.first;
              widget.onChanged(selectedOption);
            });
          },
          items: widget.subscriptionOptions.keys.toList(),
          itemText: (SubscriptionType subscriptionType) {
            return subscriptionType.toString().split('.').last;
          },
        ),
        const SizedBox(width: 20),
        DropdownButtonChip<String>(
          value: selectedOption,
          onChanged: (String? newValue) {
            setState(() {
              selectedOption = newValue!;
              widget.onChanged(selectedOption);
            });
          },
          items: widget.subscriptionOptions[selectedSubscriptionType]!,
          itemText: (String option) => option,
        ),
      ],
    );
  }
}
