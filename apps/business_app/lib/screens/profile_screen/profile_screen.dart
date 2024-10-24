import 'package:business_app/screens/profile_screen/bloc/profile_bloc_bloc.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBlocBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<ProfileBlocBloc>();
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(), //put cutom bar here
          body: SingleChildScrollView(
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ProfileInfoSection(
                          imgurl: '',
                          firstName: 'First',
                          lasrName: "Last",
                          email: 'example@example.com',
                          onPressed: () {},
                        ),
                      ),
                      const Divider(height: 40),
                      PlanSection(
                        plan: 'Basic Plan',
                        planDesc:
                            'Post your ads for passing customers for a month at a single business location, with access to basic ad stats.',
                        endDate: 'Ends 12/12/2024',
                        remainDays: 11,
                        onPressed: () {},
                      ),
                      const Divider(height: 40),
                      BlocBuilder<ProfileBlocBloc, ProfileBlocState>(
                        builder: (context, state) {
                          return AppearanceSection(
                            onChanged: (bool) {
                              bloc.add(ChangeModeEvent());
                            },
                            isOn: bloc.DarkModeOn,
                          );
                        },
                      ),
                      const Divider(height: 40),
                      BlocBuilder<ProfileBlocBloc, ProfileBlocState>(
                        builder: (context, state) {
                          return LanguageSection(
                            changeLang: (int? value) {
                              bloc.add(ChangeLangEvent(value: value!));
                            },
                            value: bloc.langValue,
                          );
                        },
                      ),
                      LogoutButton(
                        onPressed: () {
                          //
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
