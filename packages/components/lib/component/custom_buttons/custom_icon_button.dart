import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key, required this.icon, required this.title, this.onPressed});
  final String icon;
  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child:
                IconButton(onPressed: onPressed, icon: SvgPicture.asset(icon)),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(title,
              style:
                  TextStyle(color: Theme.of(context).hintColor, fontSize: 10))
        ],
      ),
    );
  }
}
