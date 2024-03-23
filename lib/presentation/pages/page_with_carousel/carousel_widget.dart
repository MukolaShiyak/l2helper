import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:l2helper/domain/entities/weapon.dart';
import 'package:l2helper/presentation/pages/page_with_carousel/carousel_item.dart';

class CarouselWidget extends StatefulWidget {
  final List<Weapon> weapons;
  const CarouselWidget({
    super.key,
    required this.weapons,
  });

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: PageView.builder(
            clipBehavior: Clip.none,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CarouselItem(
                    carouselWeapon: widget.weapons[index],
                    image: widget.weapons[index].imageUrl,
                    title: widget.weapons[index].weaponName,
                    resources: widget.weapons[index].weaponResources,
                    characteristics: widget.weapons[index].characteristics,
                  ),
                ],
              );
            },
            controller: controller,
            itemCount: widget.weapons.length,
          ),
        ),
        SmoothPageIndicator(
          count: widget.weapons.length,
          controller: controller,
          textDirection: TextDirection.ltr,
          effect: WormEffect(
            activeDotColor: Colors.purple.shade100,
          ),
        ),
      ],
    );
  }
}
