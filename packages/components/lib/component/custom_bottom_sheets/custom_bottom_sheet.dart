import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {super.key,
      required this.image,
      required this.companyName,
      required this.iconImage,
      required this.description,
      required this.remainingDay});
  final String image;
  final String companyName;
  final String iconImage;
  final String description;
  final String remainingDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      child: Column(
        children: [
          Container(
            height: 389,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(companyName,
                        style: Theme.of(context).textTheme.bodyMedium),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xffA51361))),
                      child: SvgPicture.asset(
                        iconImage,
                        colorFilter: const ColorFilter.mode(
                            Color(0xffA51361), BlendMode.srcIn),
                        fit: BoxFit.values[6],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text(description,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff8CBFAE)),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/svg/notification.svg'),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('Remind me ',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        )),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/clock.svg'),
                        Text(remainingDay,
                            style: Theme.of(context).textTheme.titleMedium)
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
