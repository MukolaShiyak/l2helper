import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:l2helper_v2/routes.dart';
import 'package:l2helper_v2/presentation/cubit/craft_cubit.dart';
import 'package:l2helper_v2/presentation/shared_widgets/app_bar.dart';
import 'package:l2helper_v2/presentation/pages/main_page/widgets/main_screen_craft_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarTitle: 'L2 helper'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black26,
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.carouselPage);
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: BlocBuilder<CraftCubit, CraftState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state.title.isNotEmpty)
                  MainScreenCraftCard(
                    title: state.title,
                    imageUrl: state.imagePath,
                    count: state.count.toString(),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
