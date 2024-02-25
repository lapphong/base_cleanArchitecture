import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/app.dart';
import '../../shared/shared.dart';
import '../app_initializer.dart';
import '../di/di.dart' as di;

class InitializerConfig extends ApplicationConfig {
  factory InitializerConfig.getInstance() {
    return _instance;
  }

  InitializerConfig._();

  static final InitializerConfig _instance = InitializerConfig._();

  @override
  Future<void> config() async {
    di.configureInjection();
    await di.getIt.get<AppInfo>().init();
    Bloc.observer = AppBlocObserver();
    await ViewUtils.setPreferredOrientations(DeviceUtils.deviceType == DeviceType.mobile
        ? UiConstants.mobileOrientation
        : UiConstants.tabletOrientation);
    ViewUtils.setSystemUIOverlayStyle(UiConstants.systemUiOverlay);
    // await LocalPushNotificationHelper.init();
  }
}
