import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example/screens/home/feed/feed_detail/view/feed_detail_page.dart';
import 'package:auto_route_example/screens/home/feed/view/feed_page.dart';
import 'package:auto_route_example/screens/home/notification/notification_detail/view/notification_detail_page.dart';
import 'package:auto_route_example/screens/home/notification/view/notification_page.dart';
import 'package:auto_route_example/screens/home/settings/view/settings_page.dart';
import 'package:auto_route_example/screens/home/view/home_page.dart';
import 'package:auto_route_example/screens/login/view/login_page.dart';
import 'package:auto_route_example/screens/splash/view/splash_page.dart';
import 'package:flutter/material.dart';
part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: HomePage, children: [
      AutoRoute(
        page: EmptyPageRouter,
        name: 'FeedFullRoute',
        path: 'feedFullRoute',
        initial: true,
        children: [
          AutoRoute(initial: true, page: FeedPage, path: 'feedPage'),
          AutoRoute(page: FeedDetailPage, path: ':id'),
        ],
      ),
      AutoRoute(page: NotificationPage),
    ]),
    AutoRoute(page: NotificationDetailPage, path: ':id'),
    AutoRoute(page: SettingsPage),
  ],
)
class AppRouter extends _$AppRouter {}

class EmptyPageRouter extends AutoRouter {
  const EmptyPageRouter({super.key});
}
