import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example/core/init/navigator/app_router.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [FeedFullRoute(), NotificationRoute()],
      builder: (context, child, tabController) {
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: context.tabsRouter.activeIndex,
              onTap: context.tabsRouter.setActiveIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: FeedRoute.name),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    label: NotificationRoute.name),
              ]),
        );
      },
    );
  }
}
