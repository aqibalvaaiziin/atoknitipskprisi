import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/api/services/ujian_services.dart';
import 'package:mobile_app/widgets/custom_widget.dart';
import 'package:mobile_app/widgets/route.dart';
import './detail_question_screen.dart';

abstract class DetailQuestionScreenViewModel
    extends State<DetailQuestionScreen> {
  double width = 0.0;
  double height = 0.0;
  String jawaban = "";
  String opsi = "";
  List listJawabanData = [];
  // ignore: deprecated_member_use, prefer_collection_literals
  List<String> jawabanData = <String>[];
  bool isLoading = true;
  bool isUpdate = false;
  bool isLoadingSubmit = false;
  int idJawaban = 0;

  callScakbarJawaban() {
    final jawabanTerisi = SnackBar(
      content: customText(
        12,
        isUpdate ? "Jawaban berhasil diubah" : "Jawaban dikirim",
        color: Colors.white,
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(jawabanTerisi);
  }

  callScakbarisi() {
    final isiJawaban = SnackBar(
      content: customText(
        12,
        "Isi Jawaban terlebih dahulu",
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(isiJawaban);
  }

  loadListJawaban() {
    UjianServices.getSoalById(widget.soalId).then((value) {
      var jsonObject = jsonDecode(jsonEncode(value.data));
      setState(() {
        listJawabanData = List.from(jsonObject['data']);
        jawabanData.add(jsonObject['data'][0]['opsi_a'].toString());
        jawabanData.add(jsonObject['data'][0]['opsi_b'].toString());
        jawabanData.add(jsonObject['data'][0]['opsi_c'].toString());
        jawabanData.add(jsonObject['data'][0]['opsi_d'].toString());
        cekJawaban();
      });
    });
  }

  cekJawaban() {
    UjianServices.cekJawaban(
      ujianId: widget.ujianId,
      soalId: widget.soalId,
    ).then((value) {
      var jsonObject = jsonDecode(jsonEncode(value.data));
      setState(() {
        if (jsonObject['data'] != null) {
          idJawaban = jsonObject['data']['id_jawaban'];
          opsi = jsonObject['data']['opsi_jawaban'].toString();
          jawaban = jsonObject['data']['isi_jawaban'].toString();
          isUpdate = true;
          isLoading = false;
        } else {
          isLoading = false;
        }
      });
    });
  }

  isiJawaban(int index, String hasil) {
    setState(() {
      jawaban = hasil;
      opsi =
          "opsi_${index == 0 ? "a" : index == 1 ? "b" : index == 2 ? "c" : "d"}";
    });
  }

  kirimJawaban() {
    if (isUpdate) {
      updateJawaban();
    } else {
      tambahJawaban();
    }
  }

  tambahJawaban() {
    UjianServices.addJawaban(
      widget.soalId,
      widget.ujianId,
      jawaban,
      opsi,
    ).then((value) {
      callScakbarJawaban();
      backScreen(context);
    });
  }

  updateJawaban() {
    UjianServices.updateJawaban(
      idJawaban,
      widget.soalId,
      widget.ujianId,
      jawaban,
      opsi,
    ).then((value) {
      callScakbarJawaban();
      backScreen(context);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // print(widget.soalId);
      // print(widget.ujianId);
      loadListJawaban();
    });
  }
}
