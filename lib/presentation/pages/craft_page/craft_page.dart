import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:l2helper_v2/presentation/cubit/craft_cubit.dart';
import 'package:l2helper_v2/presentation/shared_widgets/app_bar.dart';
import 'package:l2helper_v2/presentation/pages/main_page/widgets/resource_widget.dart';

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
            appBarTitle: context.read<CraftCubit>().state.title,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Expanded(
                child: ResourceWidget(
                  craftCount: state.count,
                  resources: state.resouceModel ?? [],
                  setNewValues: (ids) =>
                      context.read<CraftCubit>().setNewValuesToState(ids),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
