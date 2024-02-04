import 'dart:convert' as cv;

import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:l2helper_v2/usecase/get_weapons.dart';
import 'package:l2helper_v2/domain/entities/weapon.dart';
import 'package:l2helper_v2/domain/entities/resource.dart';

part 'craft_state.dart';

class CraftCubit extends HydratedCubit<CraftState> {
  final GetWeapons _getWeapons;

  CraftCubit(
    this._getWeapons,
  ) : super(CraftState(
          count: 1,
          title: '',
          imagePath: '',
          resouceModel: [],
        ));
  //       {
  //   hydrate();
  // }

  Future<List<Weapon>> getWeapons() async {
    final result = await _getWeapons.repository.getWeapons();
    print('result $result');
    return result.fold(
      (failure) {
        return [];
      },
      (data) {
        return data;
      },
    );
  }

  Future<void> setResourcesToState({
    required String title,
    required String imagePath,
    required List<Resource>? resouces,
  }) async {
    emit(state.copyWith(
      title: title,
      imagePath: imagePath,
      resouceModel: resouces,
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
      title: state.title,
      resouceModel: resources,
      imagePath: state.imagePath,
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
      title: state.title,
      resouceModel: resources,
      imagePath: state.imagePath,
    ));
  }

  Future<void> setNewValuesToState(List<String> ids) async {
    final resources = [...?state.resouceModel];
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
  }

  Future<void> setCount({required int craftCount}) async {
    emit(state.copyWith(
      count: craftCount,
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
        title: '',
        imagePath: '',
        resouceModel: [],
      );
    }
  }

  @override
  Map<String, dynamic> toJson(CraftState state) {
    addError(Exception('Couldn\'t write to a storage'), StackTrace.current);
    return state.toMap();
  }
}
