import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dialog_view_model.dart';

class DialogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<DialogViewModel, DialogState>(
      selector: (_, dialogViewModel) => dialogViewModel.dialogState,
      builder: (_, state, __) => WillPopScope(
        onWillPop: state == DialogState.waiting ? () {} : null,
        child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            content: AnimatedCrossFade(
              duration: Duration(milliseconds: 200),
              crossFadeState: state == DialogState.waiting
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                      width: 50,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text("Please wait"),
                  )
                ],
              ),
              secondChild: state == DialogState.success
                  ? Icon(
                      Icons.check,
                      color: Colors.green,
                    )
                  : Icon(
                      Icons.error_outline,
                      color: Colors.red,
                    ),
            )),
      ),
    );
  }
}
