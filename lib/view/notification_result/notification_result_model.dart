import 'package:riverpod_test_application/item/notification_value.dart';
import 'package:riverpod_test_application/service/json_service.dart';

class NotificationResultModel {
  final jsonService = JsonService();

  NotificationValue payloadConvert(String payload) =>
      jsonService.payloadConverter(payload);
}
