import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_nest/features/auth/presentation/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:shop_nest/features/auth/presentation/pages/forgot_password_page.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/bloc/login/login_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'injection.dart';

void main() {
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          home: BlocProvider(
            create: (context) => getIt<ForgotPasswordBloc>(),
            child: const ForgotPasswordPage(),
          ),
        );
      },
    );
  }
}
