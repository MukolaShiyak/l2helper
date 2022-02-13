import 'package:l2helper_v2/models/resource_model.dart';

class CraftModel {
  final ResouceModel reciepe;
  final ResouceModel shaft;
  final ResouceModel warsmithHolder;
  final bool? isComplete;

  CraftModel({
    required this.reciepe,
    required this.shaft,
    required this.warsmithHolder,
    this.isComplete,
  });
}
