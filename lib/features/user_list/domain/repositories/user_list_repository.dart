import 'package:clean_architecture_with_provider/core/error/failures.dart';
import 'package:clean_architecture_with_provider/features/user_list/data/models/fake_test_api.dart';
import 'package:clean_architecture_with_provider/core/modals/no_params.dart';
import 'package:dartz/dartz.dart';

abstract class UserListRepository {
  Future<Either<Failure, FakeApi>> userList(NoParams params);
}