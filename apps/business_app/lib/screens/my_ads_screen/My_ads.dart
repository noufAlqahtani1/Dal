

import 'package:components/component/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'current_ads.dart';
import 'custom_tabbar.dart';
import 'past_ads.dart';


class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffA51361),
          foregroundColor: const Color(0xffF7F7F7),
          centerTitle: true,
          title: const CustomText(
            text: "My Ads",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xfff7f7f7),
          ),
          bottom: MyAdsTabBar(),
        ),
        body: const TabBarView(
          children: [
            CurrentAdsTap(),
            PastAdsTab(),
          ],
        ),
      ),
    );
  }
}
