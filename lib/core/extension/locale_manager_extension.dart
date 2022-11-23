import '../constants/enums/locale_manager_enum.dart';

extension LocaleManagerExtension on LocaleManagerKey {
  String get rawValue {
    switch (this) {
      case LocaleManagerKey.USER_ID:
        return 'userId';
    }
  }
}
