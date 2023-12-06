import 'dart:async';

import 'package:clean_architecture_with_provider/core/error/failures.dart';
import 'package:clean_architecture_with_provider/core/modals/error_response_model.dart';
import 'package:clean_architecture_with_provider/core/modals/no_params.dart';
import 'package:clean_architecture_with_provider/core/utils/constants/app_messages.dart';
import 'package:clean_architecture_with_provider/core/utils/constants/app_url.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/models/user_request_model.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/models/user_response_model.dart';
import 'package:clean_architecture_with_provider/features/user_list/data/models/fake_test_api.dart';
import 'package:dio/dio.dart';

abstract class UserListRemoteDataSource {
  Future<FakeApi> userList(NoParams params);
}

class UserListRemoteDataSourceImp extends UserListRemoteDataSource {
  Dio dio;

  UserListRemoteDataSourceImp(this.dio);

  @override
  Future<FakeApi> userList(NoParams params) async {
    String url = AppUrl.baseUrl;

    try {
      final response = await dio.get(
        url,
      );

      if (response.statusCode == 200) {
        var object = FakeApi.fromJson(response.data);

        return object;
      }
      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      print('returning error');
      if (exception.type == DioErrorType.connectionTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        print(exception.response!.data);
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel(msg: exception.response!.data['message']);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }
}
