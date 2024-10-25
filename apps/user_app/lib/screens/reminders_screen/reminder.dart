import 'package:components/component/custom_containers/custom_ads_container.dart';
import 'package:components/component/custom_text/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app/data_layer/data_layer.dart';
import 'package:user_app/setup/setup.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffA51361),
        foregroundColor: const Color(0xffF7F7F7),
        centerTitle: true,
        title: CustomText(
          text: "My Reminders".tr(),
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xfff7f7f7),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 2 / 3,
        ),
        itemCount: getIt.get<DataLayer>().myReminders.length,
        itemBuilder: (context, index) {
          final item = getIt.get<DataLayer>().myReminders;

          return Padding(
            padding: const EdgeInsets.only(top: 12),
            child: CustomAdsContainer(
              companyLogo: item[index]['bannerimg'],
              remainingDay: '4d',
              companyName: item[index]['title'],
              offers: item[index]['offer_type'],
            ),
          );
        },
      ),
    );
  }
}
