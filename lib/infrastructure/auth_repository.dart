import 'dart:convert';

import 'package:clean_api/clean_api.dart';
import 'package:reqres/utils/strings.dart';

import '../domain/auth/login_body.dart';
import '../domain/auth/model/signup_responce.dart';
import '../domain/auth/signup_body.dart';
import '../utils/api_routes.dart';

import 'package:hive_flutter/hive_flutter.dart';

class AuthRepository {
  final api = CleanApi.instance;
  // @override
  // Future<Option<UserModel>> getUserData() {}

  @override
  Future<Either<CleanFailure, AuthResponse>> login(LoginBody body) async {
    final data = await api.post(
      fromData: (json) => AuthResponse.fromMap(json),
      endPoint: APIRoute.LOGIN,
      body: body.toMap(),
      withToken: false,
    );

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) {
      final box = Hive.box(KStrings.cacheBox);

      box.put(KStrings.token, r.token);
      box.put(KStrings.user, body.toJson());

      api.setToken({'Authorization': 'Bearer ${r.token}'});
      Logger.v("data: $data");
      return right(r);
    });
  }

  // @override
  // Future<void> logout() {}

  @override
  Future<Either<CleanFailure, AuthResponse>> signUp(SignupBody body) async {
    final data = await api.post(
      fromData: (json) => AuthResponse.fromMap(json),
      endPoint: APIRoute.SIGN_UP,
      body: body.toMap(),
      withToken: false,
    );

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']['message']);
      return left(failure);
    }, (r) {
      return right(r);
    });
  }
}
