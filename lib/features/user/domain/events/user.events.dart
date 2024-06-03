import 'package:payment_app/core/event_bus/event_bus.service.dart';

class UserBalanceUpdatedEvent extends EventBusMessage {
  UserBalanceUpdatedEvent({
    required this.balance,
  });

  final double balance;
}
