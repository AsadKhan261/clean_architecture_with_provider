import 'dart:async';
import 'dart:convert';

import 'package:clean_architecture_with_provider/core/services/secure_storage_service.dart';
import 'package:clean_architecture_with_provider/core/services/user_provider.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/models/user_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class AuthServices {
  final _secureStorage = SecureStorageService();

  /// This method is to check if user is logged in or not, will return null if no user found
  Future<UserModel?> checkIfUserLoggedIn() async {
    final result = await _secureStorage.read(key: 'user');
    if (result == null) {
      return null;
    } else {
      final map = jsonDecode(result);
      return UserModel.fromJson(map);
    }
  }

  Future<void> logoutUser(BuildContext context) async {
    _secureStorage.delete(key: 'user');
    context.read<UserProvider>().setLoggedInUser(null);
  }
}
