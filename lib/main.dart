
import 'package:kuriftuquest/modules/profile/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kuriftuquest/modules/auth/providers/auth_provider.dart';
import 'package:kuriftuquest/modules/auth/providers/signup_provider.dart';
import 'package:kuriftuquest/modules/auth/providers/verify_provider.dart';
import 'package:kuriftuquest/layout/providers/main_provider.dart';
import 'package:kuriftuquest/core/constants/colors/colors.dart';
import 'package:kuriftuquest/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => MainProvider()),
        ChangeNotifierProvider(create: (_) => VerifyProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        // ChangeNotifierProvider(create: (_) => OrderProvider()),
        // ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Kuriftu Quest',
        theme: ThemeData(
          primaryColor: AppColors.primary,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AppColors.primary,
            secondary: AppColors.secondary,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.primary,
          ),
        ),
        routerConfig: appRouter,
      ),
    );
  }
}
