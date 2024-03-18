import 'package:flutter/material.dart';
import 'package:local_traveler_app/locator.dart';
import 'package:local_traveler_app/model/UserModel.dart';
import 'package:local_traveler_app/repository/user_repository.dart';
import 'package:local_traveler_app/services/auth_base.dart';

enum ViewState { Idle, Busy }

class MyUserModel with ChangeNotifier implements AuthBase {
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
  Future<UserModel?> signInWithEmailAndPassword() {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.Busy;
      return await _userRepository.signOut();
    } catch (e) {
      print("User_model deki currentUser da hata oldu: ${e.toString()}");
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }
}
