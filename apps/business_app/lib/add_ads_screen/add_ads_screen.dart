import 'package:business_app/add_ads_screen/cubit/add_ads_cubit.dart';
import 'package:components/components.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAdsScreen extends StatelessWidget {
  const AddAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => AddAdsCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffA51361),
            foregroundColor: const Color(0xffF7F7F7),
            title: const Text('Add Ads'),
          ),
          body: BlocBuilder<AddAdsCubit, AddAdsState>(
            builder: (context, state) {
              final cubit = context.read<AddAdsCubit>();
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'Add Type',
                        color: Color(0xff444444),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        fillColor: const Color(0xffEAEAEA),
                        hintText: 'example: 15% Off',
                        hintStyle: const TextStyle(color: Color(0xff848484)),
                        controller: cubit.addTypeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter add type';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(
                        text: 'Category',
                        color: Color(0xff444444),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomDrobDownButton(
                        value: cubit.categoeryValue,
                        items: [
                          const DropdownMenuEntry(value: 0, label: "Cafes"),
                          const DropdownMenuEntry(value: 1, label: "Bakery"),
                          const DropdownMenuEntry(value: 2, label: "Breakfast"),
                          const DropdownMenuEntry(
                              value: 3, label: "Ice creams"),
                          const DropdownMenuEntry(value: 4, label: "Dinning"),
                          const DropdownMenuEntry(value: 5, label: "Drinks"),
                        ].map((entry) {
                          return DropdownMenuItem<int>(
                            value: entry.value,
                            child: Text(entry.label),
                          );
                        }).toList(),
                        onChanged: (int? value) {
                          if (value != null) {
                            cubit.selectCategory(value);
                          }
                        },
                      ),
                      // add duration
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(
                        text: 'Ads Duration',
                        color: Color(0xff444444),
                        fontSize: 18,
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
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RangeDatePicker(
                                          maxDate: DateTime(2030),
                                          minDate: DateTime(2020),
                                          slidersColor: const Color(0xffA51361),
                                          leadingDateTextStyle: const TextStyle(
                                              color: Color(0xffA51361),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                          currentDateTextStyle: const TextStyle(
                                              color: Color(0xffA51361),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                          selectedCellsTextStyle:
                                              const TextStyle(
                                                  color: Color(0xffA51361),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                          currentDateDecoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffA51361))),
                                          singleSelectedCellDecoration:
                                              BoxDecoration(
                                                  color:
                                                      const Color(0xffA51361),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffA51361))),
                                          selectedCellsDecoration:
                                              const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 211, 182, 198),
                                          ),
                                          onRangeSelected: (value) {},
                                        ),
                                        CustomElevatedButton(
                                          onPressed: () {},
                                          backgroundColor:
                                              const Color(0xffA51361),
                                          child: const CustomText(
                                            text: 'Confirm',
                                            color: Color(0xffF7F7F7),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    );
                                  });
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
                      const CustomText(
                        text: 'Description',
                        color: Color(0xff444444),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        fillColor: Color(0xffEAEAEA),
                        hintText: '',
                        hintStyle: TextStyle(color: Color(0xff848484)),
                        maxLines: 6,
                        controller: cubit.descriptionController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter a description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(
                        text: 'Location',
                        color: Color(0xff444444),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomDrobDownButton(
                        value: cubit.locationValue,
                        items: [
                          const DropdownMenuEntry(value: 0, label: "Tuwaiq"),
                          const DropdownMenuEntry(value: 1, label: "Mall"),
                        ].map((entry) {
                          return DropdownMenuItem<int>(
                            value: entry.value,
                            child: Text(entry.label),
                          );
                        }).toList(),
                        onChanged: (int? value) {
                          if (value != null) {
                            cubit.selectLocation(value);
                          }
                        },
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(
                        text: 'Ads image',
                        color: Color(0xff444444),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      // -------------------- image picker
                      InkWell(
                        onTap: () async {
                          cubit.pickAdsImage();
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          height: 172,
                          width: 172,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    blurStyle: BlurStyle.outer,
                                    blurRadius: 4,
                                    offset: const Offset(0, 1),
                                    color: const Color(0xff000000)
                                        .withOpacity(0.25))
                              ]),
                          child: (state is AdsImageState && state.image != null)
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    state.image!,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : const Icon(Icons.photo),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // button
                      CustomElevatedButton(
                        backgroundColor: const Color(0xffA51361),
                        onPressed: () {
                          if (formKey.currentState?.validate() == true) {}
                        },
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
              );
            },
          ),
        );
      }),
    );
  }
}
