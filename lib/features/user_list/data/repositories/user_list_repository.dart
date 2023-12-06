import 'package:clean_architecture_with_provider/core/error/failures.dart';
import 'package:clean_architecture_with_provider/core/modals/no_params.dart';
import 'package:clean_architecture_with_provider/core/utils/constants/app_messages.dart';
import 'package:clean_architecture_with_provider/core/utils/network/network_info.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/data_sources/auth_remote_data_source.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/models/user_request_model.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/models/user_response_model.dart';
import 'package:clean_architecture_with_provider/features/authantication/domain/repositories/auth_repo.dart';
import 'package:clean_architecture_with_provider/features/user_list/data/data_sources/user_list_remote_data_source.dart';
import 'package:clean_architecture_with_provider/features/user_list/data/models/fake_test_api.dart';
import 'package:clean_architecture_with_provider/features/user_list/domain/repositories/user_list_repository.dart';
import 'package:dartz/dartz.dart';

class UserListImplementation extends UserListRepository {
  final NetworkInfo networkInfo;

  final UserListRemoteDataSource remoteDataSource;

  UserListImplementation({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, FakeApi>> userList(NoParams params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }

    try {
      return Right(await remoteDataSource.userList(NoParams()));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }
}
