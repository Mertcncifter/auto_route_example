// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    NotificationDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationDetailRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: NotificationDetailPage(
          key: args.key,
          text: args.text,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    FeedFullRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmptyPageRouter(),
      );
    },
    NotificationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const NotificationPage(),
      );
    },
    FeedRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const FeedPage(),
      );
    },
    FeedDetailRoute.name: (routeData) {
      final args = routeData.argsAs<FeedDetailRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: FeedDetailPage(
          key: args.key,
          text: args.text,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        RouteConfig(
          LoginRoute.name,
          path: '/login-page',
        ),
        RouteConfig(
          HomeRoute.name,
          path: '/home-page',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: HomeRoute.name,
              redirectTo: 'feedFullRoute',
              fullMatch: true,
            ),
            RouteConfig(
              FeedFullRoute.name,
              path: 'feedFullRoute',
              parent: HomeRoute.name,
              children: [
                RouteConfig(
                  '#redirect',
                  path: '',
                  parent: FeedFullRoute.name,
                  redirectTo: 'feedPage',
                  fullMatch: true,
                ),
                RouteConfig(
                  FeedRoute.name,
                  path: 'feedPage',
                  parent: FeedFullRoute.name,
                ),
                RouteConfig(
                  FeedDetailRoute.name,
                  path: ':id',
                  parent: FeedFullRoute.name,
                ),
              ],
            ),
            RouteConfig(
              NotificationRoute.name,
              path: 'notification-page',
              parent: HomeRoute.name,
            ),
          ],
        ),
        RouteConfig(
          NotificationDetailRoute.name,
          path: ':id',
        ),
        RouteConfig(
          SettingsRoute.name,
          path: '/settings-page',
        ),
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-page',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/home-page',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [NotificationDetailPage]
class NotificationDetailRoute
    extends PageRouteInfo<NotificationDetailRouteArgs> {
  NotificationDetailRoute({
    Key? key,
    required String text,
  }) : super(
          NotificationDetailRoute.name,
          path: ':id',
          args: NotificationDetailRouteArgs(
            key: key,
            text: text,
          ),
        );

  static const String name = 'NotificationDetailRoute';
}

class NotificationDetailRouteArgs {
  const NotificationDetailRouteArgs({
    this.key,
    required this.text,
  });

  final Key? key;

  final String text;

  @override
  String toString() {
    return 'NotificationDetailRouteArgs{key: $key, text: $text}';
  }
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/settings-page',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [EmptyPageRouter]
class FeedFullRoute extends PageRouteInfo<void> {
  const FeedFullRoute({List<PageRouteInfo>? children})
      : super(
          FeedFullRoute.name,
          path: 'feedFullRoute',
          initialChildren: children,
        );

  static const String name = 'FeedFullRoute';
}

/// generated route for
/// [NotificationPage]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute()
      : super(
          NotificationRoute.name,
          path: 'notification-page',
        );

  static const String name = 'NotificationRoute';
}

/// generated route for
/// [FeedPage]
class FeedRoute extends PageRouteInfo<void> {
  const FeedRoute()
      : super(
          FeedRoute.name,
          path: 'feedPage',
        );

  static const String name = 'FeedRoute';
}

/// generated route for
/// [FeedDetailPage]
class FeedDetailRoute extends PageRouteInfo<FeedDetailRouteArgs> {
  FeedDetailRoute({
    Key? key,
    required String text,
  }) : super(
          FeedDetailRoute.name,
          path: ':id',
          args: FeedDetailRouteArgs(
            key: key,
            text: text,
          ),
        );

  static const String name = 'FeedDetailRoute';
}

class FeedDetailRouteArgs {
  const FeedDetailRouteArgs({
    this.key,
    required this.text,
  });

  final Key? key;

  final String text;

  @override
  String toString() {
    return 'FeedDetailRouteArgs{key: $key, text: $text}';
  }
}
