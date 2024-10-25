import 'package:components/component/custom_app_bar/custom_app_bar.dart';
import 'package:components/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:user_app/screens/profile_screen/bloc/profile_bloc_bloc.dart';

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
          appBar: CustomAppBar(
            title: 'Profile'.tr(),
            automaticallyImplyLeading: false,
          ),
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
                        child: BlocBuilder<ProfileBlocBloc, ProfileBlocState>(
                          builder: (context, state) {
                            bloc.add(GetInfoEvent());
                            if (state is GetInfoState) {
                              return ProfileInfoSection(
                                imgurl: '',
                                firstName: state.firstName,
                                lastName: state.lastName,
                                email: state.email,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const EditProfileScreen()));
                                },
                              );
                            }
                            return const Text("There is an error");
                          },
                        ),
                      ),
                      const Divider(height: 40),
                      BlocBuilder<ProfileBlocBloc, ProfileBlocState>(
                        builder: (context, state) {
                          return FilterSection(
                            selectFilter: (String) {
                              bloc.add(UpdateFilterEvent(category: String));
                            },
                            categories: bloc.categories,
                            text: 'My filters'.tr(),
                            subText: 'Press to add or remove filter'.tr(),
                          );
                        },
                      ),
                      const Divider(height: 40),
                      BlocBuilder<ProfileBlocBloc, ProfileBlocState>(
                        builder: (context, state) {
                          return AppearanceSection(
                            onChanged: (bool) {
                              bloc.add(ChangeModeEvent());
                            },
                            isOn: bloc.DarkModeOn,
                            text: 'Appearance'.tr(),
                            darkText: 'Dark Mode'.tr(),
                            lightText: 'Light Mode'.tr(),
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
                            text: 'Language'.tr(),
                            label: 'English'.tr(),
                          );
                        },
                      ),
                      LogoutButton(
                        onPressed: () {
                          //
                        },
                        text: 'Log out'.tr(),
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
