import 'package:eisty/config/router/app_router_notifier.dart';
import 'package:eisty/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:eisty/features/auth/presentation/screens/screens.dart';
import '../../features/home/presentation/screens/screens.dart';

final goRouterProvider = Provider(
  (ref) {
    final goRouterNotifier = ref.read(goRouterNotifierProvider);
    return GoRouter(
      initialLocation: '/splash',
      refreshListenable: goRouterNotifier,
      routes: [
        //*First Screen
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashScreen(),
        ),

        GoRoute(
          path: '/onboarding',
          builder: (context, state) => const OnboardingScreen(),
        ),

        //*Auth Routes
        GoRoute(
          path: '/signin',
          builder: (context, state) => const SignInScreen(),
        ),

        GoRoute(
          path: '/signup',
          builder: (context, state) => const SignUpScreen(),
        ),

        GoRoute(
          path: '/loading',
          builder: (context, state) => const SplashScreen(),
        ),

        //*Home Screen
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
      ],
      redirect: (context, state) {
        final isGoingTo = state.matchedLocation;
        final authStatus = goRouterNotifier.authStatus;
        final hasCompletedOnboarding = goRouterNotifier.hasCompletedOnboarding;

        //Still checking (loading splash)
        if (authStatus == AuthStatus.checking) {
          return isGoingTo == '/splash' ? null : '/splash';
        }

        //Onboarding not completed
        if (!hasCompletedOnboarding) {
          if (isGoingTo != '/onboarding') return '/onboarding';
          return null;
        }

        //Not authenticated
        if (authStatus == AuthStatus.notAuthenticated) {
          if (isGoingTo == '/signin' || isGoingTo == '/signup') return null;
          return '/signin';
        }

        if (authStatus == AuthStatus.authenticated) {
          if (isGoingTo == '/signin' ||
              isGoingTo == '/signup' ||
              isGoingTo == '/splash') {
                return '/home';
              }
        }

        return null;
      },
    );
  },
);
