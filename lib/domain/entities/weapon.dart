import 'package:flutter/foundation.dart' show immutable;

import 'package:l2helper_v2/domain/entities/resource.dart';

@immutable
class Weapon {
  final String imageUrl;
  final String weaponName;
  final List<Resource> weaponResources;

  const Weapon({
    required this.imageUrl,
    required this.weaponName,
    required this.weaponResources,
  });
}
