import 'dart:async';

import 'package:clean_architecture_with_provider/core/error/failures.dart';
import 'package:clean_architecture_with_provider/core/modals/error_response_model.dart';
import 'package:clean_architecture_with_provider/core/utils/constants/app_messages.dart';
import 'package:clean_architecture_with_provider/core/utils/constants/app_url.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/models/user_request_model.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/models/user_response_model.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> loginUser(UserRequestModel params);
}

class AuthRemoteDataSourceImp extends AuthRemoteDataSource {
  Dio dio;

  AuthRemoteDataSourceImp(this.dio);

  @override
  Future<UserModel> loginUser(UserRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.loginUrl;

    try {
      final response = await dio.post(url, data: params.toJson());

      if (response.statusCode == 200) {
        var object = UserModel.fromJson(response.data);

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
