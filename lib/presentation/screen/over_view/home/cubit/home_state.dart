part of 'home_cubit.dart';

class HomeState {
  final List<ResumeEntity> listResume;
  final String error;

  HomeState({
    this.listResume = const [],
    this.error = '',
  });

  HomeState copyWith({
    List<ResumeEntity>? listResume,
    String? error,
  }) {
    return HomeState(
      listResume: listResume ?? this.listResume,
      error: error ?? this.error,
    );
  }
}
