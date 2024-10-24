import 'package:components/component/custom_cards/subscriptions_card.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubscriptionsScreen extends StatelessWidget {
  const SubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height / 4,
                            child:
                                SvgPicture.asset('assets/svg/Objectives.svg'))),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Draw In Passing Customers!',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'Make your business stand out! Attract passing customers with your best deals and invites by choosing one of the following subscription plans:',
                        style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomSubscriptionsCard(
                          duration: '1 Month',
                          price: 100,
                          plan: 'Basic',
                          selected: true,
                          onTap: () {},
                        ),
                        CustomSubscriptionsCard(
                          duration: '1 Month',
                          price: 250,
                          plan: 'Premium',
                          selected: false,
                          onTap: () {},
                        ),
                        CustomSubscriptionsCard(
                          duration: '1 Month',
                          price: 500,
                          plan: 'Enterprise',
                          selected: false,
                          onTap: () {},
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'Post your ads for passing customers for a month at a single business location, with access to basic ad stats.',
                        style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(
                      height: 15,
                    ),
                    1 == 1 //if used free plan
                        ? CustomElevatedButton(
                            onPressed: () {
                              //
                            },
                            backgroundColor: AppColors().green,
                            child: Text('Free Trial',
                                style: Theme.of(context).textTheme.bodyMedium),
                          )
                        : SizedBox(),
                    CustomElevatedButton(
                      onPressed: () {
                        //
                      },
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Text(
                        'Choose Plan',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
