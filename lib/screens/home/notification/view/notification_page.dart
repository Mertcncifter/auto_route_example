import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example/core/init/navigator/app_router.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            title: Text(
              "Notifications",
              style: TextStyle(fontSize: 22),
            ),
          ),
          _NotificationList()
        ],
      ),
    );
  }
}

class _NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
                  onTap: () {
                    context.router
                        .push(NotificationDetailRoute(text: index.toString()));
                  },
                  leading: Icon(Icons.notifications),
                  title: Text(index.toString()),
                ),
            childCount: 100));
  }
}
