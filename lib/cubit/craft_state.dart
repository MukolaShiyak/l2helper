part of 'craft_cubit.dart';

class CraftState {
  final List<ResouceModel>? resouceModel;
  final List<ResouceModel>? lowResouceModel;
  final String title;
  final int count;
  final bool isLowResources;
  final String imagePath;

  CraftState({
    required this.resouceModel,
    required this.lowResouceModel,
    required this.title,
    required this.count,
    required this.isLowResources,
    required this.imagePath,
  });

  CraftState copyWith({
    List<ResouceModel>? resouceModel,
    List<ResouceModel>? lowResouceModel,
    String? title,
    int? count,
    bool? isLowResources,
    String? imagePath,
  }) {
    return CraftState(
      resouceModel: resouceModel ?? this.resouceModel,
      lowResouceModel: lowResouceModel ?? this.lowResouceModel,
      title: title ?? this.title,
      count: count ?? this.count,
      isLowResources: isLowResources ?? this.isLowResources,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'resouceModel': resouceModel?.map((e) => e.toMap()).toList(),
      'lowResouceModel': lowResouceModel?.map((e) => e.toMap()).toList(),
      'title': title,
      'count': count,
      'isLowResources': isLowResources,
      'imagePath': imagePath,
    };
  }

  factory CraftState.fromMap(Map<String, dynamic> map) {
    // late CraftState test;
    // try {
    // test =
    return CraftState(
      resouceModel: (map['resouceModel'] as List<dynamic>)
          .map((e) => ResouceModel.fromMap(e))
          .toList(),
      lowResouceModel: (map['lowResouceModel'] as List<dynamic>)
          .map((e) => ResouceModel.fromMap(e))
          .toList(),
      title: map['title'] as String,
      count: map['count'] as int,
      isLowResources: map['isLowResources'] as bool,
      imagePath: map['imagePath'] as String,
    );
    // } catch (e) {
    //   print((e as Error).stackTrace);
    //   print((e as Error).toString());
    // } finally {
    //   print('dgsffsgs $test');
    //   return test;
    // }
  }
  String toJson() => cv.json.encode(toMap());

  factory CraftState.fromJson(String source) {
    return CraftState.fromMap(cv.json.decode(source) as Map<String, dynamic>);
  }

  @override
  String toString() =>
      'CraftState(resouceModel: $resouceModel, lowResouceModel: $lowResouceModel, count: $count, title: $title, isLowResources: $isLowResources)';
}
