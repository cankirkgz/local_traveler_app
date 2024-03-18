import 'package:flutter/material.dart';
import 'package:local_traveler_app/locator.dart';
import 'package:local_traveler_app/model/UserModel.dart';
import 'package:local_traveler_app/model/trip_model.dart';
import 'package:local_traveler_app/repository/trip_repository.dart';
import 'package:local_traveler_app/services/firestore_db_service.dart';
import 'package:local_traveler_app/services/trip_base.dart';

enum ViewState { Idle, Busy }

class MyTripModel with ChangeNotifier implements TripBase {
  FirestoreDBService _firestoreDBService = locator<FirestoreDBService>();
  ViewState _state = ViewState.Idle;
  TripRepository _tripRepository = locator<TripRepository>();

  TripModel? _trip;

  TripModel? get trip => _trip;

  ViewState get state => _state;
  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  @override
  Future<bool> createTrip(UserModel? user, String? city, String? date,
      int? budget, int? spentDay) async {
    try {
      state = ViewState.Busy;
      return await _tripRepository.createTrip(
          user!, city, date, budget, spentDay);
    } catch (e) {
      print("mytripmodel deki create trip da hata oldu: ${e.toString()}");
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<TripModel?> readTrip(String userId, String tripId) async {
    try {
      state = ViewState.Busy;
      _trip = await _firestoreDBService.readTrip(userId, tripId);
      return _trip;
    } catch (e) {
      print(
          "mytripmodel deki readTrip fonksiyonunda hata oluştu: ${e.toString()}");
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }
}
