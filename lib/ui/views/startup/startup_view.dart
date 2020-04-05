import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube/ui/views/main/main_view.dart';

import 'startup_view_model.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StartUpViewModel>(
      create: (_) => StartUpViewModel(),
      child: Builder(
        builder: (BuildContext context) {
          final StartUpViewModel viewModel =
              Provider.of<StartUpViewModel>(context, listen: false);
          return Scaffold(
            body: FutureBuilder(
              future: viewModel.loading(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return MainView();
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          );
        },
      ),
    );
  }
}
