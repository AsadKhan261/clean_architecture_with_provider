import 'dart:convert';

import 'package:clean_architecture_with_provider/core/error/failures.dart';
import 'package:clean_architecture_with_provider/core/router/app_state.dart';
import 'package:clean_architecture_with_provider/core/router/models/page_config.dart';
import 'package:clean_architecture_with_provider/core/services/secure_storage_service.dart';
import 'package:clean_architecture_with_provider/core/services/user_provider.dart';
import 'package:clean_architecture_with_provider/core/utils/enums/page_state_enum.dart';
import 'package:clean_architecture_with_provider/core/utils/globals/globals.dart';
import 'package:clean_architecture_with_provider/core/utils/globals/snack_bar.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/models/user_request_model.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/models/user_response_model.dart';
import 'package:clean_architecture_with_provider/features/authantication/domain/use_cases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider(this.loginUseCase);

  final LoginUseCase loginUseCase;

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  UserModel? userModel;
  UserProvider userProvider = sl();
  SecureStorageService? secureStorageService;

  ValueNotifier<bool> loginLoading = ValueNotifier(false);

  //Login Function
  Future<void> login() async {
    loginLoading.value = true;
    notifyListeners();

    var params = UserRequestModel(
        email: loginEmailController.text,
        password: loginPasswordController.text);
    var loginEither = await loginUseCase(params);
    if (loginEither.isLeft()) {
      handleError(loginEither);
      loginLoading.value = false;

      notifyListeners();
    } else if (loginEither.isRight()) {
      loginEither.foldRight(null, (r, previous) {
        userModel = r;
        userProvider.setLoggedInUser(userModel);
        secureStorageService!.write(key: 'user', value: jsonEncode(userModel));
        notifyListeners();
        loginEmailController.clear();
        loginPasswordController.clear();
        ShowSnackBar.show('Done');
        // AppState appState = sl();
        // appState.goToNext(PageConfigs.loginPageConfig,
        //     pageState: PageState.replaceAll);
        // Logger().v(loginResponseModel);
      });
      loginLoading.value = false;
      notifyListeners();
    }
  }

  // Error Handling
  void handleError(Either<Failure, dynamic> either) {
    either.fold((l) => ShowSnackBar.show(l.message), (r) => null);
  }
}
