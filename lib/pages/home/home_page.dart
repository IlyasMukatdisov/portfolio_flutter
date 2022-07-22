// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:portfolio_flutter/widgets/app_bar_text.dart';
import 'package:portfolio_flutter/widgets/custom_drawer.dart';
import 'package:portfolio_flutter/widgets/custom_elevated_button.dart';

// Press the Navigation Drawer button to the left of AppBar to show
// a simple Drawer with two items.
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions.context = context;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.red),
          title: AppBarText(text: "Home"),
        ),
        drawer: const CustomDrawer(),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: EdgeInsets.all(Dimensions.height20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: Dimensions.width / 2,
                  height: Dimensions.width / 2 * 4 / 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.width20),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/images/photo.webp",
                          )))),
              SizedBox(
                height: Dimensions.height30,
              ),
              RichText(
                text: TextSpan(
                    text: Constants.hello,
                    style: GoogleFonts.poppins(
                        fontSize: Dimensions.height25,
                        fontWeight: FontWeight.w600,
                        color: AppColors.text900),
                    children: [
                      TextSpan(
                          text: Constants.name,
                          style: GoogleFonts.clickerScript(
                              fontSize: Dimensions.height25,
                              fontWeight: FontWeight.w600,
                              color: Colors.red))
                    ]),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              RichText(
                text: TextSpan(
                    text: Constants.im,
                    style: GoogleFonts.poppins(
                        fontSize: Dimensions.height25,
                        fontWeight: FontWeight.w600,
                        color: AppColors.text900),
                    children: [
                      TextSpan(
                          text: Constants.job,
                          style: GoogleFonts.poppins(
                              fontSize: Dimensions.height25,
                              fontWeight: FontWeight.w600,
                              color: Colors.red))
                    ]),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Text(
                Constants.jobDescription,
                style: GoogleFonts.poppins(
                    fontSize: Dimensions.height10 * 1.8,
                    fontWeight: FontWeight.normal,
                    color: AppColors.text700),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              CustomElevatedButton(
                text: Constants.downloadCv,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}


