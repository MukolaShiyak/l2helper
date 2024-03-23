import 'dart:convert' as cv;

import 'package:flutter/foundation.dart' show immutable;

import 'package:l2helper/domain/entities/resource.dart';
import 'package:l2helper/data/models/characteristics_model.dart';

@immutable
class Weapon {
  final String imageUrl;
  final String weaponName;
  final List<Resource> weaponResources;
  final CharacteristicsModel characteristics;

  const Weapon({
    required this.imageUrl,
    required this.weaponName,
    required this.weaponResources,
    required this.characteristics,
  });

  static Weapon emptyWeapon() {
    return Weapon(
      imageUrl: '',
      weaponName: '',
      weaponResources: const [],
      characteristics: CharacteristicsModel.emptyModel(),
    );
  }

  Map<String, dynamic> _toMap() {
    return {
      'imageUrl': imageUrl,
      'weaponName': weaponName,
      'weaponResources': weaponResources,
      'characteristics': characteristics.toJson(),
    };
  }

  Weapon updateResourceProgress(List<Resource> resources) {
    return Weapon(
      imageUrl: imageUrl,
      weaponName: weaponName,
      weaponResources: resources,
      characteristics: characteristics,
    );
  }

  String toJson() => cv.json.encode(_toMap());

  factory Weapon._fromMap(Map<String, dynamic> map) {
    final weaponResources = map['weaponResources'] as List;
    final characteristics = (map['characteristics'] is String)
        ? cv.jsonDecode(map['characteristics'])
        : map['characteristics'];

    return Weapon(
      imageUrl: map['imageUrl'] as String,
      weaponName: map['weaponName'] as String,
      weaponResources: weaponResources
          .map((e) => Resource.fromJson(cv.jsonDecode(e)))
          .toList(),
      characteristics: CharacteristicsModel.fromJson(characteristics),
    );
  }

  factory Weapon.fromJson(Map<String, dynamic> map) => Weapon._fromMap(map);
}
