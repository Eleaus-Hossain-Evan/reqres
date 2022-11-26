// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:clean_api/clean_api.dart';
import 'package:equatable/equatable.dart';

import '../../domain/auth/model/user_model.dart';

class AuthState extends Equatable {
  final UserModel user;
  final bool loading;
  final CleanFailure failure;
  final String language;

  const AuthState({
    required this.user,
    required this.loading,
    required this.failure,
    required this.language,
  });

  factory AuthState.init() => AuthState(
        user: UserModel.init(),
        loading: false,
        failure: CleanFailure.none(),
        language: 'en',
      );

  AuthState copyWith({
    UserModel? user,
    bool? loading,
    CleanFailure? failure,
    String? language,
  }) {
    return AuthState(
      user: user ?? this.user,
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      language: language ?? this.language,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [user, loading, failure, language];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'loading': loading,
      'failure': failure,
      'language': language,
    };
  }

  factory AuthState.fromMap(Map<String, dynamic> map) {
    return AuthState(
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
      loading: (map['loading'] ?? false) as bool,
      failure: map['failure'] ?? '',
      language: (map['language'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthState.fromJson(String source) =>
      AuthState.fromMap(json.decode(source) as Map<String, dynamic>);
}
