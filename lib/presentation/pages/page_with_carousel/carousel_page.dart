import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:l2helper_v2/domain/entities/weapon.dart';
import 'package:l2helper_v2/presentation/cubit/craft_cubit.dart';
import 'package:l2helper_v2/presentation/shared_widgets/app_bar.dart';
import 'package:l2helper_v2/presentation/pages/page_with_carousel/carousel_item.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  int _currentPageIndex = 0;
  Future<List<Weapon>>? _weaponsFuture;
  final CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    _weaponsFuture = context.read<CraftCubit>().getWeapons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Choose weapon',
        onBackTap: () => Navigator.of(context).pop(),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder<List<Weapon>>(
                  future: _weaponsFuture,
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
                            children: [
                              Text(
                                  '${_currentPageIndex + 1}/${weapons.length}'),
                              CarouselSlider(
                                items: weapons
                                    .map((weapon) => CarouselItem(
                                          title: weapon.weaponName,
                                          image: weapon.imageUrl,
                                          resources: weapon.weaponResources,
                                        ))
                                    .toList(),
                                carouselController: buttonCarouselController,
                                options: CarouselOptions(
                                  height: 500.h,
                                  viewportFraction: 1,
                                  enableInfiniteScroll: false,
                                  onPageChanged: (index, reason) {
                                    _currentPageIndex = index;
                                    setState(() {});
                                  },
                                ),
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
        ],
      ),
    );
  }
}
