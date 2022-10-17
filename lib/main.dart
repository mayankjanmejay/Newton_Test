import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:newton_test/shared/db.dart';
import 'package:newton_test/shared/globals.dart';
import 'package:newton_test/shared/webController.dart';
import 'package:newton_test/views/homePage.dart';
import 'dart:async';

import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';



Future<void> main() async {
   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    

   await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['ro', 'en'],
    assetsDirectory: 'assets/languages/',
  );

  

  await translator.initLanguage('ro');

  runApp(const NewtonTest());
}

class NewtonTest extends StatefulWidget {
  const NewtonTest({super.key});

  @override
  State<NewtonTest> createState() => _NewtonTestState();
}

class _NewtonTestState extends State<NewtonTest> {
  // This widget is the root of your application.
  @override
  void initState() {
    // fetchTournamentData().then((value) {
    //   savedTournaments = value;
    //   log('Data saved', name: 'main', zone: Zone.current);
    // });

    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Newton Test',
      theme: ThemeData(        
        colorScheme: ColorScheme( 
          brightness: Brightness.dark, 
          primary: Color.fromRGBO(33, 46, 60, 1.0), 
          onPrimary: Color.fromARGB(255, 211, 211, 211), 
          secondary: Color.fromARGB(255, 43, 71, 100), 
          onSecondary: Color.fromARGB(255, 211, 211, 211), 
          error: Color.fromARGB(255, 117, 22, 15), 
          onError: Color.fromARGB(255, 209, 191, 191), 
          background: Color.fromRGBO(33, 46, 60, 1.0), 
          onBackground: Color.fromARGB(255, 211, 211, 211), 
          surface: Color.fromRGBO(20, 34, 50, 1.0), 
          onSurface: Color.fromARGB(255, 211, 211, 211), ),
      ),
      home: Home(),
      localizationsDelegates: translator.delegates, // Android + iOS Delegates
      locale: translator.activeLocale, // Active locale
      supportedLocales: translator.locals(), 
    );
  }
}