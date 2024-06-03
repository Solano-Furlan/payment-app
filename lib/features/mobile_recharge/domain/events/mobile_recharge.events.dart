import 'package:payment_app/core/event_bus/event_bus.service.dart';
import 'package:payment_app/features/user/domain/models/recharge_info.model.dart';

class MobileRechargeCreatedEvent extends EventBusMessage {
  MobileRechargeCreatedEvent({
    required this.rechargeInfo,
  });

  final RechargeInfo rechargeInfo;
}
