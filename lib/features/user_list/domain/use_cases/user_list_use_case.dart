import 'package:clean_architecture_with_provider/core/error/failures.dart';
import 'package:clean_architecture_with_provider/features/user_list/data/models/fake_test_api.dart';
import 'package:clean_architecture_with_provider/core/modals/no_params.dart';
import 'package:clean_architecture_with_provider/core/usecases/usecase.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/models/user_request_model.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/models/user_response_model.dart';
import 'package:clean_architecture_with_provider/features/authantication/domain/repositories/auth_repo.dart';
import 'package:clean_architecture_with_provider/features/user_list/domain/repositories/user_list_repository.dart';
import 'package:dartz/dartz.dart';

class UserListUseCase extends UseCase<FakeApi, NoParams> {
  UserListRepository repository;

  UserListUseCase(this.repository);

  @override
  Future<Either<Failure, FakeApi>> call(NoParams params) {
    return repository.userList(NoParams());
  }
}
