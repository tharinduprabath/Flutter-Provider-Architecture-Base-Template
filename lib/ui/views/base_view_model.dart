import 'package:flutter/foundation.dart';
import 'package:youtube/locator.dart';

import 'dialog/dialog_view_model.dart';

class BaseViewModel extends ChangeNotifier {
  DialogViewModel _dialogViewModel = locator<DialogViewModel>();

  set dialogState(DialogState value) {
    _dialogViewModel.dialogState = value;
    notifyListeners();
  }
}
