import 'package:flutter/material.dart';

import 'package:l2helper/data/models/characteristics_model.dart';
import 'package:l2helper/presentation/shared_widgets/weapon_card.dart';

@immutable
class MainScreenCraftCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String title, count, imageUrl;
  final CharacteristicsModel characteristics;

  const MainScreenCraftCard({
    Key? key,
    this.onTap,
    required this.title,
    required this.count,
    required this.imageUrl,
    required this.characteristics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
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
