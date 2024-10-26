import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/screens/auth_screens/create_account_screen.dart';
import 'package:user_app/screens/auth_screens/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child:
                        SvgPicture.asset("assets/svg/onboarding_guy_pic.svg")),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Text("Onboarding title",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineLarge)
                          .tr(),
                      SizedBox(
                        height: 9,
                      ),
                      Text("Onbording subtitle".tr(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        backgroundColor: const Color(0xffA51361),
                        child: Text("Login",
                                style: Theme.of(context).textTheme.labelSmall)
                            .tr(),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          print(EasyLocalization.of(context)!.currentLocale);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateAccountScreen()));
                        },
                        child: Text("Create An Account".tr(),
                            style: Theme.of(context).textTheme.bodyMedium))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
