// // import 'package:json_annotation/json_annotation.dart';
// import 'package:l2helper_v2/models/resource_model.dart';

// // part 'craft_state.g.dart';

// part of 'craft_cubit.dart';

// // @JsonSerializable(anyMap: true)
// class CraftState {
//   final List<ResouceModel>? resouceModel;
//   final List<ResouceModel>? lowResouceModel;
//   final String title;
//   final int count;
//   final bool isLowResources;

//   CraftState({
//     required this.resouceModel,
//     required this.lowResouceModel,
//     required this.title,
//     required this.count,
//     required this.isLowResources,
//   });

//   CraftState copyWith({
//     List<ResouceModel>? resouceModel,
//     List<ResouceModel>? lowResouceModel,
//     String? title,
//     int? count,
//     bool? isLowResources,
//   }) {
//     return CraftState(
//       resouceModel: resouceModel ?? this.resouceModel,
//       lowResouceModel: lowResouceModel ?? this.lowResouceModel,
//       title: title ?? this.title,
//       count: count ?? this.count,
//       isLowResources: isLowResources ?? this.isLowResources,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'resouceModel': resouceModel?.map((e) => e.toMap()).toList(),
//       'lowResouceModel': lowResouceModel?.map((e) => e.toMap()).toList(),
//       'title': title,
//       'count': count,
//       'isLowResources': isLowResources,
//     };
//   }

//   factory CraftState.fromMap(Map<String, dynamic> map) {
//     print('tratata ${map['count'].runtimeType}');
//     late CraftState test;
//     print('askndsjakda ${map['lowResouceModel'].runtimeType}');
//     try {
//       test = CraftState(
//         resouceModel: (map['resouceModel'] as List<dynamic>)
//             .map((e) => ResouceModel.fromMap(e as Map<String, dynamic>))
//             .toList(),
//         lowResouceModel: (map['lowResouceModel'] as List<dynamic>)
//             .map((e) => ResouceModel.fromMap(e as Map<String, dynamic>))
//             .toList(),
//         title: map['title'] as String,
//         count: map['count'] as int,
//         isLowResources: map['isLowResources'] as bool,
//       );
//     } catch (e) {
//       print((e as Error).stackTrace);
//       print((e as Error).toString());
//     } finally {
//       print('dgsffsgs $test');
//       return test;
//     }
//   }
//   String toJson() => json.encode(toMap());

//   factory CraftState.fromJson(String source) =>
//       CraftState.fromMap(json.decode(source) as Map<String, dynamic>);

//   // factory CraftState.fromJson(Map json) => _$CraftStateFromJson(json);

//   // Map<String, dynamic> toJson() => _$CraftStateToJson(this);

//   @override
//   String toString() =>
//       'CraftState(resouceModel: $resouceModel, lowResouceModel: $lowResouceModel, count: $count, title: $title, isLowResources: $isLowResources)';
// }
