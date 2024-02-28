import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ranking_app/styles/app_styles.dart';

class WidgetMessage extends StatelessWidget {
  final String message;
  const WidgetMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 40),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.9,
        child: Center(
          child: Markdown(
            selectable: true,
            styleSheet: AppStyles.responseTheme,
            data: message,
          ),
        ),
      ),
    );
  }
}
