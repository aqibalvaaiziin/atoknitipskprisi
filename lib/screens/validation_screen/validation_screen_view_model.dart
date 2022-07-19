import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/api/services/ujian_services.dart';
import './validation_screen.dart';

abstract class ValidationScreenViewModel extends State<ValidationScreen> {
  double width = 0.0;
  double height = 0.0;
  String score = "";
  bool isUjian = true;
  bool isLoading = true;

  cekNilaiSiswaByUjian() {
    UjianServices.cekNilaiSiswaByUjian(widget.ujianId).then((value) {
      var jsonObject = jsonDecode(jsonEncode(value.data));
      // ignore: avoid_print
      setState(() {
        isUjian = jsonObject['data'] != null;
        if (isUjian) {
          score = jsonObject['data']['nilai'];
        }
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cekNilaiSiswaByUjian();
    });
  }
}
