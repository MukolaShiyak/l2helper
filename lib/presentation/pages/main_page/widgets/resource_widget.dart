import 'package:flutter/material.dart';

import 'package:l2helper_v2/domain/entities/resource.dart';
import 'package:l2helper_v2/presentation/pages/main_page/widgets/resource_tile_widget.dart';

@immutable
class ResourceWidget extends StatelessWidget {
  final int craftCount;
  final List<Resource> resources;
  final ValueSetter<List<String>> setNewValues;

  const ResourceWidget({
    Key? key,
    required this.resources,
    required this.craftCount,
    required this.setNewValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: resources.length,
      itemBuilder: (BuildContext context, int index) {
        return ResourceTile(
          ids: const [],
          craftCount: craftCount,
          resource: resources[index],
          setNewValues: setNewValues,
        );
      },
    );
  }
}
