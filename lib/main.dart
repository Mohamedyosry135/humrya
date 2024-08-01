// @dart=2.9

import 'package:example_structure/config/ConfigReader.dart';

import 'package:example_structure/consts/themes.dart';
import 'package:example_structure/lang/translation_service.dart';
import 'package:example_structure/pages/splash/bindings/splash_binding.dart';
import 'package:example_structure/pages/splash/presentation/views/splash_view.dart';
import 'package:example_structure/routes/app_pages.dart';
import 'package:example_structure/services/auth_service.dart';

import 'package:example_structure/services/dio_helper.dart';
import 'package:example_structure/shared/logger/logger_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('token');
  await DioHelper.init();
  await GetStorage.init('userData');
  await GetStorage.init('appLanguage');
  await GetStorage.init('language');
  await GetStorage.init('appData');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await ConfigReader.initialize();
  Get.put(AuthService());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return GetMaterialApp(
          home: const SplashView(),
          initialBinding: SplashBinding(),
          debugShowCheckedModeBanner: false,
          enableLog: true,
          logWriterCallback: Logger.write,
          getPages: AppPages.routes,
          theme: Themes.light
              .copyWith(unselectedWidgetColor: Colors.white.withOpacity(0.17)),
          themeMode: ThemeMode.light,
          locale: Locale(AuthService.to.language != null
              ? AuthService.to.language.toString()
              : 'ar'),
          fallbackLocale: TranslationService.fallbackLocale,
          supportedLocales: const [Locale('ar', ''), Locale('en', '')],
          translations: TranslationService(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}
