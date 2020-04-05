import 'package:flutter/material.dart';
import 'package:youtube/ui/views/settings/settings_view.dart';

import 'views/startup/startup_view.dart';

class Router {
  static const initial_route = '/';
  static const settings_route = '/settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map<String, dynamic> args = settings.arguments;
    switch (settings.name) {
      case initial_route:
        return MaterialPageRoute(builder: (_) => StartUpView());
      case settings_route:
        return MaterialPageRoute(builder: (_) => SettingsView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
