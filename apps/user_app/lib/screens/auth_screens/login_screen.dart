import 'package:components/component/background/background.dart';
import 'package:components/component/custom_text_field/custom_text_form_field.dart';
import 'package:components/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/screens/auth_screens/create_account_screen.dart';
import 'package:user_app/screens/auth_screens/cubit/auth_cubit.dart';
import 'package:user_app/screens/auth_screens/verify_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Builder(builder: (context) {
        final cubit = context.read<AuthCubit>();
        return BlocListener<AuthCubit, AuthStatee>(
          listener: (context, state) {
            if (state is LoadingState) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const AlertDialog(
                      backgroundColor: Colors.transparent,
                      content: CircularProgressIndicator()));
            }
            if (state is SuccessState) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VerifyScreen(
                            email: cubit.loginController.text,
                          )));
            }
            if (state is ErrorState) {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => AlertDialog(
                      backgroundColor: Colors.transparent,
                      content: SizedBox(
                          height: 100,
                          width: 100,
                          child: Text(
                            state.msg,
                            style: TextStyle(color: Colors.red),
                          ))));
            }
          },
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Form(
              key: cubit.formKey,
              child: Stack(
                children: [
                  Background(),
                  //
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: SvgPicture.asset("assets/svg/Dal_logo.svg"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Login",
                                style:
                                    Theme.of(context).textTheme.headlineSmall)
                            .tr(),
                        const SizedBox(
                          height: 48,
                        ),
                        CustomTextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email";
                            }
                            String pattern =
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                            RegExp regex = RegExp(pattern);
                            if (!regex.hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          controller: cubit.loginController,
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color
                                        ?.withOpacity(0.5),
                                  ),
                          labelText: "Email".tr(),
                          hintText: "Email hint text".tr(),
                          fillColor: Theme.of(context).canvasColor,
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        CustomElevatedButton(
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.signIn();
                              }
                            },
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text("Login",
                                    style:
                                        Theme.of(context).textTheme.labelSmall)
                                .tr()),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateAccountScreen()));
                            },
                            child: Text("Create An Account",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium)
                                .tr(),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
