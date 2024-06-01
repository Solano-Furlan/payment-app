import 'package:injectable/injectable.dart';
import 'package:payment_app/core/event_bus/event_bus.service.dart';

@module
abstract class EventBusModule {
  @lazySingleton
  EventBus eventBus() => EventBus();
}
