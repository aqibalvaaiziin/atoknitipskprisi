import 'package:flutter/material.dart';
import 'package:mobile_app/helper/global_variable.dart';
import 'package:mobile_app/screens/question_list_screen/question_list_screen.dart';
import 'package:mobile_app/widgets/custom_widget.dart';
import 'package:mobile_app/widgets/route.dart';
import './validation_screen_view_model.dart';

class ValidationScreenView extends ValidationScreenViewModel {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return CustomScaffold(
      appBar: AppBar(
        title: Text(widget.nameMapel),
        backgroundColor: CustomColor.brown,
      ),
      body: isLoading
          ? loaderPage()
          : Column(
              children: [
                boxData(
                  CustomColor.krem,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          customText(width * 0.07, "Detail Ujian : ",
                              fw: FontWeight.w900),
                          const SizedBox(height: 20),
                          rowText("Ujian   : ", widget.ujianName),
                          const SizedBox(height: 10),
                          rowText("Mapel  : ", widget.nameMapel),
                          const SizedBox(height: 10),
                          rowText("Kelas   : ", widget.nameKelas)
                        ],
                      ),
                      SizedBox(height: isUjian ? 0 : 20),
                      isUjian ? const SizedBox() : buttonNavigate(),
                    ],
                  ),
                ),
                !isUjian
                    // ignore: prefer_const_constructors
                    ? SizedBox()
                    : boxData(
                        Colors.amber,
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customText(width * 0.1, score),
                              const SizedBox(height: 10),
                              customText(
                                width * 0.05,
                                "Score Anda",
                                fw: FontWeight.bold,
                              )
                            ],
                          ),
                        ),
                      )
              ],
            ),
    );
  }

  Widget boxData(Color boxColor, Widget child) {
    return Container(
        width: width,
        height: isUjian ? height * 0.2 : height * 0.3,
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.03,
        ),
        margin: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.03,
        ),
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: child);
  }

  Widget buttonNavigate() {
    return Container(
      width: width,
      height: height * 0.06,
      decoration: BoxDecoration(
        color: CustomColor.yellow,
        borderRadius: BorderRadius.circular(6),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: MaterialButton(
          onPressed: () {
            nextPage(
              context,
              QuestionListScreen(
                ujianId: widget.ujianId,
                ujianName: widget.ujianName,
                nameKelas: widget.nameKelas,
                nameMapel: widget.nameMapel,
              ),
            );
          },
          child: customText(
            width * 0.04,
            "Kerjakan !",
            fw: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget rowText(String title, String value) {
    return Row(
      children: [
        customText(width * 0.04, title),
        customText(width * 0.04, value),
      ],
    );
  }
}





// nama ujian
// kelas ujian
