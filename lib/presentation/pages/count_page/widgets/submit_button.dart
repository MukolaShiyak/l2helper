import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class SubmitButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const SubmitButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(Colors.white24),
        overlayColor: MaterialStateProperty.all(Colors.white24),
        foregroundColor: MaterialStateProperty.all(Colors.white24),
        backgroundColor: MaterialStateProperty.all(Colors.white24),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 15.w,
          ),
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          );
        }),
      ),
      onPressed: onTap,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
