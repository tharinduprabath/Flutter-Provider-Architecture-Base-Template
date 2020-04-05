import 'package:youtube/ui/views/base_view_model.dart';

class StartUpViewModel extends BaseViewModel {
  Future<bool> loading() async {
    await Future.delayed(Duration(seconds: 2), () {});
    return true;
  }
}
