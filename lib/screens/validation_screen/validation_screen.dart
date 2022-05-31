import 'package:flutter/material.dart';
import './validation_screen_view.dart';

class ValidationScreen extends StatefulWidget {
  final int ujianId;
  final String ujianName;
  final String nameKelas;
  final String nameMapel;

  const ValidationScreen({
    Key? key,
    required this.ujianId,
    required this.ujianName,
    required this.nameKelas,
    required this.nameMapel,
  }) : super(key: key);

  @override
  // ignore: unnecessary_new
  ValidationScreenView createState() => new ValidationScreenView();
}
