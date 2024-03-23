part of 'craft_cubit.dart';

class CraftState {
  final int count;
  final bool isMultiDeleteEnabled;
  final Weapon? carouselSelectedWeapon;
  final Weapon? selectedWeaponForCraft;
  final List<String> selectedIdsForDelete;
  final List<CraftHistoryModel> craftHistory;

  CraftState({
    required this.count,
    required this.craftHistory,
    this.carouselSelectedWeapon,
    this.selectedWeaponForCraft,
    required this.isMultiDeleteEnabled,
    required this.selectedIdsForDelete,
  });

  CraftState copyWith({
    int? count,
    bool? isMultiDeleteEnabled,
    Weapon? selectedWeaponForCraft,
    Weapon? carouselSelectedWeapon,
    List<String>? selectedIdsForDelete,
    List<CraftHistoryModel>? craftHistory,
  }) {
    return CraftState(
      count: count ?? this.count,
      craftHistory: craftHistory ?? this.craftHistory,
      isMultiDeleteEnabled: isMultiDeleteEnabled ?? this.isMultiDeleteEnabled,
      selectedIdsForDelete: selectedIdsForDelete ?? this.selectedIdsForDelete,
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
      'craftHistory':
          cv.jsonEncode([...craftHistory.map((craft) => craft.toMap())]),
    };
  }

  factory CraftState.fromMap(Map<String, dynamic> map) {
    final carouselSelectedWeaponJson = map['carouselSelectedWeapon'] != null
        ? cv.jsonDecode(map['carouselSelectedWeapon'])
        : null;

    final selectedWeaponForCraftJson = map['selectedWeaponForCraft'] != null
        ? cv.jsonDecode(map['selectedWeaponForCraft'])
        : null;

    final craftHistoryJson = map['craftHistory'] != null
        ? cv.jsonDecode(map['craftHistory']) as List
        : null;

    final convertedHistory = craftHistoryJson != null
        ? craftHistoryJson.map((weapon) {
            return CraftHistoryModel.fromJson(
                weapon.runtimeType == String ? cv.jsonDecode(weapon) : weapon);
          }).toList()
        : <CraftHistoryModel>[];

    return CraftState(
      selectedIdsForDelete: [],
      count: map['count'] as int,
      isMultiDeleteEnabled: false,
      craftHistory: convertedHistory,
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
