import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l2helper_v2/cubit/craft_cubit.dart';
import 'package:l2helper_v2/pages/craft_page/craft_page.dart';

class CraftPageArguments {
  final bool? isAfterCounterPage;

  CraftPageArguments({this.isAfterCounterPage});
}

class CraftPageContainer extends StatelessWidget {
  const CraftPageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as CraftPageArguments?;
    return CraftPage(
      isLowRes: BlocProvider.of<CraftCubit>(context).state.isLowResources,
      resouceModel:
          BlocProvider.of<CraftCubit>(context).state.resouceModel ?? [],
      lowResouceModel:
          BlocProvider.of<CraftCubit>(context).state.lowResouceModel ?? [],
      title: BlocProvider.of<CraftCubit>(context).state.title,
      imagePath: BlocProvider.of<CraftCubit>(context).state.imagePath,
      count: BlocProvider.of<CraftCubit>(context).state.count,
      isAfterCounterPage: args?.isAfterCounterPage ?? false,
    );
  }
}
