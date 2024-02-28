import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ranking_app/models/ranking_answer_model.dart';
import 'package:ranking_app/ui/01_search/search_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(RankingAnswerModelAdapter());
  await Hive.openBox<RankingAnswerModel>('questions');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ranking App',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 174, 255, 0),
          background: const Color.fromARGB(255, 41, 47, 50),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}
