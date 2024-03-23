import 'package:flutter/cupertino.dart';

import 'package:l2helper/presentation/pages/main_page/main_page.dart';
import 'package:l2helper/presentation/pages/craft_page/craft_page.dart';
import 'package:l2helper/presentation/pages/count_page/quantity_page.dart';
import 'package:l2helper/presentation/pages/history_page/history_page.dart';
import 'package:l2helper/presentation/pages/page_with_carousel/carousel_page.dart';

class Keys {
  static final navKey = GlobalKey<NavigatorState>();
}

@immutable
class Routes {
  static const String mainScreen = '/';

  static const String craftPage = '/craftPage';
  static const String historyPage = '/historyPage';
  static const String quantityPage = '/quantityPage';
  static const String carouselPage = '/carouselPage';
}

final routes = {
  Routes.mainScreen: (BuildContext context) => const MainPage(),
  Routes.craftPage: (BuildContext context) => const CraftPage(),
  Routes.historyPage: (BuildContext context) => const HistoryPage(),
  Routes.quantityPage: (BuildContext context) => const QuantityPage(),
  Routes.carouselPage: (BuildContext context) => const CarouselPage(),
};

dynamic onGenerateRoutes = (RouteSettings settings) {
  return null;
};
