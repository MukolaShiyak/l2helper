import 'package:flutter/cupertino.dart';
import 'package:l2helper_v2/pages/count_page/count_page.dart';
import 'package:l2helper_v2/pages/craft_page/crafp_page_container.dart';
import 'package:l2helper_v2/pages/craft_page/craft_page.dart';
import 'package:l2helper_v2/pages/main_page/main_page.dart';
import 'package:l2helper_v2/pages/page_with_carousel/carousel_page.dart';

class Keys {
  static final navKey = GlobalKey<NavigatorState>();
}

class Routes {
  static const String mainScreen = '/';

  static const String craftPage = '/craftPage';
  static const String carouselPage = '/carouselPage';
  static const String countPage = '/countPage';
}

final routes = {
  Routes.mainScreen: (BuildContext context) => const MainPage(),
  Routes.craftPage: (BuildContext context) => const CraftPageContainer(),
  Routes.carouselPage: (BuildContext context) => const CarouselPage(),
  Routes.countPage: (BuildContext context) => const CountPage(),
};

dynamic onGenerateRoutes = (RouteSettings settings) {
  return null;
};
