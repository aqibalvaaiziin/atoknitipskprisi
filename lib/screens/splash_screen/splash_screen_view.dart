import 'package:flutter/material.dart';
import 'package:mobile_app/helper/global_variable.dart';
import 'package:mobile_app/widgets/custom_widget.dart';
import './splash_screen_view_model.dart';

class SplashScreenView extends SplashScreenViewModel {
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
              CustomImage.asset3,
              width: width *0.6,
              ),
              const SizedBox(height: 20),
              customText(
                width * 0.045, "Mobile Learning Integrated By",
                fw: FontWeight.w300,
                color: CustomColor.brown),
              const SizedBox(height: 2),
              customText(
                width * 0.045, "Cloud Computing",
                fw: FontWeight.bold,
                color: CustomColor.brown),
                const SizedBox(height: 20),
          ],
        )
      ),
    );
  }
}
