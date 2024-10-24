import 'package:components/component/custom_containers/custom_ads_container.dart';

import 'package:flutter/material.dart';

///// reminder screen
class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});
////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xffA51361),
        foregroundColor: const Color(0xffF7F7F7),
        centerTitle: true,
        title: Text("My Reminder",
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomAdsContainer(
                    companyName: 'Half Millon',
                    ComapanyLogo: 'assets/png/company_logo.png',
                    remainingDay: '4d',
                    offers: '50% off'),
                CustomAdsContainer(
                    companyName: 'Half Millon',
                    ComapanyLogo: 'assets/png/company_logo.png',
                    remainingDay: '4d',
                    offers: '50% off'),
              ],
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomAdsContainer(
                      companyName: 'Half Millon',
                      ComapanyLogo: 'assets/png/company_logo.png',
                      remainingDay: '4d',
                      offers: '50% off'),
                  CustomAdsContainer(
                    companyName: 'Half Millon',
                    ComapanyLogo: 'assets/png/company_logo.png',
                    remainingDay: '4d',
                    offers: '50% off',
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
