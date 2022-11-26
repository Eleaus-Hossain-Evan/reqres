//** THEME CONTROLLER */
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeProvider = ChangeNotifierProvider<ThemeController>((ref) {
  final database = ref.watch(databaseService);

  return ThemeController(database);
});

class ThemeController with ChangeNotifier {
  ThemeController(this._database);

  late final DatabaseService _database;

  String get theme => _database.savedTheme;

  void toggle(bool mode) {
    (mode)
        ? _database.toggleSaveTheme("dark")
        : _database.toggleSaveTheme("light");

    notifyListeners();
  }
}

//** DATABASE CLASS */
final databaseService = Provider<DatabaseService>((_) => DatabaseService());

class DatabaseService {
  late final Box<String> themeBox;

  String get savedTheme => themeBox.values.first;

  Future<void> initTheme() async {
    await Hive.openBox<String>('theme').then((value) => themeBox = value);

    //first time loading
    if (themeBox.values.isEmpty) {
      themeBox.add('light');
    }
  }

  Future<void> toggleSaveTheme(String mode) async =>
      await themeBox.put(0, mode);
}

class MyTheme {
  static final lightTheme = FlexThemeData.light(
    scheme: FlexScheme.flutterDash,
    surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
    blendLevel: 20,
    tertiary: const Color(0xff3d6657).withAlpha(180),
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      elevatedButtonRadius: 8.0,
      outlinedButtonRadius: 8.0,
      elevatedButtonSchemeColor: SchemeColor.onInverseSurface,
      elevatedButtonSecondarySchemeColor: SchemeColor.primary,
      outlinedButtonOutlineSchemeColor: SchemeColor.primary,
      inputDecoratorIsFilled: false,
      inputDecoratorRadius: 12.0,
      inputDecoratorUnfocusedBorderIsColored: false,
      navigationBarBackgroundSchemeColor: SchemeColor.inversePrimary,
      appBarCenterTitle: true,
      appBarBackgroundSchemeColor: SchemeColor.inversePrimary,
    ),
    useMaterial3ErrorColors: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    // To use the playground font, add GoogleFonts package and uncomment
    fontFamily: 'baiJamjuree',
  );

  static final darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.flutterDash,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 15,
    appBarOpacity: 0.90,
    swapColors: true,
    tertiary: const Color(0xff3d6657).withAlpha(180),
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 30,
      elevatedButtonRadius: 8.0,
      outlinedButtonRadius: 8.0,
      elevatedButtonSchemeColor: SchemeColor.onInverseSurface,
      elevatedButtonSecondarySchemeColor: SchemeColor.primary,
      outlinedButtonOutlineSchemeColor: SchemeColor.primary,
      inputDecoratorIsFilled: false,
      inputDecoratorRadius: 12.0,
      inputDecoratorUnfocusedBorderIsColored: false,
      navigationBarBackgroundSchemeColor: SchemeColor.inversePrimary,
      appBarCenterTitle: true,
      appBarBackgroundSchemeColor: SchemeColor.inversePrimary,
      dialogBackgroundSchemeColor: SchemeColor.inversePrimary,
      bottomNavigationBarElevation: 3,
    ),
    useMaterial3ErrorColors: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    // To use the playground font, add GoogleFonts package and uncomment
    fontFamily: 'baiJamjuree',
  );
// // If you do not have a themeMode switch, uncomment this line
// // to let the device system mode control the theme mode:
// // themeMode: ThemeMode.system,

}
