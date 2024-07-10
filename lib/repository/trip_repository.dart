import 'package:local_traveler_app/locator.dart';
import 'package:local_traveler_app/model/UserModel.dart';
import 'package:local_traveler_app/model/trip_model.dart';
import 'package:local_traveler_app/services/firestore_db_service.dart';
import 'package:local_traveler_app/services/trip_base.dart';

class TripRepository implements TripBase {
  FirestoreDBService _firestoreDBService = locator<FirestoreDBService>();

  @override
  Future<bool> createTrip(UserModel user, String? city, String? date,
      int? budget, int? spentDay) async {
    try {
      bool tripCreated = await _firestoreDBService.createTrip(
          user, city, date, budget, spentDay);
      return tripCreated;
    } catch (e) {
      print("Trip oluşturulurken bir hata oluştu: $e");
      return false;
    }
  }

  @override
  Future<TripModel?> readTrip(String userId, String tripId) async {
    try {
      TripModel? trip = await _firestoreDBService.readTrip(userId, tripId);
      return trip;
    } catch (e) {
      print("Trip okunurken bir hata oluştu: $e");
      return null;
    }
  }
}
