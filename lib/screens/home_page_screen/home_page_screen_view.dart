import 'package:flutter/material.dart';
import 'package:mobile_app/helper/global_variable.dart';
import 'package:mobile_app/screens/validation_screen/validation_screen.dart';
import 'package:mobile_app/widgets/custom_widget.dart';
import 'package:mobile_app/widgets/route.dart';
import './home_page_screen_view_model.dart';

class HomePageScreenView extends HomePageScreenViewModel {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return CustomScaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: CustomColor.brown,
      ),
      body: isLoading
          ? loadingScreenBlock()
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: height * 0.01),
                  userBox(),
                  SizedBox(height: height * 0.009),
                  listTextBox(),
                  SizedBox(height: height * 0.001),
                  // Container(
                  //   width: width,
                  //   margin: EdgeInsets.symmetric(
                  //     vertical: height * 0.02,
                  //     horizontal: width * 0.05,
                  //   ),
                  //   child:
                  //       customText(width * 0.06, "List Ujian Tersedia : ", fw: FontWeight.w300),
                  // ),
                  // SizedBox(height: height * 0.01),
                  ujianListView(),
                ],
              ),
            ),
      // body: checkData(),
    );
  }

//4
//1
// irfak
//tkj1
  Widget checkData() {
    return Column(
      children: [
        customText(width * 0.3, siswaName),
        SizedBox(height: height * 0.01),
        customText(width * 0.3, kelasName),
        SizedBox(height: height * 0.01),
        customText(width * 0.3, siswaId.toString()),
        SizedBox(height: height * 0.01),
        customText(width * 0.3, kelasId.toString()),
        SizedBox(height: height * 0.01),
      ],
    );
  }

  Widget userBox() {
    return Container(
      width: width,
      height: height * 0.3,
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
            padding: EdgeInsets.all(width * 0.15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerText(width * 0.08, "Selamat Datang !",
                    fw: FontWeight.w900, color: CustomColor.brown),
                SizedBox(height: height * 0.01),
                headerText(width * 0.05, "Nama  : $siswaName",
                    fw: FontWeight.w300, color: CustomColor.brown),
                SizedBox(height: height * 0.003),
                headerText(width * 0.05, "Kelas   : $kelasName",
                    fw: FontWeight.w300, color: CustomColor.brown)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget listTextBox() {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(
        vertical: height * 0.01,
        horizontal: width * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        vertical: height * 0.01,
        horizontal: width * 0.01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerText(width * 0.05, "Ujian Tersedia : ",
              fw: FontWeight.bold, color: CustomColor.brown)
        ],
      ),
    );
  }

  Widget ujianListView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: height * 0.001),
      itemCount: listUjianData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        var data = listUjianData[i];
        return cardUjian(
          listUjianData.length,
          i,
          data['id_ujian'],
          data['nama_ujian'],
          data['mapel']['nama_mapel'],
          data['kelas']['nama_kelas'],
        );
        // return SizedBox();
      },
    );
  }

  Widget cardUjian(
    int length,
    int index,
    int ujianId,
    String ujianName,
    String mapelName,
    String kelasName,
  ) {
    return Container(
      width: width,
      height: height * 0.09,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(
        width * 0.02,
        height * 0.01,
        width * 0.02,
        index + 1 == length ? height * 0.1 : height * 0.01,
      ),
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
          nextPage(
            context,
            ValidationScreen(
              ujianId: ujianId,
              ujianName: ujianName,
              nameKelas: kelasName,
              nameMapel: mapelName,
            ),
          );
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: customText(width * 0.045, ujianName,
              fw: FontWeight.bold, color: CustomColor.krem),
        ),
      ),
    );
  }
}
