import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:user_app/data_layer/data_layer.dart';
import 'package:user_app/models/all_ads_model.dart';
import 'package:user_app/setup/setup.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final supabase = getIt.get<DataLayer>().supabase;
  List<Ads> nearbyBranches = [];

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );
  Position? position;

  HomeCubit() : super(HomeInitial());

  getAllAds() async {
    if (getIt.get<DataLayer>().allAds.isEmpty) {
      emit(LoadingState());
      try {
        position = await Geolocator.getCurrentPosition(
            locationSettings: locationSettings);

        await getIt.get<DataLayer>().getAllAds();
        for (var element in getIt.get<DataLayer>().allAds) {
          // get nearby branches to the user
          double distance = Geolocator.distanceBetween(
              position!.latitude,
              position!.longitude,
              element.branch!.latitude!,
              element.branch!.longitude!);
          if (distance < 1000) {
            nearbyBranches.add(element);
          }
        }

        print("--------------- data fetched");
        emit(SuccessState());
      } on PostgrestException catch (e) {
        emit(ErrorState(msg: e.message));
      } on AuthException catch (e) {
        emit(ErrorState(msg: e.message));
      }
    } else {
      emit(SuccessState());
    }
  }
}
