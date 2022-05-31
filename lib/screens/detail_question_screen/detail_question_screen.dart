import 'package:flutter/material.dart';
import './detail_question_screen_view.dart';

class DetailQuestionScreen extends StatefulWidget {
  final int soalId;
  final int ujianId;
  final int noSoal;

  const DetailQuestionScreen({
    Key? key,
    required this.soalId,
    required this.noSoal,
    required this.ujianId,
  }) : super(key: key);

  @override
  // ignore: unnecessary_new
  DetailQuestionScreenView createState() => new DetailQuestionScreenView();
}
