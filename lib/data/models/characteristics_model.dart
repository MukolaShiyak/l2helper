import 'dart:convert' as cv;

import 'package:flutter/foundation.dart' show immutable;

@immutable
class CharacteristicsModel {
  final String type;
  final String crystals;
  final String soulShots;
  final String magicalDamage;
  final String physicalDamage;

  const CharacteristicsModel({
    required this.type,
    required this.crystals,
    required this.soulShots,
    required this.magicalDamage,
    required this.physicalDamage,
  });

  static CharacteristicsModel emptyModel() {
    return CharacteristicsModel(
      type: '',
      crystals: '',
      soulShots: '',
      magicalDamage: '',
      physicalDamage: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'crystals': crystals,
      'soul_shots': soulShots,
      'magical_damage': magicalDamage,
      'physical_damage': physicalDamage,
    };
  }

  String toJson() => cv.json.encode(toMap());

  factory CharacteristicsModel.fromMap(Map<String, dynamic> map) {
    return CharacteristicsModel(
      type: map['type'] as String,
      crystals: map['crystals'] as String,
      soulShots: map['soul_shots'] as String,
      magicalDamage: map['magical_damage'] as String,
      physicalDamage: map['physical_damage'] as String,
    );
  }

  factory CharacteristicsModel.fromJson(Map<String, dynamic> map) =>
      CharacteristicsModel.fromMap(map);
}
