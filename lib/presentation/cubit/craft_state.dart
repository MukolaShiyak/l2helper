part of 'craft_cubit.dart';

class CraftState {
  final int count;
  final String title;
  final String imagePath;
  final List<Resource>? resouceModel;

  CraftState({
    required this.title,
    required this.count,
    required this.imagePath,
    required this.resouceModel,
  });

  CraftState copyWith({
    int? count,
    String? title,
    String? imagePath,
    List<Resource>? resouceModel,
  }) {
    return CraftState(
      title: title ?? this.title,
      count: count ?? this.count,
      imagePath: imagePath ?? this.imagePath,
      resouceModel: resouceModel ?? this.resouceModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'count': count,
      'imagePath': imagePath,
      'resouceModel': resouceModel?.map((e) => e.toMap()).toList(),
    };
  }

  factory CraftState.fromMap(Map<String, dynamic> map) {
    return CraftState(
      count: map['count'] as int,
      title: map['title'] as String,
      imagePath: map['imagePath'] as String,
      resouceModel: (map['resouceModel'] as List<dynamic>)
          .map((e) => Resource.fromMap(e))
          .toList(),
    );
  }
  String toJson() => cv.json.encode(toMap());

  factory CraftState.fromJson(String source) {
    return CraftState.fromMap(cv.json.decode(source) as Map<String, dynamic>);
  }

  @override
  String toString() =>
      'CraftState(resouceModel: $resouceModel, count: $count, title: $title)';
}
