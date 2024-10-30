import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong2/latlong.dart';
import 'package:meta/meta.dart';
import 'package:user_app/data_layer/data_layer.dart';
import 'package:user_app/setup/setup.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final LatLng initialCenter =
      const LatLng(24.82307363899628, 46.76960924937112);
  bool buttonClicked = true;
  double areaDistance = 1000;
  Position? positionn;

  // save latitude/longitude of all branches registred in the supabase

  final List<LatLng> allSubscribedBranches = getIt
      .get<DataLayer>()
      .businessBranches
      .map((e) => LatLng(e['latitude'], e['longitude']))
      .toList();

  // List of provided markers
  // final List<LatLng> markerLocations = const [
  //   LatLng(24.81307299899741, 46.76503970781533),
  //   LatLng(24.82037851123455, 46.76296974609059),
  //   LatLng(24.81924369998163, 46.77445218221551),
  //   LatLng(24.835059154264727, 46.77699081816699),
  //   LatLng(24.83317984725718, 46.7532448270556),
  // ];

  List<Marker> filteredMarkers = [];
  StreamSubscription<Position>? positionStream;

  DiscoverBloc() : super(DiscoverInitial()) {
    on<ErrorScreenEvent>((event, emit) async {
      emit(ErrorState(msg: event.msg));
    });
    on<LoadScreenEvent>((event, emit) async {
      emit(LoadingState());
      try {
        print(event.position!.latitude);
        positionn = event.position;
        areaDistance = buttonClicked ? 1000 : 500000;
        filteredMarkers = getIt
            .get<DataLayer>()
            .businessBranches
            .map((location) {
              double distance = Geolocator.distanceBetween(
                event.position!.latitude,
                event.position!.longitude,
                location['latitude'],
                location['longitude'],
              );

              return distance <= areaDistance
                  ? Marker(
                      width: 50,
                      height: 50,
                      point:
                          LatLng(location['latitude'], location['longitude']),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            colorBlendMode: BlendMode.clear,
                            location['business']['logo_img'],
                          ),
                        ),
                      ))
                  : null;
            })
            .whereType<Marker>()
            .toList();
        emit(SuccessState());
      } catch (e) {
        emit(ErrorState(msg: e.toString()));
      }
    });
  }

  @override
  Future<void> close() {
    positionStream?.cancel();
    return super.close();
  }
}
