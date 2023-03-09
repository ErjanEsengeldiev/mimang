import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_mang/core/helpers/custom_elevated_button.dart';
import 'package:mi_mang/core/helpers/custom_text_field.dart';
import 'package:mi_mang/features/auth/bloc/auth_bloc_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    super.key,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MiMang.')),
      body: BlocProvider(
        create: (context) => AuthBlocBloc(),
        child: BlocConsumer<AuthBlocBloc, AuthBlocState>(
          bloc: context.read<AuthBlocBloc>(),
          listener: (context, state) {
            
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                    const Text('Email'),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _emailController,
                    ),
                    const SizedBox(height: 20),
                    CustomElevatedButton(
                      onPressed: () {},
                      child: const Text('SignIn'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
