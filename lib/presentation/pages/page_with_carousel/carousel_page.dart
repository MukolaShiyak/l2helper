import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:l2helper/domain/entities/weapon.dart';
import 'package:l2helper/presentation/cubit/craft_cubit.dart';
import 'package:l2helper/presentation/shared_widgets/app_bar.dart';
import 'package:l2helper/presentation/pages/page_with_carousel/carousel_widget.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  Future<List<Weapon>>? _weapons;

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
                        return CarouselWidget(weapons: weapons);
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
