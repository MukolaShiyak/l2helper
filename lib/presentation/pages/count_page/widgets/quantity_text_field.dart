import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class QuantityTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueSetter<int> updateQuantity;
  const QuantityTextField({
    super.key,
    required this.controller,
    required this.updateQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      onFieldSubmitted: (_) {
        if (controller.text == '0' || controller.text.isEmpty) {
          return;
        }
        updateQuantity(int.parse(controller.text));
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white54,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(width: 3.w, color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(width: 3.w, color: Colors.transparent),
        ),
      ),
      controller: controller,
    );
  }
}
