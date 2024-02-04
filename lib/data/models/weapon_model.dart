import 'dart:convert' as cv;

import 'package:flutter/foundation.dart' show immutable;

import 'package:l2helper_v2/domain/entities/weapon.dart';
import 'package:l2helper_v2/data/models/resource_model.dart';

@immutable
class WeaponModel {
  final String imageUrl;
  final String weaponName;
  final List<ResourceModel> weaponResources;

  const WeaponModel({
    required this.imageUrl,
    required this.weaponName,
    required this.weaponResources,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'weaponName': weaponName,
      'weaponResources': weaponResources,
    };
  }

  String toJson() => cv.json.encode(toMap());

  Weapon toEntity() {
    return Weapon(
      imageUrl: imageUrl,
      weaponName: weaponName,
      weaponResources: weaponResources.map((res) => res.toEntity()).toList(),
    );
  }

  factory WeaponModel.fromMap(Map<String, dynamic> map) {
    final weaponResources = map['weaponResources'] as List;
    return WeaponModel(
      imageUrl: map['imageUrl'] as String,
      weaponName: map['weaponName'] as String,
      weaponResources:
          weaponResources.map((e) => ResourceModel.fromMap(e)).toList(),
    );
  }

  factory WeaponModel.fromJson(Map<String, dynamic> map) =>
      WeaponModel.fromMap(map);
}
