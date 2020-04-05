import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
      child: Builder(
        builder: (BuildContext context) {
          final viewModel = Provider.of<HomeViewModel>(context, listen: false);
          return ListView(
            children: <Widget>[
              ListTile(
                title: Card(
                  child: SizedBox(
                    height: 100,
                    child: Center(child: Text("Hello 1")),
                  ),
                ),
              ),
              ListTile(
                title: Card(
                  child: SizedBox(
                    height: 100,
                    child: Center(child: Text("Hello 2")),
                  ),
                ),
              ),
              ListTile(
                title: Card(
                  child: SizedBox(
                    height: 100,
                    child: Center(child: Text("Hello 3")),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
