import 'dart:async';
import 'package:auto_route_example/core/extension/locale_manager_extension.dart';
import 'package:auto_route_example/model/user.dart';
import 'package:uuid/uuid.dart';

import '../../core/constants/enums/locale_manager_enum.dart';
import '../../core/init/cache/locale_manager.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  LocaleManager _localeManager = LocaleManager.instance;

  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    var value =
        _localeManager.getStringValue(LocaleManagerKey.USER_ID.rawValue);
    if (value != '') {
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    var user = User(id: Uuid().v4());
    _localeManager.setStringValue(LocaleManagerKey.USER_ID.rawValue, user.id!);
    _controller.add(AuthenticationStatus.authenticated);
  }

  void logOut() {
    _localeManager.removeKey(LocaleManagerKey.USER_ID.rawValue);
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
