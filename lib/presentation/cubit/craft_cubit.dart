import 'dart:convert' as cv;

import 'package:uuid/uuid.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:l2helper/usecase/analitycs.dart';

import 'package:l2helper/usecase/get_weapons.dart';
import 'package:l2helper/usecase/sound_effect.dart';
import 'package:l2helper/domain/entities/weapon.dart';
import 'package:l2helper/domain/entities/resource.dart';
import 'package:l2helper/data/models/craft_history_model.dart';

part 'craft_state.dart';

class CraftCubit extends HydratedCubit<CraftState> {
  final GetWeapons _getWeapons;
  final SoundEffect _soundEffect;
  final Analytics _analytics;

  CraftCubit(
    this._getWeapons,
    this._soundEffect,
    this._analytics,
  ) : super(CraftState(
          count: 1,
          craftHistory: [],
          selectedIdsForDelete: [],
          isMultiDeleteEnabled: false,
          carouselSelectedWeapon: null,
          selectedWeaponForCraft: null,
        ));

  Future<List<Weapon>> getWeapons() async {
    final result = await _getWeapons.repository.getWeapons();
    return result.fold(
      (failure) {
        return [];
      },
      (data) {
        return data;
      },
    );
  }

  void changeMultiDeleteState({String? id}) {
    if (!state.isMultiDeleteEnabled &&
        !state.selectedIdsForDelete.contains(id) &&
        id != null) {
      final newIdsList = [...state.selectedIdsForDelete];
      newIdsList.add(id);
      emit(
        state.copyWith(
          selectedIdsForDelete: newIdsList,
          isMultiDeleteEnabled: !state.isMultiDeleteEnabled,
        ),
      );
    } else {
      emit(state.copyWith(
        selectedIdsForDelete: [],
        isMultiDeleteEnabled: !state.isMultiDeleteEnabled,
      ));
    }
  }

  void addIdForDelete(String id) {
    if (state.selectedIdsForDelete.contains(id)) {
      final newList = [...state.selectedIdsForDelete];
      newList.removeWhere((idl) => idl == id);
      emit(state.copyWith(selectedIdsForDelete: newList));
    } else {
      final newList = [...state.selectedIdsForDelete];
      newList.add(id);
      emit(state.copyWith(selectedIdsForDelete: newList));
    }
  }

  void deleteSelectedCards() {
    final newHistoryList = [...state.craftHistory];
    for (var id in state.selectedIdsForDelete) {
      newHistoryList.removeWhere((historyCraft) => historyCraft.id == id);
    }
    emit(
      state.copyWith(
        selectedIdsForDelete: [],
        isMultiDeleteEnabled: false,
        craftHistory: newHistoryList,
      ),
    );
  }

  Future<void> setResourcesToState({
    required Weapon carouselSelectedWeapon,
  }) async {
    emit(state.copyWith(
      carouselSelectedWeapon: carouselSelectedWeapon,
    ));
  }

  void _updateAllResources({
    required bool isComplete,
    required List<Resource> resources,
  }) {
    for (final resource in resources) {
      resource.isComplete = isComplete;
      if (resource.resources != null) {
        _updateAllResources(
          isComplete: isComplete,
          resources: resource.resources!,
        );
      }
    }
  }

  Future<void> _updateDataById({
    required List<String> ids,
    required Resource resource,
  }) async {
    if (ids.length > 1 && resource.resources != null) {
      final resourceIndex =
          resource.resources!.indexWhere((res) => res.id == ids.first);
      ids.removeAt(0);
      await _updateDataById(
        ids: ids,
        resource: resource.resources![resourceIndex],
      );
    }

    if (ids.length == 1) {
      final resourceIndex =
          resource.resources!.indexWhere((res) => res.id == ids.first);
      final newRes = resource.resources![resourceIndex];
      newRes.isComplete = !newRes.isComplete;
      ids.removeAt(0);
      if (newRes.resources != null) {
        _updateAllResources(
          resources: newRes.resources!,
          isComplete: newRes.isComplete,
        );
      }
    }
  }

  Future<void> _searchLastElementInNesting({
    required List<String> ids,
    required List<String> copyIds,
    required Resource resource,
    required Resource parentResource,
  }) async {
    final resourceIndex =
        resource.resources!.indexWhere((res) => res.id == ids.first);
    ids.removeAt(0);
    await _checkAndUpdateParentResources(
      ids: ids,
      copyIds: copyIds,
      parentResource: parentResource,
      resource: resource.resources![resourceIndex],
    );
  }

  Future<void> _processLastFindedElementInNesting({
    required List<String> ids,
    required List<String> copyIds,
    required Resource resource,
    required Resource parentResource,
  }) async {
    final resourceIndex =
        resource.resources!.indexWhere((res) => res.id == ids.first);
    final newRes = resource.resources![resourceIndex];
    if (newRes.resources != null) {
      final allChildrenCompleted =
          newRes.resources!.every((element) => element.isComplete);
      newRes.isComplete = allChildrenCompleted;
    }

    ids.removeAt(0);
    copyIds.removeLast();
    _checkAndUpdateParentResources(
      copyIds: copyIds,
      ids: [...copyIds],
      resource: parentResource,
      parentResource: parentResource,
    );
  }

  Future<void> _checkAndUpdateParentResources({
    required List<String> ids,
    required List<String> copyIds,
    required Resource resource,
    required Resource parentResource,
  }) async {
    // якщо довжина ids > 1 шукаємо остатні елемент дерева вкладеностей по ідентифікатору, і викликаємо цю саму функцію рекурсивно
    if (ids.length > 1 && resource.resources != null) {
      _searchLastElementInNesting(
        ids: ids,
        copyIds: copyIds,
        resource: resource,
        parentResource: parentResource,
      );
    }

    // якщо список == 1, тоді ми дійшли до остатнього елементу по нашому ідентифікатору і маємо перевірити чи всі дочірні isComplete, якщо всі тоді маємо задати батьківському також true
    if (ids.length == 1) {
      _processLastFindedElementInNesting(
        ids: ids,
        copyIds: copyIds,
        resource: resource,
        parentResource: parentResource,
      );
    }

    if (ids.isEmpty && copyIds.isEmpty) {
      _processTopLevelResource(parentResource);
    }
  }

  void _processTopLevelResource(Resource parentResource) {
    if (parentResource.resources != null) {
      final allChildrenCompleted =
          parentResource.resources!.every((element) => element.isComplete);
      parentResource.isComplete = allChildrenCompleted;
    }
  }

  void _processFirstLevelNesting(List<Resource> resources, List<String> ids) {
    final indexOfResource =
        resources.indexWhere((resource) => resource.id == ids.first);
    var newRes = resources[indexOfResource];
    newRes.isComplete = !newRes.isComplete;

    if (newRes.resources != null) {
      _updateAllResources(
        resources: newRes.resources!,
        isComplete: newRes.isComplete,
      );
    }
    resources.removeAt(indexOfResource);
    resources.insert(indexOfResource, newRes);
    emit(state.copyWith(
      selectedWeaponForCraft:
          state.selectedWeaponForCraft?.updateResourceProgress(resources),
    ));
  }

  void _processMoreLevesOfNesting({
    required List<String> ids,
    required int nestingQuantity,
    required List<Resource> resources,
  }) async {
    final listIds = [...ids];
    final copyIds = [...listIds];
    final indexOfResource =
        resources.indexWhere((resource) => resource.id == listIds.first);
    var newRes = resources[indexOfResource];
    listIds.removeAt(0);
    await _updateDataById(ids: [...listIds], resource: newRes);
    listIds.removeLast();
    copyIds.removeAt(0);
    if (copyIds.isNotEmpty) {
      await _checkAndUpdateParentResources(
        resource: newRes,
        ids: [...copyIds],
        copyIds: [...copyIds],
        parentResource: newRes,
      );
    }

    emit(state.copyWith(
      selectedWeaponForCraft:
          state.selectedWeaponForCraft?.updateResourceProgress(resources),
    ));
  }

  Future<void> setNewValuesToState(List<String> ids) async {
    final resources = [...?state.selectedWeaponForCraft?.weaponResources];
    final nestingQuantity = ids.length;
    if (nestingQuantity == 1) {
      _processFirstLevelNesting(resources, ids);
    } else {
      _processMoreLevesOfNesting(
        ids: ids,
        resources: resources,
        nestingQuantity: nestingQuantity,
      );
    }
    _soundEffect.makeSound();
  }

  Future<void> setCount({required int craftCount}) async {
    emit(state.copyWith(
      count: craftCount,
      selectedWeaponForCraft: state.carouselSelectedWeapon,
    ));

    final eventName =
        state.selectedWeaponForCraft?.weaponName.split(' ').join('_');

    print('eventName: Add_Craft_${eventName}_$craftCount');

    _analytics.recordEvent('Add_Craft_${eventName}_$craftCount');
  }

  Future<void> completeCraft() async {
    final emptyWeapon = Weapon.emptyWeapon();
    final craftHistory = [...state.craftHistory];
    final completedCraft = state.selectedWeaponForCraft;
    final currentCraftHistory = CraftHistoryModel(
      id: const Uuid().v4(),
      weapon: completedCraft!,
      craftCount: state.count,
    );

    final eventName = completedCraft.weaponName.split(' ').join('_');

    print('eventName: Complete_Craft_${eventName}_${state.count}');

    _analytics.recordEvent('Complete_Craft_${eventName}_${state.count}');

    // if (completedCraft == null) return;
    craftHistory.insert(0, currentCraftHistory);

    emit(state.copyWith(
      count: 0,
      craftHistory: craftHistory,
      selectedWeaponForCraft: emptyWeapon,
    ));
  }

  @override
  CraftState fromJson(Map<String, dynamic> json) {
    try {
      final craftState = CraftState.fromMap(json);

      return craftState;
    } catch (e) {
      return CraftState(
        count: 1,
        craftHistory: [],
        selectedIdsForDelete: [],
        isMultiDeleteEnabled: false,
        carouselSelectedWeapon: null,
        selectedWeaponForCraft: null,
      );
    }
  }

  @override
  Map<String, dynamic> toJson(CraftState state) {
    addError(Exception('Couldn\'t write to a storage'), StackTrace.current);
    return state.toMap();
  }
}
