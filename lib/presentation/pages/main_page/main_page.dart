import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:l2helper_v2/routes.dart';
import 'package:l2helper_v2/presentation/cubit/craft_cubit.dart';
import 'package:l2helper_v2/presentation/shared_widgets/app_bar.dart';
import 'package:l2helper_v2/presentation/pages/main_page/widgets/main_screen_craft_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _count = 0;
  String _title = '';

  @override
  Widget build(BuildContext context) {
    return BlocListener<CraftCubit, CraftState>(
      listener: (context, state) {
        if (state.title.isNotEmpty && _title != state.title) {
          setState(() => _title = state.title);
        }
        if (state.count != _count) {
          setState(() => _count = state.count);
        }
      },
      child: Scaffold(
        appBar: const CustomAppBar(appBarTitle: 'L2 helper'),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black26,
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.carouselPage);
          },
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (context.read<CraftCubit>().state.title.isNotEmpty)
                // ignore: prefer_const_constructors
                MainScreenCraftCard(),
            ],
          ),
        ),
      ),
    );
  }
}
