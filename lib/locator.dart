import 'package:get_it/get_it.dart';
import 'package:local_traveler_app/repository/user_repository.dart';
import 'package:local_traveler_app/services/firebase_auth_service.dart';
import 'package:local_traveler_app/services/firestore_db_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FirestoreDBService());
  locator.registerLazySingleton(() => UserRepository());
}
