import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l2helper/domain/entities/weapon.dart';

import 'package:l2helper/routes.dart';
import 'package:l2helper/domain/entities/resource.dart';
import 'package:l2helper/presentation/cubit/craft_cubit.dart';
import 'package:l2helper/data/models/characteristics_model.dart';
import 'package:l2helper/presentation/shared_widgets/weapon_card.dart';

@immutable
class CarouselItem extends StatelessWidget {
  final String title, image;
  final Weapon carouselWeapon;
  final List<Resource> resources;
  final CharacteristicsModel characteristics;
  const CarouselItem({
    Key? key,
    required this.title,
    required this.image,
    required this.resources,
    required this.carouselWeapon,
    required this.characteristics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context
            .read<CraftCubit>()
            .setResourcesToState(
              carouselSelectedWeapon: carouselWeapon,
            )
            .whenComplete(
              () => Navigator.of(context).pushNamed(Routes.quantityPage),
            );
      },
      child: WeaponCard(
        title: title,
        imageUrl: image,
        characteristics: characteristics,
      ),
    );
  }
}
