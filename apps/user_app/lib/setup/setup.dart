import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:user_app/data_layer/data_layer.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  await GetStorage.init();
  getIt.registerSingleton<DataLayer>(DataLayer());
  await getIt.get<DataLayer>().getAllAds();
  await getIt.get<DataLayer>().locationBgStream();


  
}
