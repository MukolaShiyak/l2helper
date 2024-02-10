import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:l2helper_v2/data/models/characteristics_model.dart';
import 'package:l2helper_v2/presentation/shared_widgets/characteristics_widget.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                _title(),
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: SizedBox(
                  height: 40.h,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        child: Image(
                          image: NetworkImage(url),
                          height: 60.h,
                          fit: BoxFit.contain,
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
          SizedBox(height: 15.h),
          CharacteristicsWidget(characteristics: characteristics),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}
