import 'package:flutter/material.dart';

class ExpandedElevatedButton extends StatelessWidget {
  const ExpandedElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.iconSize = 24.0,
    this.backgroundColor,
    this.shape = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
    this.minimumSize = const Size(150.0, 48.0), // Minimum button dimensions
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.textStyle,
  });

  final VoidCallback onPressed;
  final String label;
  final IconData? icon; // Optional icon
  final double iconSize;
  final Color? backgroundColor;
  final RoundedRectangleBorder shape;
  final Size minimumSize;
  final EdgeInsets padding;
  final TextStyle? textStyle; // Optional custom text style

  @override
  Widget build(BuildContext context) {
    final text = Text(
      label,
      style: textStyle ?? Theme.of(context).textTheme.labelLarge,
    );

    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      shape: shape,
      minimumSize: minimumSize,
      padding: padding,
    );

    return (icon == null)
        ? ElevatedButton(
            onPressed: onPressed,
            style: buttonStyle,
            child: text,
          )
        : ElevatedButton.icon(
            onPressed: onPressed,
            icon: Icon(icon, size: iconSize),
            label: text,
            style: buttonStyle,
          );
  }
}
