import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example/core/init/navigator/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication/bloc/authentication_bloc.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> with AutoRouteAware {
  AutoRouteObserver? _observer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // RouterScope exposes the list of provided observers
    // including inherited observers
    _observer =
        RouterScope.of(context).firstObserverOfType<AutoRouteObserver>();
    if (_observer != null) {
      // we subscribe to the observer by passing our
      // AutoRouteAware state and the scoped routeData
      _observer?.subscribe(this, context.routeData);
    }
  }

  @override
  void didPopNext() {}

  @override
  void didPushNext() {}

  @override
  void didPush() {}

  @override
  void didPop() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Feeds"),
          actions: [
            IconButton(
              onPressed: () {
                context.router.push(SettingsRoute());
              },
              icon: Icon(Icons.settings),
              padding: EdgeInsets.zero,
            )
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: false,
              title: Text(
                "Feeds",
                style: TextStyle(fontSize: 22),
              ),
            ),
            _FeedList()
          ],
        ));
  }
}

class _FeedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
                  onTap: () {
                    context.router
                        .push(FeedDetailRoute(text: index.toString()));
                  },
                  leading: Icon(Icons.feed),
                  title: Text(index.toString()),
                ),
            childCount: 100));
  }
}
