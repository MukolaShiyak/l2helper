import 'dart:convert' as cv;

import 'package:intl/intl.dart';

class Resource {
  bool isComplete;
  final String id;
  final String title;
  final String image;
  final String quantity;
  final List<Resource>? resources;

  Resource({
    this.resources,
    required this.id,
    required this.title,
    required this.image,
    required this.quantity,
    required this.isComplete,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'quantity': quantity,
      'resources': resources,
      'isComplete': isComplete,
    };
  }

  String showingQuantity({
    int? parentCount,
    required int craftCount,
  }) {
    if (parentCount != null) {
      return formattedNumber
          .format(parentCount * int.parse(quantity) * craftCount);
    }
    return formattedNumber.format(int.parse(quantity) * craftCount);
  }

  factory Resource.fromMap(Map<String, dynamic> map) {
    var resourcesList = map['resources'] as List?;
    List<Resource>? resources;

    if (resourcesList != null) {
      resources = resourcesList
          .map((resource) => Resource.fromMap(cv.jsonDecode(resource)))
          .toList();
    }

    return Resource(
      resources: resources,
      id: map['id'] as String,
      image: map['image'] as String,
      title: map['title'] as String,
      quantity: map['quantity'] as String,
      isComplete: map['isComplete'] ?? false,
    );
  }

  String toJson() => cv.json.encode(toMap());

  factory Resource.fromJson(Map<String, dynamic> map) => Resource.fromMap(map);
}

final formattedNumber = NumberFormat.decimalPattern();
