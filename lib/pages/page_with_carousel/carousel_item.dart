import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:l2helper_v2/cubit/craft_cubit.dart';
import 'package:l2helper_v2/models/resource_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l2helper_v2/routes.dart';

class CarouselItem extends StatelessWidget {
  final String title;
  final String image;
  final List<ResouceModel> resources;
  final List<ResouceModel> lowResources;
  const CarouselItem({
    Key? key,
    required this.title,
    required this.image,
    required this.resources,
    required this.lowResources,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context
            .read<CraftCubit>()
            .setResourcesToState(
              title: title,
              resouces: resources,
              lowResources: lowResources,
              imagePath: image,
            )
            .whenComplete(
                () => Navigator.of(context).pushNamed(Routes.countPage));
      },
      child: Container(
        height: 500.h,
        width: 0.8.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: Colors.black26,
        ),
        child: Column(
          children: [
            SizedBox(height: 15.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 15.h),
            Opacity(
              opacity: 0.75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: Image.asset(
                  image,
                  fit: BoxFit.fitHeight,
                  height: 400.h,
                  width: 200.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
