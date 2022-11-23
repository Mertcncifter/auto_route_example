import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example/repository/authentication/authentication_repository.dart';
import 'package:auto_route_example/repository/user/user_repository.dart';
import 'package:auto_route_example/screens/authentication/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/init/navigator/app_router.dart';
import 'core/init/notifier/theme_notifier.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.authenticationRepository,
    required this.userRepository,
  });

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: authenticationRepository,
        child: MultiBlocProvider(providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc(
              authenticationRepository: authenticationRepository,
              userRepository: userRepository,
            ),
          ),
        ], child: const AppView()));
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _appRouter.replace(HomeRoute());
                break;
              case AuthenticationStatus.unauthenticated:
                _appRouter.replaceAll([LoginRoute()]);
                break;
              case AuthenticationStatus.unknown:
                break;
            }
          },
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        // Provide an AutoRouteObserver instance
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      theme: ThemeNotifier().lightTheme,
      darkTheme: ThemeNotifier().darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
