import 'package:components/component/custom_app_bar/custom_app_bar.dart';
import 'package:components/component/custom_cards/searchAds_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:user_app/models/all_ads_model.dart';
import 'package:user_app/screens/search_screen/bloc/search_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<SearchBloc>();
        return Scaffold(
          appBar: const CustomAppBar(
              title: "Search", automaticallyImplyLeading: true),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextFormField(
                    controller: bloc.searchController,
                    onChanged: (value) {
                      bloc.searchQuery = value;
                      bloc.add(SearchAdsEvent());
                    },
                    decoration: InputDecoration(
                      hintText: "Which ads are you interested in?",
                      hintStyle: const TextStyle(color: Color(0x757B7B7B)),
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: const Color(0xffEAEAEA),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0x757B7B7B),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      List<Ads> ads = [];
                      if (state is SearchAdsState) {
                        ads = state.ads;
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(children: [
                              ...ads.map((ad) {
                                return searchAdsCard(
                                  companyName:
                                      ad.branch!.business!.name ?? '---',
                                  offerType: ad.offerType ?? '----',
                                  companyLogo: ad.bannerimg ??
                                      'https://img.freepik.com/free-vector/anime-chibi-boy-wearing-cap-character_18591-82515.jpg',
                                  viewLocation: 'Open in map',
                                  locationOnPressed: () async {
                                    final availableMaps =
                                        await MapLauncher.installedMaps;
                                    print(
                                        availableMaps); // Output the available maps for debugging purposes
                                    if (availableMaps.isNotEmpty) {
                                      await availableMaps.first.showMarker(
                                        coords: Coords(ad.branch!.latitude!,
                                            ad.branch!.longitude!),
                                        title: ad.branch!.business!.name!,
                                      );
                                    } else {
                                      // Handle the case where no maps are installed
                                      print(
                                          "no maps installed on this device.");
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'No maps are installed on this device.')),
                                      );
                                    }
                                  },
                                  description: ad.description!,
                                );
                              }).toList(),
                            ]),
                          ),
                        );
                      }
                      return Lottie.asset('assets/json/searchLoading.json');
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}