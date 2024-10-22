import 'dart:io';

import 'package:components/components.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddAdsScreen extends StatefulWidget {
  const AddAdsScreen({super.key});

  @override
  State<AddAdsScreen> createState() => _AddAdsScreenState();
}

class _AddAdsScreenState extends State<AddAdsScreen> {
  ImagePicker pick = ImagePicker();
  int canEdit = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffA51361),
        foregroundColor: const Color(0xffF7F7F7),
        title: const Text('Add Ads'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextFormField(
                title: 'Add Type',
                fillColor: Color(0xffEAEAEA),
                hintText: 'example: 15% Off',
                hintStyle: TextStyle(color: Color(0xff848484)),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: 'Category',
                color: Color(0xff444444),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffEAEAEA),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: DropdownButton<int>(
                    value: 0,
                    hint: const Text('Select option'),
                    items: [
                      const DropdownMenuEntry(value: 0, label: "Yes"),
                      const DropdownMenuEntry(value: 1, label: "No"),
                    ].map((entry) {
                      return DropdownMenuItem<int>(
                        value: entry.value,
                        child: Text(entry.label),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      if (newValue != null) {
                        setState(() {});
                      }
                    },
                    isExpanded: true,
                  ),
                ),
              ),
              // add duration
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: 'Ads Duration',
                color: Color(0xff444444),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: '00/00/0000',
                    color: Color(0xff848484),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const Column(
                              children: [
                                
                              ],
                            );
                          });
                      
                      // RangeDatePicker(
                      //     maxDate: DateTime(2030), minDate: DateTime(2020));
                      //showDateRangePicker(context: context, firstDate: DateTime(2020), lastDate: DateTime(2030));
                    },
                    child: const CustomText(
                      text: 'Change',
                      color: Color(0xffA51361),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextFormField(
                title: 'Description',
                fillColor: Color(0xffEAEAEA),
                hintText: '',
                hintStyle: TextStyle(color: Color(0xff848484)),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: 'Location',
                color: Color(0xff444444),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffEAEAEA),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: DropdownButton<int>(
                    value: 0,
                    hint: const Text('Select option'),
                    items: [
                      const DropdownMenuEntry(value: 0, label: "Yes"),
                      const DropdownMenuEntry(value: 1, label: "No"),
                    ].map((entry) {
                      return DropdownMenuItem<int>(
                        value: entry.value,
                        child: Text(entry.label),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      if (newValue != null) {
                        canEdit = newValue;
                        setState(() {});
                      }
                    },
                    isExpanded: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: 'Ads image',
                color: Color(0xff444444),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 8,
              ),
              // -------------------- image picker
              InkWell(
                onTap: () async {
                  final XFile? image =
                      await pick.pickImage(source: ImageSource.gallery);

                  setState(() {
                    if (image != null) {
                      File(image.path);
                    }
                  });
                },
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 172,
                    width: 172,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              blurStyle: BlurStyle.outer,
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                              color: const Color(0xff000000).withOpacity(0.25))
                        ]),
                    child: const Icon(Icons.photo)),
              ),
              const SizedBox(
                height: 50,
              ),
              // button
              CustomElevatedButton(
                backgroundColor: const Color(0xffA51361),
                onPressed: () {},
                child: const CustomText(
                  text: 'Post Ad',
                  color: Color(0xffF7F7F7),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
