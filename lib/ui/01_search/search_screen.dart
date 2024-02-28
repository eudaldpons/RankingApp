import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ranking_app/ui/01_search/answer_screen.dart';
import 'package:ranking_app/styles/app_styles.dart';
import 'package:ranking_app/ui/common_widgets/bottom_nav_bar.dart';
import 'package:ranking_app/ui/01_search/widgets/widget_example_question.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final TextEditingController _questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 150, left: 20, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Search for any',
                style: AppStyles.title,
              ),
              Text(
                'ranking',
                style: AppStyles.titleSecondaryColor,
              ),
              Text(
                'here',
                style: AppStyles.title,
              ),
              const SizedBox(height: 30),
              Form(
                child: TextFormField(
                    onFieldSubmitted: (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnswerScreen(
                              question: _questionController.text,
                            ),
                          ),
                        ),
                    controller: _questionController,
                    style: AppStyles.textFormField,
                    maxLines: 1,
                    decoration: AppStyles.searchTextFormField),
              ),
              const SizedBox(height: 30),
              Text(
                'Examples',
                style: AppStyles.section,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/data/data.json'),
                  builder: (context, snapshot) {
                    var newData = json.decode(snapshot.data.toString());
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return WidgetExampleQuestion(
                            iconTitle: newData['examples'][index]['iconTitle'],
                            title: newData['examples'][index]['title'],
                            question: newData['examples'][index]['question']);
                      },
                      itemCount: newData == null ? 0 : 3,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: 1),
    );
  }
}
