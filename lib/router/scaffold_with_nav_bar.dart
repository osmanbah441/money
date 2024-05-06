part of 'routes.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    super.key,
    required this.location,
    required this.child,
  });

  final String location;

  final Widget child;

  int get _calculateCurrentIndex {
    if (location == _PathConstants.servicesPath) return 1;
    if (location == _PathConstants.historyPath) return 2;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    if (index == 1) return context.go(_PathConstants.servicesPath);
    if (index == 2) return context.go(_PathConstants.historyPath);
    return context.go(_PathConstants.homePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Money'),
        actions: [
          IconButton(onPressed: null, icon: CircleAvatar()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _onItemTapped(context, index),
        currentIndex: _calculateCurrentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'services'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'history'),
        ],
      ),
      body: child,
    );
  }
}
