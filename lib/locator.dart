import 'package:get_it/get_it.dart';

import 'core/services/firestore_service.dart';
import 'ui/views/dialog/dialog_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DialogViewModel());
  locator.registerLazySingleton(() => FirestoreService());
}
