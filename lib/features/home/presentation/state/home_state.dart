

import '../../domain/entity/home_entity.dart';

class HomeState {
  final bool isLoading;
  final List<HomeEntity> doctors;
  final String? error;

  HomeState({
    required this.isLoading,
    required this.doctors,
    this.error,
  });

  factory HomeState.initial() {
    return HomeState(
      isLoading: false,
      doctors: [],
    );
  }

  HomeState copyWith({
    bool? isLoading,
    List<HomeEntity>? doctors,
    String? error,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      doctors: doctors ?? this.doctors,
      error: error ?? this.error,
    );
  }
}