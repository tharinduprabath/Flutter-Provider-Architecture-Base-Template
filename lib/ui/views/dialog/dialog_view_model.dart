import 'package:flutter/foundation.dart';

enum DialogState {
  waiting,
  error,
  success,
}

class DialogViewModel extends ChangeNotifier {

  DialogState _dialogState = DialogState.waiting;

  DialogState get dialogState => _dialogState;

  set dialogState(value) {
    _dialogState = value;
    notifyListeners();
  }
}
