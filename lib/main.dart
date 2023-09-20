import 'dart:developer';

// import 'package:device_info_plus/device_info_plus.dart';
import 'package:bareq/Modules/Home/main_screen.dart';
import 'package:bareq/Modules/SplashScreen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vdocipher_flutter/vdocipher_flutter.dart';
import './Shared/shared_obj.dart';
import './locale/locales.dart';
import 'Control/app_languages.dart';
import 'Control/shared_data_provider.dart';
import 'dart:io';
import 'Modules/html_test_screen.dart';
import 'Modules/test_screen.dart';
import 'Shared/shared_preferances.dart';
import 'Utilities/routing.dart';
// import 'package:firebase_core/firebase_core.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await SharedObj().init();
  try {
    //await SharedPref.setDeviceID(deviceID: deviceId ?? "");
    // log("id ya pop: ${x.toString()});
  } catch (e) {
    print(e.toString());
  }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage()),
      ChangeNotifierProvider<SharedDataProvider>(
          create: (_) => SharedDataProvider()),
    ],
    child: ModularApp(
      module: AppModule(),
      child:  EntryPoint(),
    ),
  ));

}

class EntryPoint extends StatefulWidget {
   EntryPoint({Key? key}) : super(key: key);

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {

  String? _nativePlatformLibraryVersion = 'Unknown';


  Future<void> getNativeLibraryVersion() async {
    String? version;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      version = await (Platform.isIOS ? VdocipherMethodChannel.nativeIOSAndroidLibraryVersion : VdocipherMethodChannel.nativeAndroidLibraryVersion);
    } on PlatformException {
      version = 'Failed to get native platform library version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _nativePlatformLibraryVersion = version;
    });
  }

  @override
  void initState() {
    getNativeLibraryVersion();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final appLan = Provider.of<AppLanguage>(context);
    appLan.fetchLocale();
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (_, __) => MaterialApp(
        theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        navigatorObservers: [VdoPlayerController.navigatorObserver('/player/(.*)')],
        navigatorKey: SharedObj.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: appLan.appLanguage == Languages.ar ? 'بارق' : "bareq",
        initialRoute: SplashScreen.routeName,
        locale: appLan.appLocal,
        supportedLocales: Languages.values.map((e) => Locale(e.name)).toList(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
      ).modular(),
    );
  }
}
