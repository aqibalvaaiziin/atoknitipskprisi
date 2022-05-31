import 'package:flutter/material.dart';
import 'package:mobile_app/helper/global_variable.dart';
import 'package:mobile_app/widgets/custom_widget.dart';
import './login_screen_view_model.dart';

class LoginScreenView extends LoginScreenViewModel {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return CustomScaffold(
      key: scaffoldKey,
      body: isLoading
          ? loadingScreenBlock()
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          CustomImage.asset1,
                          width: width * 0.5,
                        ),
                        SizedBox(height: height * 0.01),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          width: width * 0.78,
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(width * 0.1, "Login",
                                  fw: FontWeight.w800),
                              customText(width * 0.04,
                                  "Silahkan login terlebih dahulu !"),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        buildBoxInput(),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Widget buildBoxInput() {
    return Column(
      children: [
        SizedBox(height: height * 0.03),
        inputForm(
          "email",
          Icons.person,
          email,
        ),
        inputForm(
          "Password",
          Icons.lock,
          password,
          isPassword: true,
        ),
        SizedBox(height: height * 0.01),
        loginButton(),
        SizedBox(height: height * 0.02),
      ],
    );
  }

  Widget loginButton() {
    return Container(
      width: width * 0.8,
      height: height * 0.06,
      decoration: BoxDecoration(
        color: CustomColor.brown,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: MaterialButton(
          onPressed: () {
            loginUserAction();
          },
          child: customText(
            height * 0.03,
            "Login",
            fw: FontWeight.w700,
            color: CustomColor.krem,
          ),
        ),
      ),
    );
  }

  Widget inputForm(
    String hint,
    IconData icon,
    TextEditingController controller, {
    TextInputType inputType = TextInputType.text,
    bool isPassword = false,
  }) {
    return Container(
      width: width * 0.8,
      height: height * 0.06,
      margin: EdgeInsets.only(bottom: height * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: CustomColor.brown,
          width: 1.5,
        ),
      ),
      child: Center(
        child: TextField(
          scrollPadding: EdgeInsets.zero,
          obscureText: isPassword && isVisible,
          controller: controller,
          style: TextStyle(
            fontSize: isPassword ? height * 0.04 : height * 0.023,
            color: CustomColor.brown,
            fontFamily: "Visby",
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: height * 0.023,
                color: CustomColor.brown,
                fontFamily: "Visby"),
            prefixIcon: Icon(
              icon,
              size: height * 0.028,
              color: CustomColor.brown,
            ),
            prefixIconConstraints:
                BoxConstraints(minHeight: 0, minWidth: width * 0.1),
            suffixIconConstraints:
                BoxConstraints(minHeight: 0, minWidth: width * 0.1),
          ),
          keyboardType: inputType,
        ),
      ),
    );
  }
}
