import 'package:flutter/material.dart';
import 'package:ranking_app/ui/01_search/answer_screen.dart';
import 'package:ranking_app/styles/app_styles.dart';

final string2IconData = <String, IconData>{
  "music": Icons.music_note_outlined,
  "books": Icons.auto_stories_outlined,
  "weather": Icons.wb_sunny_outlined,
};

class WidgetExampleQuestion extends StatelessWidget {
  final String iconTitle;
  final String title;
  final String question;
  const WidgetExampleQuestion(
      {super.key,
      required this.iconTitle,
      required this.title,
      required this.question});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnswerScreen(
              question: question,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppStyles.secondaryBackgroundColor,
            borderRadius: BorderRadius.circular(25),
          ),
          height: 200,
          width: 200,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(string2IconData[iconTitle], size: 50, color: Colors.white),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: AppStyles.titleWidgetExample,
                ),
                const SizedBox(height: 10),
                Text(
                  question,
                  style: AppStyles.questionWidgetExample,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
