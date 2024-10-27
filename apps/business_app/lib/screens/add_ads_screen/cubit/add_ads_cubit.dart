import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:business_app/data_layer/data_layer.dart';
import 'package:business_app/setup/setup.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_ads_state.dart';

class AddAdsCubit extends Cubit<AddAdsState> {
  AddAdsCubit() : super(AddAdsInitial());

  TextEditingController addTypeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

    final supabase = getIt.get<DataLayer>().supabase;

  ImagePicker pick = ImagePicker();
  File? image;
  int locationValue = 0;
  int? categoryValue = 0;
  DateTime? startDate;
  DateTime? endDate;
  late final getUrl;

  Future<void> pickAdsImage() async {
    final XFile? imageFile = await pick.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      final File image = File(imageFile.path);

      final uploadImage = await supabase.storage
          .from('offer images')
          .upload('${imageFile.name}', image);

      print('Image uploaded successfully: $uploadImage');
       getUrl = await supabase.storage
          .from('offer images')
          .getPublicUrl('${imageFile.name}');
      print(getUrl);

      emit(AdsImageState(image: image));
    } else {
      print('No image selected');
    }
  }

  selectCategory(int value) {
    categoryValue = value;
    emit(CategoryState(categoryValue: value));
  }

  selectLocation(int value) {
    locationValue = value;
    emit(LocationState(locationValue: value));
  }

  selectAdsRangeDate(DateTime start, DateTime end) {
    startDate = start;
    endDate = end;
    emit(SelectDateState(startDate: startDate, endDate: endDate));
  }

  String dateFormat(DateTime start, DateTime end){
    String displayDate =  '${start.day.toString().padLeft(2, '0')}/${start.month.toString().padLeft(2, '0')}/${start.year} - ${end.day.toString().padLeft(2, '0')}/${end.month.toString().padLeft(2, '0')}/${end.year}';
    return displayDate;    
  }
}
