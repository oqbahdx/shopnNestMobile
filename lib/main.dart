import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_colors.dart';
import 'features/auth/presentation/bloc/register/register_bloc.dart';
import 'features/auth/presentation/pages/register_page.dart';
import 'injection.dart';

void main() {
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: AppColors.primary,
      ),
      home: BlocProvider(
        create: (context) => getIt<RegisterBloc>(),
        child: const RegisterPage(),
      ),
    );
  }
}
