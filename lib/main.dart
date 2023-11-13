import 'package:flutter/material.dart';
import 'package:prava_flutter/src/controller/web_view_container.dart';
import 'package:prava_flutter/src/pages/capture_information_page.dart';
import 'package:prava_flutter/src/pages/login_page.dart';
import 'package:prava_flutter/src/stores/task_list_store.dart';

void main() async {
  TaskListStore().fillStory;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/webViewContainer': (context) => const WebViewContainer(),
        '/captureInformation': (context) => const CaptureInformationPage(),
      },
      title: 'Prova Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
