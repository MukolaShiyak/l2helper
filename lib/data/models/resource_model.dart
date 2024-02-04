import 'dart:convert' as cv;

import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import 'package:l2helper_v2/domain/entities/resource.dart';

const uuid = Uuid();

class ResourceModel {
  String? id;
  bool isComplete;
  final String title;
  final String image;
  final String quantity;
  final List<ResourceModel>? resources;

  ResourceModel({
    this.id,
    this.resources,
    required this.title,
    required this.image,
    required this.quantity,
    this.isComplete = false,
  }) {
    id = uuid.v4();
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'quantity': quantity,
      'resources': resources,
      'isComplete': isComplete,
    };
  }

  Resource toEntity() {
    return Resource(
      id: id!,
      title: title,
      image: image,
      quantity: quantity,
      isComplete: isComplete,
      resources: resources?.map((res) => res.toEntity()).toList(),
    );
  }

  factory ResourceModel.fromMap(Map<String, dynamic> map) {
    var resourcesList = map['resources'] as List?;
    List<ResourceModel>? resources;

    if (resourcesList != null) {
      resources = resourcesList
          .map((resource) => ResourceModel.fromMap(resource))
          .toList();
    }

    return ResourceModel(
      id: uuid.v4(),
      resources: resources,
      image: map['image'] as String,
      title: map['title'] as String,
      quantity: map['quantity'] as String,
      isComplete: map['isComplete'] ?? false,
    );
  }

  ResourceModel getDuplicate(bool isComplete) {
    return ResourceModel(
      title: title,
      image: image,
      quantity: quantity,
      resources: resources,
      isComplete: isComplete,
    );
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

  String toJson() => cv.json.encode(toMap());

  factory ResourceModel.fromJson(Map<String, dynamic> map) =>
      ResourceModel.fromMap(map);
}

final formattedNumber = NumberFormat.decimalPattern();
