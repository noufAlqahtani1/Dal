
import 'package:components/component/theme/colors.dart';
import 'package:flutter/material.dart';

class ProfileInfoSection extends StatelessWidget {
  final String imgurl;
  final String firstName;
  final String lasrName;
  final String email;
  final Function() onPressed;
  const ProfileInfoSection(
      {super.key,
      required this.firstName,
      required this.lasrName,
      required this.email,
      required this.onPressed,
      required this.imgurl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$firstName $lasrName',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  email,
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
            const Spacer(),
            IconButton(
              icon: Icon(Icons.edit, color: AppColors.black2),
              iconSize: 18,
              onPressed: onPressed,
            )
          ],
        )
      ],
    );
  }
}

class FilterSection extends StatelessWidget {
  final Function(String) selectFilter;
  final Map<String, bool> categories;
  const FilterSection(
      {super.key, required this.selectFilter, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Filters',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Press to add or remove filter',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Wrap(
          spacing: 8.0,
          children: categories.keys.map((category) {
            return ChoiceChip(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                labelStyle: TextStyle(color: Color(0xffF7F7F7), fontSize: 14),
                label: Text(category),
                selected: categories[category]!,
                onSelected: (isSelected) => selectFilter(category),
                selectedColor: AppColors().green,
                backgroundColor: AppColors().grey2,
                showCheckmark: false,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.transparent,
                    )));
          }).toList(),
        ),
      ],
    );
  }
}

class AppearanceSection extends StatelessWidget {
  const AppearanceSection({super.key, required this.onChanged});
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Appearance',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Row(
          children: [
            Text(
              'Dark Theme', //bloc
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            Switch(
              value: true,
              onChanged: onChanged,
              activeColor: Theme.of(context).primaryColor,
              thumbColor: const WidgetStatePropertyAll(Colors.white),
              trackOutlineColor: const WidgetStatePropertyAll(Colors.white),
              inactiveTrackColor: const Color(0xff848484),
            ),
          ],
        )
      ],
    );
  }
}

class LanguageSection extends StatelessWidget {
  const LanguageSection({super.key, required this.changeLang});
  final ValueChanged<String?>? changeLang;

  @override
  Widget build(BuildContext context) {
    final List<String> languages = ['English', 'العربية'];
    String selectedLanguage = 'English';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Language',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Center(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: DropdownButton<String>(
                value: selectedLanguage,
                isExpanded: true,
                dropdownColor: Theme.of(context).canvasColor,
                items: languages.map((String language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(language,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  );
                }).toList(),
                onChanged: changeLang
                //  selectedLanguage = newValue ?? selectedLanguage;

                ),
          ),
        )
      ],
    );
  }
}
