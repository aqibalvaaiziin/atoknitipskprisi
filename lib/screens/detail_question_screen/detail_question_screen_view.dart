// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/custom_widget.dart';
import '../../helper/global_variable.dart';
import './detail_question_screen_view_model.dart';

class DetailQuestionScreenView extends DetailQuestionScreenViewModel {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return CustomScaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.brown,
        title: Text(
          "Soal No.${widget.noSoal.toString()}",
        ),
      ),
      body: isLoading
          ? loaderPage()
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: width * 0.08,
                  vertical: height * 0.01,
                ),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.09),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        width * 0.05,
                        listJawabanData[0]['isi_soal'],
                        th: 1.1,
                        fw: FontWeight.w900,
                        color: CustomColor.brown,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    // cardJawaban(0, listJawabanData[0]['opsi_a']),
                    // cardJawaban(1, listJawabanData[0]['opsi_b']),
                    // cardJawaban(2, listJawabanData[0]['opsi_c']),
                    // cardJawaban(3, listJawabanData[0]['opsi_d']),
                    lisCardJawaban(),
                    SizedBox(height: height * 0.05),
                    // customText(width * 0.03, "opsi : $opsi"),
                    // customText(width * 0.03, "jawaban : $jawaban"),
                    // customText(width * 0.03, "soalId : ${widget.soalId}"),
                    // customText(width * 0.03, "ujianId : ${widget.ujianId}"),
                    buttonJawab(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget lisCardJawaban() {
    return ListView.builder(
      itemCount: jawabanData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        return cardJawaban(i, jawabanData[i]);
      },
    );
  }

  Widget cardJawaban(int index, String soal) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(vertical: height * 0.01),
      decoration: BoxDecoration(
        color: jawaban == soal ? CustomColor.brown : Colors.white,
        border: Border.all(
          color: CustomColor.brown,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onTap: () {
          isiJawaban(index, soal);
        },
        child: customText(
          width * 0.05,
          soal,
          fw: FontWeight.w700,
          color: jawaban == soal ? Colors.white : CustomColor.brown,
        ),
      ),
    );
  }

  Widget buttonJawab() {
    return Container(
      width: width,
      height: height * 0.06,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: CustomColor.yellow,
        boxShadow: [
          const BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(2, 1),
          )
        ],
        borderRadius: BorderRadius.circular(6),
      ),
      child: MaterialButton(
        minWidth: width,
        height: height,
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.03,
        ),
        onPressed: () {
          if (opsi.isNotEmpty && jawaban.isNotEmpty) {
            kirimJawaban();
          } else {
            callScakbarisi();
          }
        },
        child: customText(width * 0.05, "Submit",
            fw: FontWeight.w900, color: Colors.white),
      ),
    );
  }
}
