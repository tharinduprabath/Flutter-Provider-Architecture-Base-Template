import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'settings_view_model.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsViewModel>(
      create: (_) => SettingsViewModel(),
      child: Builder(
        builder: (BuildContext context) {
          final viewModel =
              Provider.of<SettingsViewModel>(context, listen: false);
          final navigatorKey =
              Provider.of<GlobalKey<NavigatorState>>(context, listen: false);
          return Scaffold(
            key: viewModel.scaffoldKey,
            appBar: AppBar(
              automaticallyImplyLeading: true,
              title: Text("Settings"),
            ),
            body: Center(
              child: Text("Settings"),
            ),
          );
        },
      ),
    );
  }
}
