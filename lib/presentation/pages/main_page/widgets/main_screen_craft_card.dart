import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:l2helper_v2/routes.dart';
import 'package:l2helper_v2/presentation/cubit/craft_cubit.dart';

@immutable
class MainScreenCraftCard extends StatelessWidget {
  const MainScreenCraftCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(Routes.craftPage),
        child: Container(
          height: 500.h,
          width: 0.8.sw,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(25.r),
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
                    context.read<CraftCubit>().state.count.toString(),
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),
                  child: Image.network(
                    context.read<CraftCubit>().state.imagePath,
                    fit: BoxFit.contain,
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
