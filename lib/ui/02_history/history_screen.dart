import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ranking_app/data/database/database_service.dart';
import 'package:ranking_app/models/ranking_answer_model.dart';
import 'package:ranking_app/styles/app_styles.dart';
import 'package:ranking_app/ui/common_widgets/bottom_nav_bar.dart';
import 'package:ranking_app/ui/02_history/widgets/widget_history_answer.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late Box<RankingAnswerModel> questionsBox;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History",
          style: AppStyles.appBarTitle,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: DatabaseService.getAll(),
        builder: (BuildContext context,
            AsyncSnapshot<List<RankingAnswerModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data!.isNotEmpty) {
            questionsBox = Hive.box<RankingAnswerModel>('questions');
            return ListView.builder(
              itemCount: questionsBox.length,
              itemBuilder: (context, index) {
                RankingAnswerModel questionFromDB = questionsBox.getAt(index)!;
                return WidgetHistoryAnswer(
                    question: questionFromDB.question!,
                    answer: questionFromDB.answer!);
              },
            );
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              return const Center(child: Text('No data'));
            } else {
              return Center(
                child: LoadingAnimationWidget.newtonCradle(
                  color: AppStyles.secondaryColor,
                  size: 300,
                ),
              );
            }
          }
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: 2),
    );
  }
}
