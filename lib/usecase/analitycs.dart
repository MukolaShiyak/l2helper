import 'package:l2helper/repositories/analytics_service_repository.dart';

class Analytics {
  final AnalyticsServiceRepository repository;

  Analytics(this.repository);

  void recordEvent(String eventName) {
    repository.recordEvent(eventName);
  }
}
