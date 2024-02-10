import 'package:flutter/material.dart';

import 'package:l2helper/routes.dart';
import 'package:l2helper/data/models/characteristics_model.dart';
import 'package:l2helper/presentation/shared_widgets/weapon_card.dart';

@immutable
class MainScreenCraftCard extends StatelessWidget {
  final String title, count, imageUrl;
  final CharacteristicsModel characteristics;

  const MainScreenCraftCard({
    Key? key,
    required this.title,
    required this.count,
    required this.imageUrl,
    required this.characteristics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(Routes.craftPage),
        child: WeaponCard(
          count: count,
          title: title,
          imageUrl: imageUrl,
          characteristics: characteristics,
        ),
      ),
    );
  }
}
