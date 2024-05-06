import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money/screens/screens.dart';

part 'scaffold_with_nav_bar.dart';

final class AppRouter {
  GoRouter get router => GoRouter(
        debugLogDiagnostics: true,
        initialLocation: _PathConstants.homePath,
        routes: [
          ShellRoute(
            builder: (context, state, child) => ScaffoldWithNavBar(
              location: state.uri.path,
              child: child,
            ),
            routes: [
              _homeRoute,
              _servicesRoute,
              _historyRoute,
            ],
          ),
        ],
      );

  GoRoute get _homeRoute => GoRoute(
      path: _PathConstants.homePath, builder: (context, state) => HomeScreen());

  GoRoute get _servicesRoute => GoRoute(
      path: _PathConstants.servicesPath,
      builder: (context, state) => const ServicesScreen());

  GoRoute get _historyRoute => GoRoute(
        path: _PathConstants.historyPath,
        builder: (context, state) => const Center(
          child: Text('history'),
        ),
      );
}

abstract final class _PathConstants {
  const _PathConstants();

  static const homePath = "/";
  static const servicesPath = "/services";
  static const historyPath = "/history";
}
