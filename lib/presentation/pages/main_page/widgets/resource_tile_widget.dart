import 'package:flutter/material.dart';

import 'package:l2helper_v2/domain/entities/resource.dart';
import 'package:l2helper_v2/presentation/pages/main_page/widgets/custom_expansion_tile.dart';

@immutable
class ResourceTile extends StatelessWidget {
  final int craftCount;
  final List<String> ids;
  final int? parentCount;
  final Resource resource;
  final ValueSetter<List<String>> setNewValues;

  const ResourceTile({
    Key? key,
    this.parentCount,
    required this.ids,
    required this.resource,
    required this.craftCount,
    required this.setNewValues,
  }) : super(key: key);

  int _getParentQuantity() {
    if (parentCount != null) {
      return parentCount! * int.parse(resource.quantity);
    }
    return int.parse(resource.quantity);
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = resource.isComplete
        ? const TextStyle(
            color: Colors.grey,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.lineThrough,
          )
        : const TextStyle();

    List<Widget>? childTiles;
    if (resource.resources != null && resource.resources!.isNotEmpty) {
      childTiles = resource.resources!
          .map((subResource) => ResourceTile(
                resource: subResource,
                craftCount: craftCount,
                setNewValues: setNewValues,
                ids: [...ids, resource.id],
                parentCount: _getParentQuantity(),
              ))
          .toList();
    }

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: CustomExpansionTile(
        leading: GestureDetector(
          child: CircleAvatar(
            backgroundImage: NetworkImage(resource.image),
          ),
          onTap: () => setNewValues([...ids, resource.id]),
        ),
        title: GestureDetector(
          child: Text(resource.title, style: textStyle),
          onTap: () => setNewValues([...ids, resource.id]),
        ),
        subtitle: Text('Quantity: ${resource.showingQuantity(
          craftCount: craftCount,
          parentCount: parentCount,
        )}'),
        children: childTiles ?? [],
      ),
    );
  }
}
