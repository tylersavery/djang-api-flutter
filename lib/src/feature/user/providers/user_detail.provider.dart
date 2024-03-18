import 'package:dj_flutter_app/src/core/models/api_error.model.dart';
import 'package:dj_flutter_app/src/feature/user/models/user.model.dart';
import 'package:dj_flutter_app/src/feature/user/services/user.service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_detail.provider.g.dart';

@riverpod
Future<Either<ApiError, User>> userDetail(UserDetailRef ref, String userUuid) async {
  final result = await UserService().retrieve(userUuid);
  return result.fold((error) => left(error), (user) => right(user));
}
