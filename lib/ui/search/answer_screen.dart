import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ranking_app/data/service/api_service.dart';
import 'package:ranking_app/styles/app_styles.dart';
import 'package:ranking_app/ui/01_search/widgets/widget_message.dart';

class AnswerScreen extends StatelessWidget {
  final String question;
  const AnswerScreen({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Response",
          style: AppStyles.appBarTitle,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
          future: ApiServices.getAnswer(msg: question),
          builder: (ctx, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return WidgetMessage(message: snapshot.data.toString());
            } else {
              return Center(
                child: LoadingAnimationWidget.newtonCradle(
                  color: AppStyles.secondaryColor,
                  size: 300,
                ),
              );
            }
          }),
    );
  }
}
