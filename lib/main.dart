import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reqres/utils/network_util/network_handler.dart';

import 'application/global.dart';
import 'route/go_router.dart';
import 'theme/theme.dart';
import 'utils/api_routes.dart';
import 'utils/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.init(
    kDebugMode, // isEnable ，if production ，please false
    isShowFile: false, // In the IDE, whether the file name is displayed
    isShowTime: false, // In the IDE, whether the time is displayed
  );

  await Hive.initFlutter();
  final box = await Hive.openBox(KStrings.cacheBox);

  final api = NetworkHandler.instance;

  api.setup(baseUrl: APIRoute.BASE_URL, showLogs: false);
  // api.enableCache(box);

  api.setToken(box.get(KStrings.token, defaultValue: ''));

  // ignore: no_leading_underscores_for_local_identifiers
  final _databaseService = DatabaseService();
  await _databaseService.initTheme();

  runApp(
    ProviderScope(
      overrides: [
        databaseService.overrideWithValue(_databaseService),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeProvider).theme;
    final router = ref.watch(routerProvider);
    return ScreenUtilInit(
      designSize: const Size(411.4, 843.4),
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp.router(
            title: KStrings.appName,
            debugShowCheckedModeBanner: false,
            themeMode: mode.isEmpty
                ? ThemeMode.system
                : mode == "dark"
                    ? ThemeMode.dark
                    : ThemeMode.light,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            scaffoldMessengerKey: ref.watch(scaffoldKeyProvider),
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,

            scrollBehavior: const ScrollBehavior().copyWith(
              physics: const BouncingScrollPhysics(),
            ),
            // home: child,
            builder: BotToastInit(),
          ),
        );
      },
    );
  }
}
