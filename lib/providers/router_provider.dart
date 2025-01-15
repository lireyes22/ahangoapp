import 'package:go_router/go_router.dart';
import 'package:ahangoapp/screens.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'locality',
            name: 'locality',
            builder: (context, state) => const LocalityScreen(),
            routes: [
              GoRoute(
                path: 'restaurant',
                name: 'restaurant',
                builder: (context, state) => const RestaurantScreen(),
              ),
              GoRoute(
                path: 'atractive',
                name: 'atractive',
                builder: (context, state) => const AtractiveScreen(),
              ),
              GoRoute(
                path: 'services',
                name: 'services',
                builder: (context, state) => const ServicesScreen(),
                routes: [
                  GoRoute(
                    path: 'service-detail',
                    name: 'service-detail',
                    builder: (context, state) => const ServiceDetailScreen(),
                  )
                ]
              )
            ]
          )
        ]
      ),
    ],
  );
}