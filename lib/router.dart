import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/onboarding/splash_screen.dart' as splash;
import 'screens/onboarding/name_input.dart' as nameInput;
import 'screens/onboarding/age_gender.dart' as ageGender;
import 'screens/onboarding/investor_or_entrepreneur.dart' as roleSelection;
import 'screens/onboarding/home.dart' as home;

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => splash.SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding/name',
      name: 'name-input',
      builder: (context, state) => nameInput.NameInputScreen(),
    ),
    GoRoute(
      path: '/onboarding/age-gender',
      name: 'age-gender',
      builder: (context, state) => ageGender.AgeGenderScreen(),
    ),
    GoRoute(
      path: '/onboarding/role-selection',
      name: 'role-selection',
      builder: (context, state) => roleSelection.InvestorOrEntrepreneurScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) {
        final String? userRole = state.extra as String?;
        return home.HomeScreen(userRole: userRole ?? 'Investor');
      },
    ),
  ],
);