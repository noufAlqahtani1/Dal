import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:meta/meta.dart';
import 'package:user_app/data_layer/data_layer.dart';
import 'package:user_app/setup/setup.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  bool buttonClicked = true;
  double areaDistance = 1000;
  Position? positionn;

  List<Marker> filteredMarkers = [];
  StreamSubscription<Position>? positionStream;

  DiscoverBloc() : super(DiscoverInitial()) {
    on<ErrorScreenEvent>((event, emit) async {
      emit(ErrorState(msg: event.msg));
    });
    on<LoadScreenEvent>((event, emit) async {
      emit(LoadingState());
      try {
        positionn = event.position;
        areaDistance = buttonClicked ? 1000 : 500000;
        filteredMarkers = getIt
            .get<DataLayer>()
            .allAds
            .map((location) {
              double distance = Geolocator.distanceBetween(
                event.position!.latitude,
                event.position!.longitude,
                location.branch!.latitude!,
                location.branch!.longitude!,
              );

              if (distance <= areaDistance) {
                
                return Marker(
                      width: 50,
                      height: 50,
                      point: LatLng(location.branch!.latitude!,
                          location.branch!.longitude!),
                      child: InkWell(
                        onTap: () {
                          String categoryIcon = location.category!.toString();
                          showDialog(
                              context: event.context,
                              builder: (context) => AlertDialog(
                                    contentPadding: EdgeInsets.zero,
                                    content: BottomSheetForMap(
                                        locationOnPressed: () async {
                                          final availableMaps =
                                              await MapLauncher.installedMaps;

                                          if (availableMaps.isNotEmpty) {
                                            await availableMaps.first
                                                .showMarker(
                                              coords: Coords(
                                                  location.branch!.latitude!,
                                                  location.branch!.longitude!),
                                              title: location
                                                  .branch!.business!.name!,
                                            );
                                          } else {
                                            // Handle the case where no maps are installed
                                            print(
                                                "no maps installed on this device.");
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'No maps are installed on this device.')),
                                            );
                                          }
                                        },
                                        image: location.bannerimg!,
                                        companyName:
                                            location.branch!.business!.name!,
                                        iconImage:
                                            "assets/svg/$categoryIcon.svg",
                                        description: location.description!,
                                        remainingDay: getIt
                                            .get<DataLayer>()
                                            .getRemainingTime(
                                                location.enddate!),
                                        offerType: location.offerType!,
                                        viewLocation: "Open in map"),
                                  ));
                        },
                        child: Badge(
                          label: Text(
                            "${location.offerType}",
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 3, color: Colors.white)),
                            height: 50,
                            width: 50,
                            child: ClipRRect(
                              child: Image.network(
                                fit: BoxFit.fill,
                                location.branch!.business!.logoImg!,
                              ),
                            ),
                          ),
                        ),
                      ));
              } else {
                return null;
              }
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
