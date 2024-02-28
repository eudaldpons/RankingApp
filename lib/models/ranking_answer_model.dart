import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

part 'ranking_answer_model.g.dart';

@HiveType(typeId: 1)
class RankingAnswerModel extends HiveObject {
  @HiveField(0)
  final String? question;

  @HiveField(1)
  final String? answer;

  RankingAnswerModel({
    required this.answer,
    required this.question,
  });

  factory RankingAnswerModel.fromResponse(Response response, String question) {
    String responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> parsedBody = json.decode(responseBody);
    return RankingAnswerModel(
      answer: parsedBody['answer'],
      question: question,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'answer': answer,
      'question': question,
    };
  }

  static fromMap(Map<String, Object?> value) {
    return RankingAnswerModel(
      answer: value['answer'] as String?,
      question: value['question'] as String?,
    );
  }
}
