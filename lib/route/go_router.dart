import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reqres/presentation/details/deatils_screen.dart';
import 'package:reqres/presentation/home/home_screen.dart';
import 'package:reqres/presentation/splash/splash_screen.dart';

import '../application/auth/auth_provider.dart';
import '../domain/auth/model/user_model.dart';
import '../presentation/login/login_screen.dart';
import '../presentation/signup/signup_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: router,
    redirect: router._redirectLogic,
    routes: router._routes,
    initialLocation: '/',
    errorPageBuilder: router._errorPageBuilder,
    observers: [BotToastNavigatorObserver()],
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<bool>(
      loggedInProvider.select((value) => value.loggedIn),
      (_, __) => Future.microtask(() => notifyListeners()),
    );
  }

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    final token = _ref.watch(loggedInProvider).token;
    final user = _ref.watch(loggedInProvider).user;

    // final areWeLoggingIn = state.location == '/login';
    // final areWeRegistering = state.location == '/signup';

    // if (user.token.isEmpty && areWeLoggingIn) {
    //   return areWeLoggingIn ? null : '/login';
    // }
    // if (user.token.isEmpty && areWeRegistering) {
    //   return areWeRegistering ? null : '/signup';
    // }

    // if (areWeLoggingIn) return '/main_nav';

    // _ref.read(loggedInProvider.notifier).isLoggedIn();
    // final loggedin = _ref.watch(loggedInProvider.notifier).loggedIn;

    Logger.i('RouterNotifier: $user = $token');

    bool isUserIn() => token.isNotEmpty && user != UserModel.init();

    final areWeLoggingIn = state.location == LoginScreen.routeName;
    final areWeRegistering = state.location == SignupScreen.routeName;

    if (!isUserIn() && areWeLoggingIn) {
      return areWeLoggingIn ? null : LoginScreen.routeName;
    }
    if (!isUserIn() && areWeRegistering) {
      return areWeRegistering ? null : SignupScreen.routeName;
    }

    if (areWeLoggingIn || areWeRegistering) return HomeScreen.routeName;

    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: SplashScreen.routeName,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: LoginScreen.routeName,
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: SignupScreen.routeName,
          builder: (context, state) => SignupScreen(),
        ),
        GoRoute(
          path: HomeScreen.routeName,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: "${DetailScreen.routeName}/:id",
          builder: (context, state) => DetailScreen(
            id: int.parse(state.params['id']!),
          ),
        ),
      ];
  Page<void> _errorPageBuilder(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          // backgroundColor: Theme.of(context).errorColor.withOpacity(.1),
          body: Center(
            child: Text('Error: ${state.error.toString()}'),
          ),
        ),
      );
}
