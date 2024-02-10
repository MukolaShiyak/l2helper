import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:l2helper/routes.dart';
import 'package:l2helper/presentation/cubit/craft_cubit.dart';
import 'package:l2helper/presentation/shared_widgets/app_bar.dart';
import 'package:l2helper/presentation/pages/count_page/widgets/submit_button.dart';
import 'package:l2helper/presentation/pages/count_page/widgets/quantity_text_field.dart';

class QuantityPage extends StatefulWidget {
  const QuantityPage({Key? key}) : super(key: key);

  @override
  State<QuantityPage> createState() => _QuantityPageState();
}

class _QuantityPageState extends State<QuantityPage> {
  int _quantity = 0;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isQuantityFieldNotValid() {
    final controllerText = _controller.text;
    return controllerText == '0' ||
        controllerText.length >= 4 ||
        controllerText.isEmpty;
  }

  void _clearFieldNavigateHome() async {
    FocusScope.of(context).unfocus(disposition: UnfocusDisposition.scope);
    _controller.clear();
    await Future.delayed(const Duration(milliseconds: 250));

    if (mounted) {
      Navigator.popUntil(
        context,
        ModalRoute.withName(Routes.mainScreen),
      );
    }
  }

  void _submit() async {
    if (_isQuantityFieldNotValid()) return;
    _quantity = int.parse(_controller.text);
    await context
        .read<CraftCubit>()
        .setCount(craftCount: _quantity)
        .whenComplete(_clearFieldNavigateHome);
  }

  void _onBackTap() {
    FocusScope.of(context).unfocus(disposition: UnfocusDisposition.scope);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackTap: _onBackTap,
        appBarTitle: 'Add craft count',
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple.shade100,
              Colors.black,
            ],
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.w),
                width: 100.w,
                child: QuantityTextField(
                  controller: _controller,
                  updateQuantity: (quantity) => _quantity = quantity,
                ),
              ),
              SizedBox(width: 15.w),
              SubmitButton(onTap: _submit, title: 'Submit'),
            ],
          ),
        ),
      ),
    );
  }
}
