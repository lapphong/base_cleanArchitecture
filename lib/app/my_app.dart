import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../domain/domain.dart';
import '../initializer/initializer.dart';
import '../presentation/presentation.dart';
import '../shared/shared.dart';
import 'app.dart';

class MyApp extends StatefulWidget {
  const MyApp({required this.initialResource, super.key});
  final List<InitialAppRoute> initialResource;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends BasePageState<MyApp, AppBloc> {
  final _appRouter = getIt.get<AppRouter>();

  @override
  bool get isAppWidget => true;

  @override
  void initState() {
    super.initState();
    bloc.add(const AppInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    final theme = ThemeData();

    return ScreenUtilInit(
      designSize: const Size(Constants.designDeviceWidth, Constants.designDeviceHeight),
      builder: (context, _) => BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) => previous.isDarkTheme != current.isDarkTheme,
        // || previous.languageCode != current.languageCode,
        builder: (context, state) {
          return MaterialApp.router(
            builder: (context, child) {
              final MediaQueryData data = MediaQuery.of(context);

              return MediaQuery(
                data: data.copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child ?? const SizedBox.shrink(),
              );
            },
            routerDelegate: _appRouter.delegate(
              deepLinkBuilder: (deepLink) {
                return DeepLink(_mapRouteToPageRouteInfo());
              },
              navigatorObservers: () => [AppNavigatorObserver()],
            ),
            routeInformationParser: _appRouter.defaultRouteParser(),
            title: UiConstants.materialAppTitle,
            color: UiConstants.taskMenuMaterialAppColor,
            themeMode: state.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            theme: theme.getTheme(Brightness.light),
            darkTheme: theme.getTheme(Brightness.dark),
            debugShowCheckedModeBanner: false,
            // localeResolutionCallback: (Locale? locale, Iterable<Locale> supportedLocales) =>
            //     supportedLocales.contains(locale)
            //         ? locale
            //         : const Locale(LocaleConstants.defaultLocale),
            // locale: Locale(state.languageCode.localeCode),
            // supportedLocales: S.delegate.supportedLocales,
            // localizationsDelegates: const [
            //   S.delegate,
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            // ],
          );
        },
      ),
    );
  }

  List<PageRouteInfo> _mapRouteToPageRouteInfo() {
    return widget.initialResource.map<PageRouteInfo>((e) {
      switch (e) {
        case InitialAppRoute.login:
          return const LoginRoute();
        case InitialAppRoute.main:
          return const MainRoute();
      }
    }).toList(growable: false);
  }
}
