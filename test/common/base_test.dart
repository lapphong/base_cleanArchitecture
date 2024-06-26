import 'package:base_clean_architecture/data/data.dart';
import 'package:base_clean_architecture/shared/shared.dart';
import 'package:mocktail/mocktail.dart';

class _MockAppPreferences extends Mock implements AppPreferences {}

class _MockConnectivityHelper extends Mock implements ConnectivityHelper {}

class _MockDeviceHelper extends Mock implements DeviceHelper {}

class _MockAppInfo extends Mock implements AppInfo {}

final appPreferences = _MockAppPreferences();
final connectivityHelper = _MockConnectivityHelper();
final deviceHelper = _MockDeviceHelper();
final appInfo = _MockAppInfo();
