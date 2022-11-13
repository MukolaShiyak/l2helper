import 'package:l2helper_v2/models/resource_model.dart';

bool isChildsOfThirdResourceCompleted({required ResouceModel resourceLvl}) {
  return resourceLvl.resources
          ?.every((element) => element.isComplete == true) ??
      false;
}
