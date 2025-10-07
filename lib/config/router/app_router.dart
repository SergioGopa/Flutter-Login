import 'package:eisty/features/catalog/deals/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:eisty/config/router/app_router_notifier.dart';
import 'package:eisty/features/auth/auth.dart';
import 'package:eisty/features/explore/explore.dart';
import 'package:eisty/features/favorites/favorites.dart';
import 'package:eisty/features/profile/profile.dart';
import 'package:eisty/features/today/today.dart';
import 'package:eisty/features/home/home.dart';

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
          path: '/terms-signup',
          // name: TermsSignupScreen.name,
          builder: (context, state) => TermsSignupScreen(),
        ),

        GoRoute(
            path: '/',
            name: HomeScreen.name,
            builder: (context, state) => HomeScreen(),
            routes: [
              GoRoute(
                path: '/today',
                name: 'today',
                builder: (context, state) => const TodayScreen(),
              ),
              GoRoute(
                path: '/explore',
                name: 'explore',
                builder: (context, state) => const ExploreScreen(),
              ),
              GoRoute(
                path: '/favorites',
                name: 'favorites',
                builder: (context, state) => const FavoritesScreen(),
              ),
              GoRoute(
                path: '/profile',
                name: 'profile',
                builder: (context, state) => const ProfileScreen(),
              ),
              GoRoute(
                path: '/deals/:id',
                name: 'deal-detail',
                builder: (context, state) {
                  final id = state.pathParameters['id'] ?? 'no-id';
                  return DealDetailScreen(
                    dealId: id,
                    
                  );
                },
              ),
            ]),
          GoRoute(
            path: '/profile',
            name: ProfileScreen.name,
            builder: (context, state) => ProfileScreen(),
            routes: [
              GoRoute(
                path: 'account',
                name: AccountScreen.name,
                builder: (context, state) => AccountScreen(),
                ),

              GoRoute(
                path: 'notifications',
                name: NotificationsScreen.name,
                builder: (context, state) => NotificationsScreen(),
                ),

              GoRoute(
                path: 'promos',
                name: SavedPromosScreen.name,
                builder: (context, state) => SavedPromosScreen(),
                ),
              
              GoRoute(
                path: 'support',
                name: SupportScreen.name,
                builder: (context, state) => SupportScreen(),
                ),

              GoRoute(
                path: 'theme',
                name: PreferencesScreen.name,
                builder: (context, state) => PreferencesScreen(),
                ),
              
              GoRoute(
                path: 'terms',
                name: TermsScreen.name,
                builder: (context, state) => TermsScreen(),
                ),
              
            ]
            )
      ],
      redirect: (context, state) {
        final isGoingTo = state.matchedLocation;
        final authStatus = goRouterNotifier.authStatus;
        final hasCompletedOnboarding = goRouterNotifier.hasCompletedOnboarding;
        final splashDone = goRouterNotifier.splashDone;

        //Still checking (loading splash)
        if (authStatus == AuthStatus.checking) {
          return isGoingTo == '/splash' ? null : '/splash';
        }

        if (!splashDone) {
          return isGoingTo == '/splash' ? null : '/splash';
        }

        //Onboarding not completed
        if (!hasCompletedOnboarding) {
          if (isGoingTo != '/onboarding') return '/onboarding';
          return null;
        }

        //Not authenticated
        if (authStatus == AuthStatus.notAuthenticated) {
          if (isGoingTo == '/signin' || isGoingTo == '/signup' ||isGoingTo == '/terms-signup') return null;
          return '/signin';
        }

        if (authStatus == AuthStatus.authenticated) {
          if (isGoingTo == '/signin' ||
              isGoingTo == '/signup' ||
              isGoingTo == '/splash') {
            return '/';
          }
        }

        return null;
      },
    );
  },
);
