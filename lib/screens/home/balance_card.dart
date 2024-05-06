part of 'home_screen.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
    this.balance = 0.0,
    this.currency = 'Le ',
  });

  final double balance;
  final String currency;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Account Balance',
                style: textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              Text(
                NumberFormat.currency(decimalDigits: 2, symbol: currency)
                    .format(balance),
                style: textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
