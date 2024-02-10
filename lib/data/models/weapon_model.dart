import 'dart:convert' as cv;

import 'package:flutter/foundation.dart' show immutable;

import 'package:l2helper_v2/domain/entities/weapon.dart';
import 'package:l2helper_v2/data/models/resource_model.dart';
import 'package:l2helper_v2/data/models/characteristics_model.dart';

@immutable
class WeaponModel {
  final String imageUrl;
  final String weaponName;
  final List<ResourceModel> weaponResources;
  final CharacteristicsModel characteristics;

  const WeaponModel({
    required this.imageUrl,
    required this.weaponName,
    required this.weaponResources,
    required this.characteristics,
  });

  Map<String, dynamic> _toMap() {
    return {
      'imageUrl': imageUrl,
      'weaponName': weaponName,
      'weaponResources': weaponResources,
      'characteristics': characteristics.toJson(),
    };
  }

  String toJson() => cv.json.encode(_toMap());

  Weapon toEntity() {
    return Weapon(
      imageUrl: imageUrl,
      weaponName: weaponName,
      weaponResources: weaponResources.map((res) => res.toEntity()).toList(),
      characteristics: characteristics,
    );
  }

  factory WeaponModel._fromMap(Map<String, dynamic> map) {
    final weaponResources = map['weaponResources'] as List;
    return WeaponModel(
      imageUrl: map['imageUrl'] as String,
      weaponName: map['weaponName'] as String,
      weaponResources:
          weaponResources.map((e) => ResourceModel.fromJson(e)).toList(),
      characteristics: CharacteristicsModel.fromJson(map['characteristics']),
    );
  }

  factory WeaponModel.fromJson(Map<String, dynamic> map) =>
      WeaponModel._fromMap(map);
}
