import 'package:business_app/data_layer/data_layer.dart';
import 'package:business_app/setup/setup.dart';
import 'package:flutter/material.dart';
import 'package:moyasar/moyasar.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key, required this.totalPrice, required this.planType, required this.startDate, required this.endDate, required this.PaymentFunc});
  final double totalPrice;
  final String  planType;
 final DateTime startDate;
  final DateTime endDate;
  final Function PaymentFunc;
  paymentConfig() {
    return PaymentConfig(
      publishableApiKey:
          'pk_test_PB1baNgjCqvDmTbqdZQMCKXTWQejHLM7NUxwwRLV', //for now
      amount: (totalPrice * 100).toInt(),
      description: 'Subscription payment ',
      metadata: {},
      creditCard: CreditCardConfig(saveCard: true, manual: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Container(
        child: CreditCard(
          config: paymentConfig(),
          onPaymentResult: (PaymentResponse data) async {
            print("---------------- ${data.id}");
            print("---------------- ${data.amount}");
            print("---------------- ${data.status.name}");
            if (data.status.name == "paid") {
              
               await getIt
                  .get<DataLayer>()
                  .supabase
                  .from("subscription_business")
                  .insert({
                    "business_id": '14f75c89-8dc7-46ae-9e57-73a4498036c5',
                    "subscription_type": 'Basic',
                    "start_date": '2024-11-01 23:06:29',
                    "end_date": '2024-11-01 23:06:29',
                  })
                  .select()
                  .single();

              print('response');
            }
            print("---------------- ${data.createdAt}");
          },
        ),
      ),
    );
  }
}
