import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reqres/presentation/login/login_screen.dart';

class SplashScreen extends StatefulHookConsumerWidget {
  static const routeName = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => LoginScreen(),
      //     ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () {
        context.go(LoginScreen.routeName);
        // context.pop();
        // context.go('/login');
        // Router.neglect(context, () {
        //   context.go("/login");
        // });
      });
      return null;
    }, []);

    var size = MediaQuery.of(context).size;
    Logger.v('size: $size');
    return const Scaffold(
      body: Center(child: Text("Splash Screen")),
    );
  }
}
