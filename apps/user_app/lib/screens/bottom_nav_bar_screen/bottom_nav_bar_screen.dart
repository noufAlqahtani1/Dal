import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/screens/home_screen/home_screen.dart';

import 'bloc/nav_bar_bloc.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarBloc(),
      child: Builder(builder: (context) {
        int index = 0;
        List navBarPages = const [
          HomeScreen(),
          Icon(
            Icons.location_on,
            size: 150,
          ),
          Icon(
            Icons.notifications,
            size: 150,
          ),
          Icon(
            Icons.person,
            size: 150,
          ),
        ];
        return BlocBuilder<NavBarBloc, NavBarState>(
          builder: (context, state) {
            if (state is BottomNavBarState) {
              index = state.index;
            }
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: const Color(0xffF7F7F7),
                selectedItemColor: const Color(0xffA51361),
                unselectedItemColor: const Color(0xffB8B8B8),
                unselectedLabelStyle: const TextStyle(color: Color(0xffB8B8B8)),
                type: BottomNavigationBarType.fixed,
                currentIndex: index,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/svg/home.svg',
                        colorFilter: index == 0
                            ? const ColorFilter.mode(
                                Color(0xffA51361), BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Color(0xffB8B8B8), BlendMode.srcIn)),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/svg/discover.svg',
                        colorFilter: index == 1
                            ? const ColorFilter.mode(
                                Color(0xffA51361), BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Color(0xffB8B8B8), BlendMode.srcIn),
                        width: 18,
                      ),
                      label: 'Discover'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/svg/reminder.svg',
                          colorFilter: index == 2
                              ? const ColorFilter.mode(
                                  Color(0xffA51361), BlendMode.srcIn)
                              : const ColorFilter.mode(
                                  Color(0xffB8B8B8), BlendMode.srcIn)),
                      label: 'Reminder'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/svg/profile.svg',
                          colorFilter: index == 3
                              ? const ColorFilter.mode(
                                  const Color(0xffA51361), BlendMode.srcIn)
                              : const ColorFilter.mode(
                                  Color(0xffB8B8B8), BlendMode.srcIn)),
                      label: 'Profile'),
                ],
                onTap: (value) {
                  context
                      .read<NavBarBloc>()
                      .add(BottomNavBarEvent(index: value));
                },
              ),
              body: Center(
                child: navBarPages[index],
              ),
            );
          },
        );
      }),
    );
  }
}
