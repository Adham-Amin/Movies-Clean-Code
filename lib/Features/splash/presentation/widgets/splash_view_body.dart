import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies/Core/utils/app_assets.dart';
import 'package:movies/Features/main_view.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, MainView.routeName),);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(child: Image.asset(AppAssets.imagesLogo, width: 168)),
    );
  }
}
