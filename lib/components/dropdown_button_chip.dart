import 'package:flutter/material.dart';

class DropdownButtonChip<T> extends StatelessWidget {
  const DropdownButtonChip({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
    required this.itemText,
    this.color = const Color.fromRGBO(224, 224, 224, 1),
  });

  final T value;
  final ValueChanged<T?>? onChanged;
  final List<T> items;
  final String Function(T) itemText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          onChanged: onChanged,
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(itemText(item)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
