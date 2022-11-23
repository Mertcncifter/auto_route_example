import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication/bloc/authentication_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with AutoRouteAware {
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
          title: Text("Settings"),
        ),
        body: Center(
            child: TextButton(
          onPressed: () {
            context
                .read<AuthenticationBloc>()
                .add(AuthenticationLogoutRequested());
          },
          child: Text("Logout"),
        )));
  }
}
