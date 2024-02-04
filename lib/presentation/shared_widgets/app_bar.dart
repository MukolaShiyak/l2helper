import 'package:flutter/material.dart';

import 'package:l2helper_v2/utils/app_colors.dart';

@immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackTap;
  final String appBarTitle;
  const CustomAppBar({
    super.key,
    this.onBackTap,
    required this.appBarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: onBackTap != null
          ? IconButton(
              onPressed: onBackTap,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            )
          : null,
      title: Text(
        appBarTitle,
        style: const TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      shadowColor: AppColors.black54,
      backgroundColor: AppColors.black54,
      foregroundColor: AppColors.black54,
      surfaceTintColor: AppColors.black54,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
