import 'package:flutter/material.dart';
import 'package:ranking_app/styles/app_styles.dart';
import 'package:ranking_app/ui/01_search/widgets/widget_message.dart';

class SingleHistoryScreen extends StatelessWidget {
  final String question;
  const SingleHistoryScreen({super.key, required this.question});

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
        body: WidgetMessage(message: question));
  }
}
