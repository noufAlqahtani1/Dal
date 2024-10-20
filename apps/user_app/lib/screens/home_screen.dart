import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:user_app/services/supabase/supabase_configration.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController otpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  filled: true, fillColor: Colors.green.shade200),
            ),
            TextButton(
                onPressed: () async {
                  try {
                    await SupabaseConfigration.supabase.auth
                        .signInWithOtp(email: emailController.text);
                    print("done!");
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: Text("Register new account ")),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: otpController,
              decoration: InputDecoration(
                  filled: true, fillColor: Colors.green.shade200),
            ),
            TextButton(
                onPressed: () async {
                  try {
                    await SupabaseConfigration.supabase.auth.verifyOTP(
                        token: otpController.text,
                        type: OtpType.signup,
                        email: "azooz.n40@hotmail.com");

                    await SupabaseConfigration.supabase
                        .from("users")
                        .update({"email": "azooz.n40@hotmail.com"}).eq("id",
                            SupabaseConfigration.supabase.auth.currentUser!.id);

                    print("done!");
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: Text("Confirm Account ")),
          ],
        ),
      ),
    );
  }
}
