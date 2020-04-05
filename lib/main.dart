import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/data/colors.dart';
import 'locator.dart';
import 'ui/router.dart';
import 'ui/views/dialog/dialog_view_model.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final navigatorKey = GlobalKey<NavigatorState>();
    DialogViewModel dialogViewModel = locator<DialogViewModel>();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DialogViewModel>.value(
          value: dialogViewModel,
        ),
        Provider<GlobalKey<NavigatorState>>.value(
          value: navigatorKey,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Router.initial_route,
        navigatorKey: navigatorKey,
        onGenerateRoute: Router.generateRoute,
        theme: buildThemeData,
      ),
    );
  }

  ThemeData get buildThemeData {
    final baseTheme = ThemeData.light();

    return baseTheme.copyWith(
      primaryColor: MyColors.kPrimaryColor,
      accentColor: MyColors.kPrimaryColorAccent,
      brightness: Brightness.light,
    );
  }
}
