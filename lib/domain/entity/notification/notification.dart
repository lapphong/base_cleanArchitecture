import 'package:freezed_annotation/freezed_annotation.dart';

import 'msg.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  const factory Notification({
    @Default(Notification.defaultTotal) int total,
    @Default(Notification.defaultNumberNew) int numberNew,
    @Default(Notification.defaultMsg) List<Msg> msg,
  }) = _Notification;

  static const defaultTotal = 0;
  static const defaultNumberNew = 0;
  static const defaultMsg = <Msg>[];

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}
