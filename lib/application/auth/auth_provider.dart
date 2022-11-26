// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reqres/utils/strings.dart';

import '../../domain/auth/login_body.dart';
import '../../domain/auth/model/user_model.dart';
import '../../domain/auth/signup_body.dart';
import '../../infrastructure/auth_repository.dart';
import '../global.dart';
import 'auth_state.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(AuthRepository(), ref);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository repo;
  final Ref _ref;

  AuthNotifier(this.repo, this._ref) : super(AuthState.init());

  void setUser(UserModel user) {
    state = state.copyWith(user: user);
  }

  Future<void> signUp(SignupBody body) async {
    state = state.copyWith(loading: true);

    final res = await repo.signUp(body);

    state = res.fold(
      (l) {
        showNotification(title: l.error);

        return state.copyWith(failure: l, loading: false);
      },
      (r) {
        return state.copyWith(loading: false);
      },
    );
  }

  Future<void> login(LoginBody body) async {
    state = state.copyWith(loading: true);

    final result = await repo.login(body);

    state = result.fold(
      (l) {
        showNotification(title: l.error);
        return state = state.copyWith(failure: l, loading: false);
      },
      (r) {
        _ref.read(loggedInProvider.notifier).saveCache(r.token, body);
        return state.copyWith(loading: false);
      },
    );
  }

  void logout() {
    state = state.copyWith(user: UserModel.init());

    _ref.read(loggedInProvider.notifier).deleteCache();
    // _ref.read(loggedInProvider.notifier).isLoggedIn();

    _ref.watch(snackBarProvider('${state.user.first_name} logging out'));
  }
}

final loggedInProvider = ChangeNotifierProvider<LoggedInNotifier>((ref) {
  return LoggedInNotifier(ref);
});

class LoggedInNotifier extends ChangeNotifier {
  final Ref _ref;
  LoggedInNotifier(this._ref);

  bool _loggedIn = true;

  void deleteCache() {
    Hive.box(KStrings.cacheBox).delete(KStrings.token);
    Hive.box(KStrings.cacheBox).delete(KStrings.user);
    notifyListeners();
  }

  void saveCache(String token, LoginBody user) {
    final box = Hive.box(KStrings.cacheBox);
    box.put(KStrings.token, token);
    box.put(KStrings.user, user.toJson());
    notifyListeners();
  }

  void saveUser(LoginBody user) {
    final box = Hive.box(KStrings.cacheBox);
    box.put(KStrings.user, user.toJson());
  }

  String get token {
    return Hive.box(KStrings.cacheBox).get(KStrings.token, defaultValue: '');
  }

  LoginBody get user {
    final user = Hive.box(KStrings.cacheBox).get(KStrings.user);
    return user != null ? LoginBody.fromJson(user) : LoginBody.init();
  }

  bool get loggedIn => _loggedIn;

  void isLoggedIn() {
    // final String? token = Hive.box(CACHE_BOX).get(TOKEN);
    // final String? user = Hive.box(CACHE_BOX).get(USER);

    _loggedIn = token.isEmpty && user == LoginBody.init() ? false : true;
    notifyListeners();
  }
}
