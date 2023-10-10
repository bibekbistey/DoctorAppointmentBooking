// class AuthState {
//   final bool isLoading;
//   final String? error;
//   final bool isAdmin;
  

//   AuthState({
//     required this.isLoading,
//     this.error,
//     required this.isAdmin
    
//   });

//   factory AuthState.initial() {
//     return AuthState(
//       isLoading: false,
//       error: null,
//       isAdmin: false,
      
//     );
//   }

//   AuthState copyWith({
//     bool? isLoading,
//     String? error,
//     bool? isAdmin,
    
//   }) {
//     return AuthState(
//       isLoading: isLoading ?? this.isLoading,
//       error: error ?? this.error,
//       isAdmin: isAdmin ?? this.isAdmin,
      
//     );
//   }

//   @override
//   String toString() => 'AuthState(isLoading: $isLoading, error: $error, isAdmin: $isAdmin)';
// }



enum UserRole {
  user,
  admin,
}

class AuthState {
  final bool isLoading;
  final String? error;
  final UserRole userRole;

  AuthState({
    required this.isLoading,
    this.error,
    required this.userRole,
  });

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      error: null,
      userRole: UserRole.user, // Default to user role when initialized
    );
  }

  AuthState copyWith({
    bool? isLoading,
    String? error,
    UserRole? userRole,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      userRole: userRole ?? this.userRole,
    );
  }

  @override
  String toString() =>
      'AuthState(isLoading: $isLoading, error: $error, userRole: $userRole)';
}
