import 'package:flutter/material.dart';
import 'package:money/screens/services/data_bundle_service.dart';
import 'package:money/screens/services/edsa_service.dart';
import 'package:money/screens/services/topup_service.dart';

enum ServiceType {
  edsa(Icon(Icons.power), EdsaService()),
  topUp(Icon(Icons.phone_callback), TopupService()),
  dataDundle(Icon(Icons.signal_cellular_alt), DataBundleService());

  const ServiceType(this.icon, this.service);

  final Widget icon;
  final Widget service;

  String get name => switch (this) {
        ServiceType.edsa => 'EDSA',
        ServiceType.topUp => 'Top Up',
        ServiceType.dataDundle => 'Data Bundle',
      };
}

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  ServiceType? _selectedService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            DropdownMenu(
              leadingIcon: _selectedService?.icon,
              onSelected: (value) => setState(() => _selectedService = value),
              hintText: 'Choose Service',
              expandedInsets: const EdgeInsets.all(24),
              dropdownMenuEntries: ServiceType.values
                  .map((e) => DropdownMenuEntry(
                        value: e,
                        label: e.name,
                        leadingIcon: e.icon,
                      ))
                  .toList(),
            ),
            if (_selectedService != null) const SizedBox(height: 24),
            if (_selectedService != null)
              Expanded(child: _selectedService!.service),
          ],
        ),
      ),
    );
  }
}
