part of 'data_cubit.dart';

@immutable
sealed class DataState {}

final class DataLoading extends DataState {}

final class DataLoaded extends DataState {
  final List<Student> students;
  DataLoaded(this.students);
}

final class DataError extends DataState {
  final String error;
  DataError(this.error);
}
