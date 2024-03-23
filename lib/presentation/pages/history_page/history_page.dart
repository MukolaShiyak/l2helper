import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:l2helper/presentation/cubit/craft_cubit.dart';
import 'package:l2helper/presentation/shared_widgets/app_bar.dart';
import 'package:l2helper/presentation/pages/main_page/widgets/main_screen_craft_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CraftCubit, CraftState>(builder: (_, state) {
      return PopScope(
        onPopInvoked: (isDidPop) async {
          if (state.isMultiDeleteEnabled && context.mounted) {
            context.read<CraftCubit>().changeMultiDeleteState();
          }
        },
        child: Scaffold(
          appBar: CustomAppBar(
            appBarTitle: 'History',
            onBackTap: () => Navigator.of(context).pop(),
            actions: [
              if (state.isMultiDeleteEnabled)
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: badges.Badge(
                    badgeContent: Text('${state.selectedIdsForDelete.length}'),
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: Colors.white.withOpacity(0.7),
                    ),
                    onTap: () =>
                        context.read<CraftCubit>().deleteSelectedCards(),
                    child: GestureDetector(
                      onTap: () =>
                          context.read<CraftCubit>().deleteSelectedCards(),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
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
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 25.h),
              itemBuilder: (context, index) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onLongPress: () => context
                      .read<CraftCubit>()
                      .changeMultiDeleteState(id: state.craftHistory[index].id),
                  onTap: state.isMultiDeleteEnabled
                      ? () => context
                          .read<CraftCubit>()
                          .addIdForDelete(state.craftHistory[index].id)
                      : null,
                  child: Stack(
                    children: [
                      MainScreenCraftCard(
                        title: state.craftHistory[index].weapon.weaponName,
                        imageUrl: state.craftHistory[index].weapon.imageUrl,
                        count: state.craftHistory[index].craftCount.toString(),
                        characteristics:
                            state.craftHistory[index].weapon.characteristics,
                      ),
                      if (state.isMultiDeleteEnabled)
                        Positioned(
                          right: 10,
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              checkboxTheme: CheckboxThemeData(
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 2.w,
                                ),
                              ),
                            ),
                            child: Checkbox(
                              value: state.selectedIdsForDelete
                                  .contains(state.craftHistory[index].id),
                              onChanged: (_) => context
                                  .read<CraftCubit>()
                                  .addIdForDelete(state.craftHistory[index].id),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 25.h);
              },
              itemCount: state.craftHistory.length,
            ),
          ),
        ),
      );
    });
  }
}
