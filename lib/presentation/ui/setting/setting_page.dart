import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app.dart';
import '../../presentation.dart';

@RoutePage()
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends BasePageState<SettingPage, SettingBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => bloc.add(const LogoutButtonPressed()),
              child: Text('Logout', style: context.textTheme.labelMedium),
            ),
            SizedBox(height: 15.rps),
            BlocBuilder<AppBloc, AppState>(
              buildWhen: (previous, current) => previous.isDarkTheme != current.isDarkTheme,
              builder: (context, state) {
                return SwitchListTile.adaptive(
                  title: Text('Dark mode', style: context.textTheme.labelMedium),
                  tileColor: context.theme.colorScheme.primary,
                  value: state.isDarkTheme,
                  onChanged: (isDarkTheme) => appBloc.add(
                    AppThemeChanged(isDarkTheme: isDarkTheme),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
