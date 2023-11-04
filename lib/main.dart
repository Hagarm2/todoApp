import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/layout/Firstscreen.dart';
import 'package:todo/providers/myprovider.dart';
import 'package:todo/screens/login/login.dart';
import 'package:todo/shared/styles/mytheme.dart';

import 'firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  const fatalError = true;

  FlutterError.onError = (errorDetails) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
  };
  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
    return true;
  };
  //FirebaseFirestore.instance.disableNetwork();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MyProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(pro.languagecode),
      debugShowCheckedModeBanner: false,
      themeMode: pro.modeApp,

      initialRoute: //pro.firebaseUser !=null ?
      First.routename
         // :LoginScreen.routeName
      ,
      routes: {
        First.routename:(context)=>First(),

        LoginScreen.routeName:(context) => LoginScreen()
      },

    );
  }
}