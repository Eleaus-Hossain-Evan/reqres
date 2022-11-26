// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignupBody extends Equatable {
  final String email;
  final String password;

  const SignupBody({
    required this.email,
    required this.password,
  });

  SignupBody copyWith({
    String? email,
    String? password,
  }) {
    return SignupBody(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory SignupBody.fromMap(Map<String, dynamic> map) {
    return SignupBody(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [email, password];

  String toJson() => json.encode(toMap());

  factory SignupBody.fromJson(String source) =>
      SignupBody.fromMap(json.decode(source));

  @override
  String toString() => 'SignupBody(email: $email, password: $password)';
}
