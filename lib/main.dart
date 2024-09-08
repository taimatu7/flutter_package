import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'infrastracture/data/db/sqflite_database.dart';
import 'presentation/view/counter_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late Future<void> _initFunction;

  @override
  void initState() {
    super.initState();
    _initFunction = _init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initFunction,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) return const CircularProgressIndicator();
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const CounterScreen(),
          );
        });
  }

  Future<void> _init() async {
    // データベースの初期化
    await SqfliteDatabase.initialize();
  }
}
