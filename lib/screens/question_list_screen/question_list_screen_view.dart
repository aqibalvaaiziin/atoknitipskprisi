import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/helper/global_variable.dart';
import 'package:mobile_app/screens/detail_question_screen/detail_question_screen.dart';
import 'package:mobile_app/widgets/custom_widget.dart';
import 'package:mobile_app/widgets/route.dart';
import './question_list_screen_view_model.dart';

class QuestionListScreenView extends QuestionListScreenViewModel {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return CustomScaffold(
      body: isLoading ? loadingScreenBlock() : SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.08,
            vertical: height * 0.01,
          ),
          child: Column(
            children: [
              SizedBox(height: height * 0.05),
              header(),
              SizedBox(height: height * 0.03),
              listSoal(),
              // customText(width * 0.04, "id_Ujian : ${widget.ujianId}"),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(width * 0.05, "Selamat Mengerjakan !",
            fw: FontWeight.w900, color: CustomColor.brown),
        SizedBox(height: height * 0.005),
        customText(width * 0.04, "Semoga Lancar dengan Hasil Terbaik",
            color: CustomColor.brown),
        SizedBox(height: height * 0.05),
        boxUjian(),
      ],
    );
  }

  Widget boxUjian() {
    return Container(
      width: width,
      height: height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: CustomColor.krem,
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          const BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(2, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              CustomImage.asset1,
              width: width * 0.27,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(width * 0.05, widget.ujianName,
                    color: CustomColor.brown, fw: FontWeight.w900),
                SizedBox(height: height * 0.005),
                customText(width * 0.04, widget.nameMapel,
                    color: CustomColor.brown),
                SizedBox(height: height * 0.003),
                customText(width * 0.04, widget.nameKelas,
                    color: CustomColor.brown),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget listSoal() {
    return listSoalData.isEmpty
        ? customText(
            width * 0.04,
            "Tidak Ada Soal!",
            fw: FontWeight.w900,
          )
        : Column(
            children: [
              SizedBox(height: height * 0.03),
              Container(
                alignment: Alignment.centerLeft,
                child: customText(width * 0.045, "List Soal !",
                    fw: FontWeight.w900, color: CustomColor.brown),
              ),
              SizedBox(height: height * 0.05),
              ListView.builder(
                itemCount: listSoalData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return cardSoal(
                    i,
                    listSoalData.length,
                    listSoalData[i]['isi_soal'],
                    listSoalData[i]['id_soal'],
                    listSoalData[i]['ujian_id'],
                  );
                },
              ),
              buttonSelesai(),
            ],
          );
  }

  Widget cardSoal(int index, int length, String soal, int soalId, int ujianId) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        0,
        0,
        0,
        index + 1 == length ? height * 0.03 : height * 0.01,
      ),
      decoration: BoxDecoration(
          color: CustomColor.brown,
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(2, 1),
            )
          ],
          borderRadius: BorderRadius.circular(6)),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.04,
        ),
        onPressed: () {
          nextPage(
              context,
              DetailQuestionScreen(
                soalId: soalId,
                noSoal: index + 1,
                ujianId: ujianId,
              ));
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: customText(width * 0.040, soal,
              color: CustomColor.krem, th: 1.2, fw: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buttonSelesai() {
    return Container(
      width: width,
      height: height * 0.07,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: CustomColor.red,
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(2, 1),
            )
          ],
          borderRadius: BorderRadius.circular(6)),
      child: MaterialButton(
        minWidth: width,
        height: height,
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.03,
        ),
        onPressed: () {
          openDialogSubmit();
        },
        child: customText(
          width * 0.045,
          "Selesai !",
          fw: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  void openDialogSubmit() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: customText(
          width * 0.044,
          "Yakin???",
          ta: TextAlign.center,
          fw: FontWeight.bold,
        ),
        content: Container(
          margin: EdgeInsets.only(top: height * 0.01),
          child: customText(
            width * 0.035,
            "Kirim jawaban sekarang?",
            th: 1.3,
            ta: TextAlign.center,
          ),
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Tidak'),
            onPressed: () {
              backScreen(context);
            },
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Iya'),
            onPressed: () {
              submitJawaban();
            },
          ),
        ],
      ),
    );
  }
}
