import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/screens/profile_screen/bloc/profile_bloc_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBlocBloc(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(), //put cutom bar here
        body: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileInfoSection(
                    imgurl: '',
                    firstName: 'First',
                    lasrName: "Last",
                    email: 'example@example.com',
                    onPressed: () {},
                  ),
                  const Divider(height: 40),
                  PlanSection(
                      plan: 'Basic Plan',
                      planDesc:
                          'Post your ads for passing customers for a month at a single business location, with access to basic ad stats.',
                      endDate: '00-00-00000',
                      remainDays: 22),
                  const Divider(height: 40),
                  AppearanceSection(
                    onChanged: (bool) {
                      //
                    },
                  ),
                  const Divider(height: 40),
                  LanguageSection(
                    changeLang: (String? value) {
                      //
                    },
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          //
                        },
                        child: Text('Logout',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor))),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
