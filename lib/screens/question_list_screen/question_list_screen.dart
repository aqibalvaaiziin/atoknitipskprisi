import 'package:flutter/material.dart';
import './question_list_screen_view.dart';

class QuestionListScreen extends StatefulWidget {
  final int ujianId;
  final String ujianName;
  final String nameKelas;
  final String nameMapel;

  const QuestionListScreen({
    Key? key,
    required this.ujianId,
    required this.ujianName,
    required this.nameKelas,
    required this.nameMapel,
  }) : super(key: key);

  @override
  // ignore: unnecessary_new
  QuestionListScreenView createState() => new QuestionListScreenView();
}
