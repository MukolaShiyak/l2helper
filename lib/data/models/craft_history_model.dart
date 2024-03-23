import 'dart:convert' as cv;

import 'package:flutter/foundation.dart' show immutable;

import 'package:l2helper/domain/entities/weapon.dart';

@immutable
class CraftHistoryModel {
  final String id;
  final Weapon weapon;
  final int craftCount;

  const CraftHistoryModel({
    required this.id,
    required this.weapon,
    required this.craftCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'craftCount': craftCount,
      'weapon': {
        'imageUrl': weapon.imageUrl,
        'weaponName': weapon.weaponName,
        'characteristics': weapon.characteristics,
        'weaponResources': weapon.weaponResources,
      },
    };
  }

  String toJson() => cv.json.encode(toMap());

  factory CraftHistoryModel._fromMap(Map<String, dynamic> map) {
    return CraftHistoryModel(
      id: map['id'],
      craftCount: map['craftCount'],
      weapon: Weapon.fromJson(map['weapon']),
    );
  }

  factory CraftHistoryModel.fromJson(Map<String, dynamic> map) =>
      CraftHistoryModel._fromMap(map);
}
