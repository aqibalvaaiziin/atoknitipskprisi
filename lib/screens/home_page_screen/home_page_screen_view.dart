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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.05),
                    userDataBox(),
                    SizedBox(height: height * 0.05),
                    userBox(),
                    SizedBox(height: height * 0.03),
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

  Widget userDataBox() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerText(
                width * 0.06,
                "Selamat Datang !",
                fw: FontWeight.w900,
                color: CustomColor.brown,
              ),
              SizedBox(height: height * 0.003),
              headerText(
                width * 0.04,
                siswaName,
                color: CustomColor.brown,
              ),
              SizedBox(height: height * 0.003),
              headerText(
                width * 0.04,
                "Siswa $kelasName",
                color: CustomColor.brown,
              )
            ],
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(100)),
            child: const Icon(
              Icons.person,
              size: 30,
              color: Color(0xff480d0b),
            ),
          ),
        ],
      ),
    );
  }

  Widget userBox() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2, 3),
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(CustomImage.asset2),
      ),
    );
  }

  Widget listTextBox() {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(
        vertical: height * 0.01,
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
            "12 Juni 2022");
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
    String ujianDate,
  ) {
    return GestureDetector(
      onTap: () {
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
      child: Container(
        margin: EdgeInsets.fromLTRB(
          0,
          height * 0.01,
          0,
          index + 1 == length ? height * 0.1 : height * 0.01,
        ),
        decoration: BoxDecoration(
          color: index % 2 == 0 ? CustomColor.brown : CustomColor.red,
          // ignore: prefer_const_literals_to_create_immutables
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
        padding: EdgeInsets.symmetric(
          vertical: height * 0.025,
          horizontal: width * 0.03,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.list,
              color: Color(0xffffe6b3),
              size: 30,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                    width * 0.04,
                    ujianName,
                    fw: FontWeight.bold,
                    color: CustomColor.krem,
                  ),
                  SizedBox(height: height * 0.005),
                  customText(
                    width * 0.03,
                    ujianDate,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
