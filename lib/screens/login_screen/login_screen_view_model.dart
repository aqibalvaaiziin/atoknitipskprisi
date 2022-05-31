import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/api/services/user_services.dart';
import 'package:mobile_app/helper/preferences_data.dart';
import 'package:mobile_app/screens/home_page_screen/home_page_screen.dart';
import 'package:mobile_app/widgets/custom_widget.dart';
import 'package:mobile_app/widgets/route.dart';
import './login_screen.dart';

abstract class LoginScreenViewModel extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  double width = 0.0;
  double height = 0.0;
  bool isVisible = true;
  bool isLoading = false;

  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      // ignore: unnecessary_new
      new GlobalKey<ScaffoldMessengerState>();
  PreferencesData preferencesData = PreferencesData();
  final belumterdaftar = SnackBar(
    content: customText(
      12,
      "User Belum Terdaftar",
      color: Colors.white,
    ),
  );
  final isidulu = SnackBar(
    content: customText(
      12,
      "User Belum Terdaftar",
      color: Colors.white,
    ),
  );

  void loginUserAction() {
    bool condition = email.text.isNotEmpty && password.text.isNotEmpty;

    if (condition) {
      setState(() {
        isLoading = true;
      });
      authAction();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(isidulu);
    }
  }

  authAction() {
    UserServices.loginUser(email: email.text, password: password.text)
        .then((value) {
      var jsonObject = jsonDecode(jsonEncode(value.data));
      if (jsonObject['status'] == 500) {
        ScaffoldMessenger.of(context).showSnackBar(belumterdaftar);
        setState(() {
          isLoading = false;
        });
      } else {
        preferencesData.setUserData(
          jsonObject['user']['id'],
          jsonObject['siswa']['kelas_id'],
          jsonObject['siswa']['nama_siswa'],
          jsonObject['siswa']['kelas']['nama_kelas'],
        );
        nextPageRemove(context, HomePageScreen());
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }
}
