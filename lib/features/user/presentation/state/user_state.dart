

import '../../domain/entity/user_entity.dart';

class UserState {
  final bool isLoading;
  final List<UserEntity> users;
  final String? error;

  UserState({
    required this.isLoading,
    required this.users,
    this.error,
  });

  factory UserState.initial() {
    return UserState(
      isLoading: false,
      users: [],
    );
  }

  UserState copyWith({
    bool? isLoading,
    List<UserEntity>? users,
    String? error,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      error: error ?? this.error,
    );
  }
}