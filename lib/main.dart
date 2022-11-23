import 'package:auto_route_example/repository/authentication/authentication_repository.dart';
import 'package:auto_route_example/repository/user/user_repository.dart';
import 'package:auto_route_example/utils/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'core/init/cache/locale_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.preferencesInit();
  Bloc.observer = AppBlocObserver();
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}
