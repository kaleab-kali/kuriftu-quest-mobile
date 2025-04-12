import 'package:kuriftuquest/layout/screens/main_layout.dart';
import 'package:kuriftuquest/modules/challenges/screens/sub_challenges_screen.dart';
// import 'package:elex_driver/modules/gas/screens/gas_screen.dart';
// import 'package:elex_driver/modules/map/screens/map_screen.dart';
import 'package:kuriftuquest/modules/profile/screens/profile_screen.dart';
import 'package:kuriftuquest/onboarding_screen.dart';
import 'package:kuriftuquest/splash.dart';
import 'package:go_router/go_router.dart';
import 'package:kuriftuquest/modules/auth/screens/login_screen.dart';
import 'package:kuriftuquest/modules/auth/screens/signup_screen.dart';
import 'package:kuriftuquest/modules/auth/screens/verify_screen.dart';
// import 'package:kuriftuquest/modules/home/screens/home_screen.dart';

const String onBoarding = '/';
const String layout = '/layout';
const String splash = '/splash';
const String login = '/login';
const String signUp = '/signUp';
const String verify = '/verify';
const String subChallengs = '/subChallengs/:challengeId';

const String profile = '/profile';

final GoRouter appRouter = GoRouter(
  initialLocation: layout,
  routes: [
    GoRoute(
        path: onBoarding,
        builder: (context, state) => const OnboardingScreen()),
    GoRoute(path: splash, builder: (context, state) => const SplashScreen()),
    GoRoute(path: layout, builder: (context, state) => const MainLayout()),
    GoRoute(path: login, builder: (context, state) => const LoginPage()),
    GoRoute(path: signUp, builder: (context, state) => const SignupScreen()),
    GoRoute(path: verify, builder: (context, state) => const VerifyPage()),
    GoRoute(path: profile, builder: (context, state) => const ProfileScreen()),
    GoRoute(
      path: subChallengs,
      builder: (context, state) => SubChallengesScreen(
        challengeId: state.pathParameters['challengeId']!,
      ),
    ),
  ],
);
