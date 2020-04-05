import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'other_view_model.dart';

class OtherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OtherViewModel>(
      create: (_) => OtherViewModel(),
      child: Builder(
        builder: (BuildContext context) {
          final viewModel = Provider.of<OtherViewModel>(context, listen: false);
          return Center(
            child: Text("Other Page"),
          );
        },
      ),
    );
  }
}
