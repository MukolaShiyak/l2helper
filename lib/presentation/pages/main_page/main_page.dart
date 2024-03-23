import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:l2helper/routes.dart';
import 'package:l2helper/presentation/cubit/craft_cubit.dart';
import 'package:l2helper/presentation/shared_widgets/app_bar.dart';
import 'package:l2helper/presentation/pages/main_page/widgets/complete_craft_dialog.dart';
import 'package:l2helper/presentation/pages/main_page/widgets/main_screen_craft_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'L2 Craft Helper',
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.historyPage);
            },
            icon: const Icon(
              Icons.history,
              color: Colors.white,
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 6.r,
              spreadRadius: 3.r,
              color: Colors.purple.shade100,
            ),
          ],
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child: FloatingActionButton(
            backgroundColor: Colors.black87,
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.carouselPage);
            },
            child: Icon(
              Icons.add,
              color: Colors.purple.shade100,
            ),
          ),
        ),
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
        child: SafeArea(
          child: BlocBuilder<CraftCubit, CraftState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state.selectedWeaponForCraft != null && state.count != 0)
                    Dismissible(
                      key: const Key('main_card'),
                      confirmDismiss: (direction) async {
                        return await showDialog<bool>(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return const CompleteCraftDialog();
                          },
                        );
                      },
                      child: MainScreenCraftCard(
                        count: state.count.toString(),
                        title: state.selectedWeaponForCraft!.weaponName,
                        imageUrl: state.selectedWeaponForCraft!.imageUrl,
                        onTap: () =>
                            Navigator.of(context).pushNamed(Routes.craftPage),
                        characteristics:
                            state.selectedWeaponForCraft!.characteristics,
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
