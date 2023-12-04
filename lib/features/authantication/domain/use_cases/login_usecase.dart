import 'package:clean_architecture_with_provider/core/error/failures.dart';
import 'package:clean_architecture_with_provider/core/usecases/usecase.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/models/user_request_model.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/models/user_response_model.dart';
import 'package:clean_architecture_with_provider/features/authantication/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase extends UseCase<UserModel, UserRequestModel> {
  AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, UserModel>> call(UserRequestModel params) {
    return repository.loginUser(params);
  }
}
