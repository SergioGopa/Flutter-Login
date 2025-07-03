import 'package:go_router/go_router.dart';

import 'package:eisty/features/auth/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/signin',
  routes: [
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
  ]
  );