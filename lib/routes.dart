import 'package:flutter/cupertino.dart';

import 'package:l2helper_v2/presentation/pages/main_page/main_page.dart';
import 'package:l2helper_v2/presentation/pages/craft_page/craft_page.dart';
import 'package:l2helper_v2/presentation/pages/count_page/count_page.dart';
import 'package:l2helper_v2/presentation/pages/page_with_carousel/carousel_page.dart';

class Keys {
  static final navKey = GlobalKey<NavigatorState>();
}

@immutable
class Routes {
  static const String mainScreen = '/';

  static const String craftPage = '/craftPage';
  static const String quantityPage = '/quantityPage';
  static const String carouselPage = '/carouselPage';
}

final routes = {
  Routes.mainScreen: (BuildContext context) => const MainPage(),
  Routes.craftPage: (BuildContext context) => const CraftPage(),
  Routes.quantityPage: (BuildContext context) => const QuantityPage(),
  Routes.carouselPage: (BuildContext context) => const CarouselPage(),
};

dynamic onGenerateRoutes = (RouteSettings settings) {
  return null;
};
