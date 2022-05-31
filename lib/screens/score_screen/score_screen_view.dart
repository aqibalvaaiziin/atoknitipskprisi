import 'package:flutter/material.dart';
import 'package:mobile_app/helper/global_variable.dart';
import 'package:mobile_app/screens/home_page_screen/home_page_screen.dart';
import 'package:mobile_app/widgets/custom_widget.dart';
import 'package:mobile_app/widgets/route.dart';
import './score_screen_view_model.dart';

class ScoreScreenView extends ScoreScreenViewModel {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return CustomScaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                CustomImage.asset1,
                width: width * 0.6,
              ),
              const SizedBox(height: 10),
              customText(
                width * 0.045,
                "Selamat! Kamu telah menyelesaikan ujian",
              ),
              const SizedBox(height: 2),
              customText(
                width * 0.05,
                "Hasil dari nilaimu adalah !",
                fw: FontWeight.w800,
              ),
              const SizedBox(height: 50),
              customText(
                width * 0.2,
                widget.score,
                fw: FontWeight.w800,
              ),
              const SizedBox(height: 30),
              buttonSelesai(),
            ],
          ),

      ),
    );
  }

  Widget buttonSelesai() {
    return Container(
      width: width * 0.8,
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
          nextPageReplacement(context, HomePageScreen());
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
}
