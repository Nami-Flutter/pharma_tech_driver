
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'data/datasource/locale/locale_data_source.dart';
import 'providers.dart';
import 'injection.dart' as injection;
import 'firebase_options.dart';
final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await injection.init();
  await DatabaseHelper.instance.database; // Initialize database
  int currentDatabaseVersion = 4; // Update with your current database version
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? oldDatabaseVersion = prefs.getInt('database_version');
  if (oldDatabaseVersion != null && oldDatabaseVersion < currentDatabaseVersion) {
    await DatabaseHelper.instance.deleteDbWhenChangeVersion();
    prefs.setInt('database_version', currentDatabaseVersion);
  }
  ///
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  ///
  runApp(
       GenerateMultiProvider(
         child:
        EasyLocalization(
          supportedLocales: supportedLocales,
          path: 'assets/strings',
          // if device language not supported
          fallbackLocale: supportedLocales[0],
          saveLocale: true,
          useOnlyLangCode: true,
          startLocale: supportedLocales[0],
          child:  MyApp(),
         ),
      )
  );
}
final supportedLocales = <Locale>[
  const Locale('ar'),
  const Locale('en'),
];