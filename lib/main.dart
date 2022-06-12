import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_downloader/helpers/console_helper.dart';
import 'package:social_media_downloader/helpers/size_helper.dart';
import 'package:social_media_downloader/views/splash_view.dart';

void main() async {
  await initialize();
  runApp(
    const ProviderScope(
      child: SMDApp(),
    ),
  );
}

class SMDApp extends StatelessWidget {
  const SMDApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SM Downloader',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.blue,
      ),
      home: const SplashView(),
    );
  }
}

initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  Console.log.initialize();
}
