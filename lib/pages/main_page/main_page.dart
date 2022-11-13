import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l2helper_v2/cubit/craft_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:l2helper_v2/routes.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _title = '';
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    // print(BlocProvider.of<CraftCubit>(context).state.count);
    // print(context.read<CraftCubit>().state.count);
    // print(context.read<CraftCubit>().state.title);
    // print(_title);
    // print(BlocProvider.of<CraftCubit>(context).state.title);
    return BlocListener<CraftCubit, CraftState>(
      listener: (context, state) {
        if (state.title.isNotEmpty && _title != state.title) {
          _title = state.title;
          setState(() {});
        }
        if (state.count != _count) {
          _count = state.count;
          print(state.count);
          setState(() {});
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'L2 helper',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black54,
          foregroundColor: Colors.black54,
          shadowColor: Colors.black54,
          surfaceTintColor: Colors.black54,
        ),
        // drawer: const MyDrawer(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black26,
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.carouselPage);
          },
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                width: 1.sw,
                height: 1.sh,
                child: Image.asset(
                  'images/mainPhoto.png',
                  fit: BoxFit.fill,
                ),
              ),
              if (context.read<CraftCubit>().state.title.isNotEmpty)
                Center(
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(Routes.craftPage),
                    child: Container(
                      height: 500.h,
                      width: 0.8.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        color: Colors.black26,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                context.read<CraftCubit>().state.title,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 15.w),
                              Text(
                                context
                                    .read<CraftCubit>()
                                    .state
                                    .count
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          Opacity(
                            opacity: 0.5,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25.r),
                                child: Image.asset(
                                  context.read<CraftCubit>().state.imagePath,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
