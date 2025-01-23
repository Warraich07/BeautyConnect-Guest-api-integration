import 'package:beauty_connect_guest/constants/global_variables.dart';
import 'package:beauty_connect_guest/controllers/lazy_controller.dart';
import 'package:beauty_connect_guest/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'controllers/general_controller.dart';
import 'localization/locale_constants.dart';
import 'localization/localizations_delegate.dart';


void main() {

  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;


  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }


  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      print(locale);
      setState(() {
        _locale = locale;
        print(_locale.toString()+"this is localization value");
        // _locale = Locale(DEVICE_LOCALE.value, '');
      });
      GeneralController generalController=Get.find();
      if(_locale.toString()=='pt'){
        generalController.updateLanguageCode('en');
        print(generalController.languageCode.value);
      }if(_locale.toString()=='fr'){
        generalController.updateLanguageCode('fr');
        print(generalController.languageCode.value);
      }if(_locale.toString()=='es'){
        generalController.updateLanguageCode('pt');
        print(generalController.languageCode.value);
      }
    });

    super.didChangeDependencies();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale("en", ""),
          const Locale("pt", ""),
          const Locale("fr","")
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode &&
                supportedLocale.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        locale: _locale,
        initialBinding: LazyController(),
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        title: "Beauty Connect Guest",
        theme: ThemeData(
          useMaterial3: false,
            highlightColor: Colors.transparent,
            splashColor: Colors.white,
            primarySwatch: Colors.orange,
            scaffoldBackgroundColor: AppColors.scaffoldColor),
        home: SplashScreen(),
      );
    });
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

// class InitialBinding extends Bindings {
//   @override
//   void dependencies() {
//     // TODO: implement dependencies
//     Get.put(GeneralController());
//     initializeDateFormatting();
//   }
// }

