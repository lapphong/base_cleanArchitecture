import 'package:flutter/material.dart';
import '../../../shared/shared.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

enum InitialAppRoute { login, main }

// @JsonEnum()
enum Gender {
  male(Constants.male),
  female(Constants.female),
  other(Constants.other),
  unknown(Constants.unknown);

  const Gender(this.serverValue);
  final int serverValue;

  static const defaultValue = unknown;

  String toJson() => serverValue.toString();
}

// enum LanguageCode {
//   en(localeCode: LocaleConstants.en, serverValue: ServerRequestResponseConstants.en),
//   ja(localeCode: LocaleConstants.ja, serverValue: ServerRequestResponseConstants.ja);

//   const LanguageCode({required this.localeCode, required this.serverValue});

//   final String localeCode;
//   final String serverValue;

//   static const defaultValue = ja;
// }

// enum NotificationType {
//   unknown,
//   newPost,
//   liked;

//   static const defaultValue = unknown;
// }

enum BottomTab {
  home(icon: Icon(Icons.home), activeIcon: Icon(Icons.home)),
  notifications(icon: Icon(Icons.notifications), activeIcon: Icon(Icons.notifications)),
  setting(icon: Icon(Icons.settings), activeIcon: Icon(Icons.settings));

  const BottomTab({required this.icon, required this.activeIcon});

  final Icon icon;
  final Icon activeIcon;

  String get label {
    switch (this) {
      case BottomTab.home:
        // return S.current.home;
        return 'Home';
      case BottomTab.notifications:
        return 'Noti';
      case BottomTab.setting:
        return 'Setting';
    }
  }
}
