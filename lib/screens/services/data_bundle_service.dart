import 'package:flutter/material.dart';
import 'package:money/components/components.dart';

class DataBundleService extends StatelessWidget {
  const DataBundleService({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubscriptionOptionsSelector(
          subscriptionOptions: const {
            SubscriptionType.daily: ['Option 1', 'Option 2', 'Option 3'],
            SubscriptionType.weekly: ['Option A', 'Option B', 'Option C'],
            SubscriptionType.monthly: ['Option X', 'Option Y', 'Option Z'],
          },
          onChanged: (String selectedOption) {
            print('Selected option: $selectedOption');
          },
        ),
        PayServiceByNumberForm(
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

  SubscriptionOptionsSelector({
    required this.subscriptionOptions,
    required this.onChanged,
  });

  @override
  _SubscriptionOptionsSelectorState createState() =>
      _SubscriptionOptionsSelectorState();
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
        SizedBox(width: 20),
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
