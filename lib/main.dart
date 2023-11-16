import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_purple/models/missions.dart';

import 'widgets/homepage.dart';

void main() {
  runApp(ChangeNotifierProvider<Missions>(
      create: (BuildContext context) {
        return Missions();
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
