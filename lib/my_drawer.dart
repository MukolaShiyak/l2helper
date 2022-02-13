import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:l2helper_v2/data_base/data_base.dart';
import 'package:l2helper_v2/pages/craft_page/craft_page.dart';
import 'package:l2helper_v2/routes.dart';

import 'models/resource_model.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      color: Colors.black12,
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 55.h,
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text(
                'Craft',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          _craftItem(
            context: context,
            title: 'Draconic Bow',
            weaponResources: draconicBow,
            image: 'images/db.jpg',
            weaponLowResources: draconicBowLowRes,
          ),
          _craftItem(
            context: context,
            title: 'Arcana Mace',
            weaponResources: arcanaMace,
            image: 'images/am.jpg',
            weaponLowResources: arcanaMaceLowRes,
          ),
          _craftItem(
            context: context,
            title: 'Heavens Divider',
            weaponResources: heavensDivider,
            image: 'images/hd.jpg',
            weaponLowResources: heavensDividerLowRes,
          ),
        ],
      ),
    );
  }

  GestureDetector _craftItem({
    required BuildContext context,
    required String title,
    required String image,
    required List<ResouceModel> weaponResources,
    required List<ResouceModel> weaponLowResources,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pushNamed(Routes.craftPage,
            arguments: WeaponArguments(
              title: title,
              resources: weaponResources,
              lowRes: weaponLowResources,
            ));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 40.h,
              width: 40.h,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image))),
            ),
            Text(title, style: const TextStyle(color: Colors.white)),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
