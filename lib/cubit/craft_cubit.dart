import 'dart:convert' as cv;

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:l2helper_v2/models/resource_model.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'craft_state.dart';
// import 'package:meta/meta.dart';

// part 'craft_cubit.freezed.dart';
part 'craft_state.dart';

class CraftCubit extends Cubit<CraftState> with HydratedMixin {
  CraftCubit()
      : super(CraftState(
          resouceModel: [],
          count: 1,
          isLowResources: false,
          lowResouceModel: [],
          title: '',
          imagePath: '',
        ));
  //       {
  //   hydrate();
  // }

  Future<void> setResourcesToState({
    required List<ResouceModel>? resouces,
    required List<ResouceModel>? lowResources,
    required String title,
    required String imagePath,
  }) async {
    emit(state.copyWith(
      resouceModel: resouces,
      lowResouceModel: lowResources,
      title: title,
      imagePath: imagePath,
    ));
  }

  Future<void> setCount({required int craftCount}) async {
    emit(state.copyWith(
      count: craftCount,
    ));
  }

  Future<void> changeView({required bool isLowRes}) async {
    emit(state.copyWith(isLowResources: isLowRes));
  }

  @override
  CraftState fromJson(Map<String, dynamic> json) {
    final craftState = CraftState.fromMap(json);

    return craftState;
  }

  @override
  Map<String, dynamic> toJson(CraftState state) {
    addError(Exception('Couldnt write to a storage'), StackTrace.current);
    return state.toMap();
  }
}
