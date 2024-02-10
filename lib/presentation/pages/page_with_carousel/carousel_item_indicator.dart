import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:l2helper_v2/domain/entities/weapon.dart';

class CarouselItemIndicator extends StatelessWidget {
  const CarouselItemIndicator({
    super.key,
    required int currentPageIndex,
    required this.weapons,
  }) : _currentPageIndex = currentPageIndex;

  final int _currentPageIndex;
  final List<Weapon> weapons;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      alignment: Alignment.center,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 10.r,
            height: 10.r,
            decoration: BoxDecoration(
              color: index == _currentPageIndex
                  ? Colors.purple.shade100
                  : Colors.black,
              borderRadius: BorderRadius.circular(25.r),
              border: Border.all(
                color: Colors.purple.shade100,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 5.w);
        },
        itemCount: weapons.length,
      ),
    );
  }
}
