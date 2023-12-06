import 'dart:developer';

import 'package:clean_architecture_with_provider/core/modals/no_params.dart';
import 'package:clean_architecture_with_provider/features/user_list/data/models/fake_test_api.dart';
import 'package:clean_architecture_with_provider/features/user_list/domain/use_cases/user_list_use_case.dart';
import 'package:flutter/cupertino.dart';

class UserListProvider extends ChangeNotifier {
  final UserListUseCase userListUseCase;

  UserListProvider(this.userListUseCase);

  FakeApi? fakeApi;

  ValueNotifier<bool> loadingUserList = ValueNotifier(false);

  Future<void> getUserList() async {
    loadingUserList.value = true;
    notifyListeners();

    var userListEither = await userListUseCase(NoParams());
    if (userListEither.isLeft()) {
      loadingUserList.value = false;

      notifyListeners();
    } else if (userListEither.isRight()) {
      userListEither.foldRight(null, (r, previous) {
        fakeApi = r;
      log(fakeApi!.toJson().toString());
        notifyListeners();
      });
      loadingUserList.value = false;
      notifyListeners();
    }
  }
}
