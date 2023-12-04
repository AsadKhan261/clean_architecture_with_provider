import 'package:clean_architecture_with_provider/core/router/app_state.dart';
import 'package:clean_architecture_with_provider/core/router/models/page_config.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/models/user_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../utils/globals/globals.dart';
import 'auth_services.dart';

class UserProvider extends ChangeNotifier {
  final AuthServices _authServices = sl();
  UserModel? userDetails;
  Future logout(BuildContext context) async {
    _authServices.logoutUser(context);
  AppState appState=sl();
  appState.goToNext(PageConfigs.loginPageConfig);
  }

  void setLoggedInUser(UserModel? value) {
    userDetails = value;
    notifyListeners();
  }
}