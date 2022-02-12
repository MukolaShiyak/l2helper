import 'package:flutter/cupertino.dart';
import 'package:l2helper_v2/pages/craft_page/craft_page.dart';
import 'package:l2helper_v2/pages/main_page/main_page.dart';

class Keys {
  static final navKey = GlobalKey<NavigatorState>();
}

class Routes {
  static const String mainScreen = '/';

  static const String craftPage = '/craftPage';
  // static const String newGoal = '/new-goal';
  // static const String AddPoint = '/add-point';
}

final routes = {
  Routes.mainScreen: (BuildContext context) => const MainPage(),
  Routes.craftPage: (BuildContext context) => const CraftPage(),
  // Routes.activeGoals: (BuildContext context) => ActiveGoalsContainer(),
  // Routes.editGoal: (BuildContext context) => EditGoalContainer(),
  // Routes.newGoal: (BuildContext context) => NewGoalContainer(),
  // Routes.AddPoint: (BuildContext context) => OpenGoalCardContainer(),
  // Routes.archiveGoal: (BuildContext context) => ArchiveContainer(),
};

dynamic onGenerateRoutes = (RouteSettings settings) {
  return null;
};
