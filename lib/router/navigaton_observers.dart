import 'package:flutter/material.dart';

final class BasicObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    print('pushing route from prev to new');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    print('poping');
  }
}
