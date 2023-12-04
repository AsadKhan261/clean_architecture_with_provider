
import 'package:clean_architecture_with_provider/core/error/failures.dart';
import 'package:clean_architecture_with_provider/core/utils/constants/app_messages.dart';
import 'package:clean_architecture_with_provider/core/utils/network/network_info.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/data_sources/auth_remote_data_source.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/models/user_request_model.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/models/user_response_model.dart';
import 'package:clean_architecture_with_provider/features/authantication/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';


class LoginRepoImp extends AuthRepository {
  final NetworkInfo networkInfo;

  final AuthRemoteDataSource remoteDataSource;

  LoginRepoImp({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  Future<Either<Failure, UserModel>> loginUser(
      UserRequestModel params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }

    try {
      return Right(await remoteDataSource.loginUser(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }
}
