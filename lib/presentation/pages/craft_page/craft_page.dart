import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:l2helper/presentation/cubit/craft_cubit.dart';
import 'package:l2helper/presentation/shared_widgets/app_bar.dart';
import 'package:l2helper/presentation/pages/main_page/widgets/resource_widget.dart';

@immutable
class CraftPage extends StatelessWidget {
  const CraftPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CraftCubit, CraftState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            onBackTap: () => Navigator.of(context).pop(),
            appBarTitle: context
                .read<CraftCubit>()
                .state
                .selectedWeaponForCraft!
                .weaponName,
          ),
          body: Container(
            height: 1.sh,
            width: 1.sw,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Expanded(
                  child: ResourceWidget(
                    craftCount: state.count,
                    resources:
                        state.selectedWeaponForCraft?.weaponResources ?? [],
                    setNewValues: (ids) =>
                        context.read<CraftCubit>().setNewValuesToState(ids),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
