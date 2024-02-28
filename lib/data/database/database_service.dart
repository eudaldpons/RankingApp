import 'package:hive_flutter/hive_flutter.dart';
import 'package:ranking_app/models/ranking_answer_model.dart';

class DatabaseService {
  void addQuestion(String question, String answer) {
    final newQuestion = RankingAnswerModel(
      question: question,
      answer: answer,
    );
    var questionBox = Hive.box<RankingAnswerModel>('questions');
    questionBox.add(newQuestion);
  }

  static Future<List<RankingAnswerModel>> getAll() async {
    var questionBox = Hive.box<RankingAnswerModel>('questions');
    List<RankingAnswerModel> questions = questionBox.values.toList();
    return questions;
  }
}
