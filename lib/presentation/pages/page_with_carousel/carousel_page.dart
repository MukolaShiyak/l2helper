import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:l2helper_v2/domain/entities/weapon.dart';
import 'package:l2helper_v2/presentation/cubit/craft_cubit.dart';
import 'package:l2helper_v2/presentation/shared_widgets/app_bar.dart';
import 'package:l2helper_v2/presentation/pages/page_with_carousel/carousel_item.dart';
import 'package:l2helper_v2/presentation/pages/page_with_carousel/carousel_item_indicator.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  int _currentPageIndex = 0;
  Future<List<Weapon>>? _weapons;
  final CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    _weapons = context.read<CraftCubit>().getWeapons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Choose weapon',
        onBackTap: () => Navigator.of(context).pop(),
      ),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple.shade100,
              Colors.black,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<List<Weapon>>(
                future: _weapons,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator());
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        final weapons = snapshot.requireData;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CarouselSlider(
                              items: weapons
                                  .map((weapon) => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CarouselItem(
                                            image: weapon.imageUrl,
                                            carouselWeapon: weapon,
                                            title: weapon.weaponName,
                                            resources: weapon.weaponResources,
                                            characteristics:
                                                weapon.characteristics,
                                          ),
                                        ],
                                      ))
                                  .toList(),
                              carouselController: buttonCarouselController,
                              options: CarouselOptions(
                                viewportFraction: 1,
                                enableInfiniteScroll: false,
                                onPageChanged: (index, reason) =>
                                    setState(() => _currentPageIndex = index),
                              ),
                            ),
                            CarouselItemIndicator(
                              weapons: weapons,
                              currentPageIndex: _currentPageIndex,
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                          child: Text('No data'),
                        );
                      }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
