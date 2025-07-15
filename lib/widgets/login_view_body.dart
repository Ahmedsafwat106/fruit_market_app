import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ahmedsafwat/widgets/custom_button.dart';
import 'package:ahmedsafwat/widgets/custom_text_field.dart';
import 'package:ahmedsafwat/features/Auth/presentation/pages/complete_information/complete_information_view.dart';
import 'package:ahmedsafwat/features/Auth/presentation/manager/login_cubit.dart';
import 'package:ahmedsafwat/features/Auth/presentation/manager/login_state.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => const CompleteInformationView()),
              );
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Login Failed: ${state.errorMessage}")),
              );
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.jpg", height: 100),
                const SizedBox(height: 30),
                CustomTextField(
                  hintText: "Enter your email",
                  controller: _emailController,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: "Enter your password",
                  controller: _passwordController,
                ),
                const SizedBox(height: 24),
                state is LoginLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                  text: "Login",
                  onPressed: () {
                    BlocProvider.of<LoginCubit>(context).login(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
