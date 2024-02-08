import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:l2helper_v2/routes.dart';
import 'package:l2helper_v2/domain/entities/resource.dart';
import 'package:l2helper_v2/presentation/cubit/craft_cubit.dart';

@immutable
class CarouselItem extends StatelessWidget {
  final String title;
  final String image;
  final List<Resource> resources;
  const CarouselItem({
    Key? key,
    required this.title,
    required this.image,
    required this.resources,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context
            .read<CraftCubit>()
            .setResourcesToState(
              title: title,
              imagePath: image,
              resouces: resources,
            )
            .whenComplete(
              () => Navigator.of(context).pushNamed(Routes.quantityPage),
            );
      },
      child: Container(
        width: 0.8.sw,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 15.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: CachedNetworkImage(
                  imageUrl: image,
                  placeholder: (context, url) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: Image(
                        image: NetworkImage(url),
                      ),
                    );
                  },
                  imageBuilder: (context, imageProvider) {
                    return Image(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
