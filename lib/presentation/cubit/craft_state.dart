part of 'craft_cubit.dart';

class CraftState {
  final int count;
  final Weapon? carouselSelectedWeapon;
  final Weapon? selectedWeaponForCraft;

  CraftState({
    required this.count,
    this.carouselSelectedWeapon,
    this.selectedWeaponForCraft,
  });

  CraftState copyWith({
    int? count,
    Weapon? carouselSelectedWeapon,
    Weapon? selectedWeaponForCraft,
  }) {
    return CraftState(
      count: count ?? this.count,
      carouselSelectedWeapon:
          carouselSelectedWeapon ?? this.carouselSelectedWeapon,
      selectedWeaponForCraft:
          selectedWeaponForCraft ?? this.selectedWeaponForCraft,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'carouselSelectedWeapon': carouselSelectedWeapon?.toJson(),
      'selectedWeaponForCraft': selectedWeaponForCraft?.toJson(),
    };
  }

  factory CraftState.fromMap(Map<String, dynamic> map) {
    final carouselSelectedWeaponJson = map['carouselSelectedWeapon'] != null
        ? cv.jsonDecode(map['carouselSelectedWeapon'])
        : null;

    final selectedWeaponForCraftJson = map['selectedWeaponForCraft'] != null
        ? cv.jsonDecode(map['selectedWeaponForCraft'])
        : null;

    return CraftState(
      count: map['count'] as int,
      carouselSelectedWeapon: carouselSelectedWeaponJson != null
          ? Weapon.fromJson(carouselSelectedWeaponJson)
          : null,
      selectedWeaponForCraft: selectedWeaponForCraftJson != null
          ? Weapon.fromJson(selectedWeaponForCraftJson)
          : null,
    );
  }
  String toJson() => cv.json.encode(toMap());

  factory CraftState.fromJson(String source) {
    return CraftState.fromMap(cv.json.decode(source) as Map<String, dynamic>);
  }

  @override
  String toString() =>
      'CraftState(selectedWeaponForCraft: Weapon(weaponName: ${selectedWeaponForCraft?.weaponName}), count: $count)';
}
