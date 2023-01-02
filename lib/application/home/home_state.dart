import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../domain/auth/model/user_model.dart';
import '../../domain/home/home_response.dart';
import '../../utils/network_util/network_handler.dart';

class HomeState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final List<UserModel> users;

  const HomeState({
    required this.loading,
    required this.failure,
    required this.users,
  });

  factory HomeState.init() => HomeState(
        loading: false,
        failure: CleanFailure.none(),
        users: const [],
      );

  HomeState copyWith({
    bool? loading,
    CleanFailure? failure,
    List<UserModel>? users,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      users: users ?? this.users,
    );
  }

  @override
  String toString() =>
      'HomeState(loading: $loading, failure: $failure, users: $users)';

  @override
  List<Object> get props => [loading, failure, users];
}
