import 'package:flutter/material.dart';
import './score_screen_view.dart';

class ScoreScreen extends StatefulWidget {
  final String score;

  const ScoreScreen({
    super.key,
    required this.score,
  });
  @override
  // ignore: unnecessary_new
  ScoreScreenView createState() => new ScoreScreenView();
}
