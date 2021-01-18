import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

const customTextDecoration = TextStyle(
                        fontSize: 18,
                        fontFamily: 'Bahij');

const TextDecoration = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'Bahij');

class DataSource {
  static List questionAnswers = [
    {
      "question":translate('questionAnswers.question1'),
      "answer":translate('questionAnswers.answer1'),},
    {
      "question":translate('questionAnswers.question2'),
      "answer":translate('questionAnswers.answer2'), },
    {
      "question":translate('questionAnswers.question3'),
      "answer":translate('questionAnswers.answer3'), },
    {
      "question":translate('questionAnswers.question4'),
      "answer":translate('questionAnswers.answer4'), },
    {
      "question":translate('questionAnswers.question5'),
      "answer":translate('questionAnswers.answer5'), },
    {
      "question":translate('questionAnswers.question6'),
      "answer":translate('questionAnswers.answer6'), },
    {
      "question":translate('questionAnswers.question7'),
      "answer":translate('questionAnswers.answer7'), },
    {
      "question":translate('questionAnswers.question8'),
      "answer":translate('questionAnswers.answer8'), },
    {
      "question":translate('questionAnswers.question9'),
      "answer":translate('questionAnswers.answer9'), },
    {
      "question":translate('questionAnswers.question10'),
      "answer":translate('questionAnswers.answer10'), },
    {
      "question":translate('questionAnswers.question11'),
      "answer":translate('questionAnswers.answer11'), },
  ];
}