import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:l2helper/data/models/characteristics_model.dart';
import 'package:l2helper/presentation/shared_widgets/characteristics_widget.dart';

class WeaponCard extends StatelessWidget {
  final String title, imageUrl;
  final String? count;
  final CharacteristicsModel characteristics;

  const WeaponCard({
    super.key,
    required this.title,
    this.count,
    required this.imageUrl,
    required this.characteristics,
  });

  String _title() {
    return count == null ? title : '$title x$count';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.65.sw,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(25.r),
      ),
      clipBehavior: Clip.none,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Text(
                  _title(),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              CharacteristicsWidget(characteristics: characteristics),
              SizedBox(height: 15.h),
            ],
          ),
          Positioned(
            right: -10.w,
            bottom: -20.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: SizedBox(
                height: 80.h,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: Container(
                        height: 80.h,
                        width: 80.h,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
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
          ),
        ],
      ),
    );
  }
}
