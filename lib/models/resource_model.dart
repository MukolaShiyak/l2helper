// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'resource_model.freezed.dart';

// part 'resource_model.g.dart';
import 'dart:convert' as cv;

class ResouceModel {
  final String title;
  final String quantity;
  final String image;
  final List<ResouceModel>? resources;
  bool isComplete;
  bool? showNextResourceLvl;

  ResouceModel({
    required this.title,
    required this.quantity,
    required this.image,
    this.resources,
    this.isComplete = false,
    this.showNextResourceLvl,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'quantity': quantity,
      'image': image,
      'resources': resources,
      'isComplete': isComplete,
      'showNextResourceLvl': showNextResourceLvl,
    };
  }

  factory ResouceModel.fromMap(dynamic json) {
    // final map = json.decode(json);
    final map = json is String ? cv.json.decode(json) : json;

    final result = ResouceModel(
      title: map['title'] as String,
      quantity: map['quantity'] as String,
      image: map['image'] as String,
      resources: map['resources'] != null
          ? (map['resources'] as List<dynamic>).map(
              (e1) {
                final map1 = cv.json.decode(e1);

                return ResouceModel(
                  image: map1['image'] ?? '',
                  quantity: map1['quantity'] ?? '',
                  title: map1['title'] ?? '',
                  isComplete: map1['isComplete'] ?? false,
                  showNextResourceLvl: map1['showNextResourceLvl'],
                  resources: map1['resources'] != null
                      ? (map1['resources'] as List<dynamic>).map(
                          (e2) {
                            final map2 = cv.json.decode(e2);

                            return ResouceModel(
                              image: map2['image'] ?? '',
                              quantity: map2['quantity'] ?? '',
                              title: map2['title'] ?? '',
                              isComplete: map2['isComplete'] ?? false,
                              showNextResourceLvl: map2['showNextResourceLvl'],
                              resources: map2['resources'] != null
                                  ? (map2['resources'] as List<dynamic>).map(
                                      (e3) {
                                        final map3 = cv.json.decode(e3);

                                        return ResouceModel(
                                          image: map3['image'] ?? '',
                                          quantity: map3['quantity'] ?? '',
                                          title: map3['title'] ?? '',
                                          isComplete:
                                              map3['isComplete'] ?? false,
                                          showNextResourceLvl:
                                              map3['showNextResourceLvl'],
                                        );
                                      },
                                    ).toList()
                                  : null,
                            );
                          },
                        ).toList()
                      : null,
                );
              },
            ).toList()
          : null,
      isComplete: map['isComplete'] ?? false,
      showNextResourceLvl: map['showNextResourceLvl'],
    );

    return result;
  }
  String toJson() => cv.json.encode(toMap());

  factory ResouceModel.fromJson(Map<String, dynamic> ssss) =>
      ResouceModel.fromMap(ssss);
}
