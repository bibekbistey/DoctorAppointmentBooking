// Mocks generated by Mockito 5.4.2 from annotations
// in my_app/test/unit_test/profile_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:my_app/core/failure/failure.dart' as _i6;
import 'package:my_app/features/user/domain/entity/user_entity.dart' as _i7;
import 'package:my_app/features/user/domain/repository/user_repository.dart'
    as _i2;
import 'package:my_app/features/user/domain/use_case/user_use_case.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeIUserRepository_0 extends _i1.SmartFake
    implements _i2.IUserRepository {
  _FakeIUserRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UserUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserUseCase extends _i1.Mock implements _i4.UserUseCase {
  @override
  _i2.IUserRepository get userRepository => (super.noSuchMethod(
        Invocation.getter(#userRepository),
        returnValue: _FakeIUserRepository_0(
          this,
          Invocation.getter(#userRepository),
        ),
        returnValueForMissingStub: _FakeIUserRepository_0(
          this,
          Invocation.getter(#userRepository),
        ),
      ) as _i2.IUserRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.UserEntity>>> getAllUsers() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllUsers,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.UserEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.UserEntity>>(
          this,
          Invocation.method(
            #getAllUsers,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.UserEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.UserEntity>>(
          this,
          Invocation.method(
            #getAllUsers,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.UserEntity>>>);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.UserEntity>>> getUserInfo() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserInfo,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.UserEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.UserEntity>>(
          this,
          Invocation.method(
            #getUserInfo,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.UserEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.UserEntity>>(
          this,
          Invocation.method(
            #getUserInfo,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.UserEntity>>>);
  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> deleteUser(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteUser,
          [id],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
            _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #deleteUser,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
                _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #deleteUser,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, bool>>);
  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> editProfile(_i7.UserEntity? user) =>
      (super.noSuchMethod(
        Invocation.method(
          #editProfile,
          [user],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
            _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #editProfile,
            [user],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
                _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #editProfile,
            [user],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, bool>>);
}
