import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube/ui/router.dart';
import 'package:youtube/ui/shared_widgets/drawer_button.dart';
import 'package:youtube/ui/views/dialog/dialog_view.dart';
import 'package:youtube/ui/views/home/home_view.dart';
import 'package:youtube/ui/views/other/other_view.dart';

import 'main_view_model.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainViewModel>(
      create: (_) => MainViewModel(),
      child: Builder(
        builder: (BuildContext context) {
          final viewModel = Provider.of<MainViewModel>(context);
          return Scaffold(
            key: viewModel.scaffoldKey,
            appBar: AppBar(
              title: Text(viewModel.currentPage == drawerPage.homePage
                  ? "OUR YOUTUBE"
                  : "OTHER"),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.power_settings_new),
                    onPressed: () async {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) => DialogView());
                      await Future.delayed(Duration(seconds: 2), () {});
                      Navigator.of(context).pop();
                    }),
              ],
            ),
            drawer: Drawer(
              child: ListView(
                padding: const EdgeInsets.all(0.0),
                children: <Widget>[
                  DrawerHeader(
                    child: Center(
                        child: Text(
                      "Welcome!",
                      style: TextStyle(color: Colors.white),
                    )),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  DrawerButton(
                    onPressed: () {
                      Navigator.pop(context);
                      viewModel.onPressedHome();
                    },
                    icon: Icons.home,
                    text: "HOME",
                    isSelected: viewModel.currentPage == drawerPage.homePage
                        ? true
                        : false,
                  ),
                  DrawerButton(
                    onPressed: () {
                      Navigator.pop(context);
                      viewModel.onPressedOther();
                    },
                    icon: Icons.video_library,
                    text: "OTHER",
                    isSelected: viewModel.currentPage == drawerPage.otherPage
                        ? true
                        : false,
                  ),
                  Divider(),
                  DrawerButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      Router.settings_route,
                    ),
                    icon: Icons.settings,
                    text: "SETTINGS",
                    isSelected: false,
                  ),
                  DrawerButton(
                    onPressed: viewModel.onPressedHelp,
                    icon: Icons.help_outline,
                    text: "HELP",
                    isSelected: false,
                  ),
                  DrawerButton(
                    onPressed: viewModel.onPressedShare,
                    icon: Icons.share,
                    text: "SHARE",
                    isSelected: false,
                  ),
                  DrawerButton(
                    onPressed: viewModel.onPressedAbout,
                    icon: Icons.info_outline,
                    text: "ABOUT",
                    isSelected: false,
                  ),
                ],
              ),
            ),
            body: Provider<GlobalKey<ScaffoldState>>.value(
              value: viewModel.scaffoldKey,
              child: viewModel.currentPage == drawerPage.homePage
                  ? HomeView()
                  : OtherView(),
            ),
          );
        },
      ),
    );
  }
}
