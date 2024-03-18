import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:local_traveler_app/locator.dart';
import 'package:local_traveler_app/model/UserModel.dart';
import 'package:local_traveler_app/repository/user_repository.dart';
import 'package:local_traveler_app/services/auth_base.dart';
import 'package:local_traveler_app/services/firestore_db_service.dart';

enum ViewState { Idle, Busy }

class MyUserModel with ChangeNotifier implements AuthBase {
  FirestoreDBService _firestoreDBService = locator<FirestoreDBService>();
  ViewState _state = ViewState.Idle;
  UserRepository _userRepository = locator<UserRepository>();
  UserModel? _user;

  UserModel? get user => _user;
  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  MyUserModel() {
    currentUser();
  }

  @override
  Future<UserModel?> currentUser() async {
    try {
      state = ViewState.Busy;
      return _user = await _userRepository.currentUser();
    } catch (e) {
      print("User_model deki currentUser da hata oldu: ${e.toString()}");
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.signInWithEmailAndPassword(email, password);
      return _user;
    } catch (e) {
      print(
          "User_model deki signin with email and password da hata oldu: ${e.toString()}");
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.Busy;
      bool result = await _userRepository.signOut();
      _user = null;
      return result;
    } catch (e) {
      print("User_model deki currentUser da hata oldu: ${e.toString()}");
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      state = ViewState.Busy;
      _user =
          await _userRepository.createUserWithEmailAndPassword(email, password);
      return _user;
    } catch (e) {
      print(
          "User_model deki create user with email and passwor da hata oldu: ${e.toString()}");
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  Future<bool> saveUserDetails(String userId, String name, String city) async {
    try {
      await _firestoreDBService.saveUserDetails(userId, name, city);
      return true;
    } catch (e) {
      print("Kullanıcı bilgileri kaydedilirken hata oluştu: $e");
      return false;
    }
  }
}
