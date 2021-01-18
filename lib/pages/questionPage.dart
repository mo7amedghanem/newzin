import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:newzin/helperWidgets/widgets.dart';
class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key key}) : super(key: key);
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}
class _QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate('covid.about'),),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            QuestionsWidget(question: translate('questionAnswers.question1'), answer: translate('questionAnswers.answer1'),),
            QuestionsWidget(question: translate('questionAnswers.question2'), answer: translate('questionAnswers.answer2'),),
            QuestionsWidget(question: translate('questionAnswers.question3'), answer: translate('questionAnswers.answer3'),),
            QuestionsWidget(question: translate('questionAnswers.question4'), answer: translate('questionAnswers.answer4'),),
            QuestionsWidget(question: translate('questionAnswers.question5'), answer: translate('questionAnswers.answer5'),),
            QuestionsWidget(question: translate('questionAnswers.question6'), answer: translate('questionAnswers.answer6'),),
            QuestionsWidget(question: translate('questionAnswers.question7'), answer: translate('questionAnswers.answer7'),),
            QuestionsWidget(question: translate('questionAnswers.question8'), answer: translate('questionAnswers.answer8'),),
            QuestionsWidget(question: translate('questionAnswers.question9'), answer: translate('questionAnswers.answer9'),),
            QuestionsWidget(question: translate('questionAnswers.question10'), answer: translate('questionAnswers.answer10'),),
          ],
        ),
      ),
    );
  }
}