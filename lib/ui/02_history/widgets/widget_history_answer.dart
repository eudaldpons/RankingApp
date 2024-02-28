import 'package:flutter/material.dart';
import 'package:ranking_app/ui/02_history/single_history_screen.dart';
import 'package:ranking_app/styles/app_styles.dart';

class WidgetHistoryAnswer extends StatelessWidget {
  final String question;
  final String answer;
  const WidgetHistoryAnswer(
      {super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleHistoryScreen(
              question: answer,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppStyles.secondaryBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 110,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 5),
                Text(
                  maxLines: 1,
                  question,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.titleWidgetExample,
                ),
                const SizedBox(height: 5),
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  answer,
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
