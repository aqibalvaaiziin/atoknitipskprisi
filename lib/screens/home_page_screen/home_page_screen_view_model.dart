import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/api/services/ujian_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './home_page_screen.dart';

abstract class HomePageScreenViewModel extends State<HomePageScreen> {
  double width = 0.0;
  double height = 0.0;
  String kelasName = "";
  String siswaName = "";
  int kelasId = 0;
  int siswaId = 0;
  List listUjianData = [];
  bool isLoading = true;

  loadSiswaName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      kelasName = sp.getString("kelasName")!;
      siswaName = sp.getString("siswaName")!;
      kelasId = sp.getInt("kelasId")!;
      siswaId = sp.getInt("siswaId")!;
      loadListUjian();
    });
  }

  loadListUjian() {
    UjianServices.getListUjian(siswaId).then((value) {
      var jsonObject = jsonDecode(jsonEncode(value.data));
      setState(() {
        listUjianData = List.from(jsonObject['data ujian']);
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadSiswaName();
  }
}
