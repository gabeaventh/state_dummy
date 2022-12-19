part of 'json_bloc_bloc.dart';

@immutable
abstract class JsonBlocState {}

class JsonBlocInitial extends JsonBlocState {}

class JsonBlocLoading extends JsonBlocState {}

class JsonBlocError extends JsonBlocState {
  final String message;
  final int code;

  JsonBlocError({
    required this.message,
    required this.code,
  });
}

class JsonBlocLoaded extends JsonBlocState {
  final JsonList json;

  JsonBlocLoaded({
    required this.json,
  });
}
