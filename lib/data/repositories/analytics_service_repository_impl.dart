import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:l2helper/repositories/analytics_service_repository.dart';

class AnalyticsServiceRepositoryImpl extends AnalyticsServiceRepository {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  void recordEvent(String eventName) {
    _analytics.logEvent(name: eventName);
  }
}
