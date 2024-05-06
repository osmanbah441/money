import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:money/components/components.dart';

part 'balance_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BalanceCard(
            balance: 10000000000,
          ),
          _MoneyButtonsRow(onSendMoneyPressed: () {
            print('onSendMoneyPressed');
          }, onCashMoneyPressed: () {
            print('onCashMoneyPressed');
          })
        ],
      ),
    );
  }
}

class _MoneyButtonsRow extends StatelessWidget {
  const _MoneyButtonsRow({
    required this.onSendMoneyPressed,
    required this.onCashMoneyPressed,
    this.sendMoneyText = 'Send Money',
    this.cashMoneyText = 'Cash Money',
    this.iconSize = 24.0,
    this.buttonPadding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.minimumButtonWidth = 150.0,
    this.buttonShape = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))),
  });

  final VoidCallback onSendMoneyPressed;
  final VoidCallback onCashMoneyPressed;

  final String sendMoneyText;
  final String cashMoneyText;
  final double iconSize;
  final EdgeInsets buttonPadding;
  final double minimumButtonWidth;
  final RoundedRectangleBorder buttonShape;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ExpandedElevatedButton(
          onPressed: onSendMoneyPressed,
          label: sendMoneyText,
          iconSize: iconSize,
          icon: Icons.arrow_upward_sharp,
          minimumSize: Size(minimumButtonWidth, 48),
          shape: buttonShape,
          padding: buttonPadding,
        ),
        ExpandedElevatedButton(
          onPressed: onSendMoneyPressed,
          label: sendMoneyText,
          iconSize: iconSize,
          icon: Icons.arrow_upward_sharp,
          minimumSize: Size(minimumButtonWidth, 48),
          shape: buttonShape,
          padding: buttonPadding,
        ),
      ],
    );
  }
}
