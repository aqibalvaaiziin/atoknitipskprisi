import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/api/services/ujian_services.dart';
import 'package:mobile_app/screens/score_screen/score_screen.dart';
import 'package:mobile_app/widgets/custom_widget.dart';
import 'package:mobile_app/widgets/route.dart';
import './question_list_screen.dart';

abstract class QuestionListScreenViewModel extends State<QuestionListScreen> {
  double width = 0.0;
  double height = 0.0;
  List listSoalData = [];
  // List listSoalData = [
  //   'laladkjahdksahdklhdkjsdhfakjshfjahskfjashkhfkjlsafhkjashfkjlashfjkasfsda',
  //   'lili',
  //   'lulu',
  //   'lele',
  //   'lolo',
  //   'wawa',
  //   'wiwi',
  //   'wuwuw',
  //   'wewew',
  //   'wowowo'
  // ];
  bool isLoading = true;

  callSnackbarDone() {
    final jawabanTerisi = SnackBar(
      content: customText(
        12,
        "Ujian Selesai",
        color: Colors.white,
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(jawabanTerisi);
  }

  loadListSoal() {
    UjianServices.getSoalByUjian(widget.ujianId).then((value) {
      var jsonObject = jsonDecode(jsonEncode(value.data));
      setState(() {
        listSoalData = List.from(jsonObject['data']);
        isLoading = false;
      });
    });
  }

  submitJawaban() {
    UjianServices.addNilai(widget.ujianId).then((value) {
      var jsonObject = jsonDecode(jsonEncode(value.data));
      String dataScore = jsonObject['total nilai'].toString();
      callSnackbarDone();
      nextPageRemove(context, ScoreScreen(score: dataScore));
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadListSoal();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
