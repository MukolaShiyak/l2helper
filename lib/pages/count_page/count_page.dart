import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l2helper_v2/cubit/craft_cubit.dart';
import 'package:l2helper_v2/pages/craft_page/crafp_page_container.dart';
import 'package:l2helper_v2/routes.dart';

class CountPage extends StatefulWidget {
  const CountPage({Key? key}) : super(key: key);

  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  final TextEditingController _controller = TextEditingController();

  int _count = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            FocusScope.of(context)
                .unfocus(disposition: UnfocusDisposition.scope);
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Add craft count',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black54,
        foregroundColor: Colors.black54,
        shadowColor: Colors.black54,
        surfaceTintColor: Colors.black54,
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage('images/dion.jpg'),
          ),
        ),
        child: Stack(
          children: [
            Container(
              height: 1.sh,
              width: 1.sw,
              color: Colors.black26,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5.w),
                    width: 100.w,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (_) {
                        if (_controller.text == '0' || _controller.text.isEmpty)
                          return;
                        _count = int.parse(_controller.text);
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white54,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3.w, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3.w, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      controller: _controller,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.white24),
                      foregroundColor:
                          MaterialStateProperty.all(Colors.white24),
                      overlayColor: MaterialStateProperty.all(Colors.white24),
                      shadowColor: MaterialStateProperty.all(Colors.white24),
                      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          (_) {
                        return RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r));
                      }),
                    ),
                    onPressed: () async {
                      if (_controller.text == '0' ||
                          _controller.text.length >= 4 ||
                          _controller.text.isEmpty) return;
                      _count = int.parse(_controller.text);
                      await context
                          .read<CraftCubit>()
                          .setCount(craftCount: _count)
                          .whenComplete(() {
                        FocusScope.of(context)
                            .unfocus(disposition: UnfocusDisposition.scope);
                        _controller.clear();
                        Navigator.of(context).pushNamed(
                          Routes.craftPage,
                          arguments:
                              CraftPageArguments(isAfterCounterPage: true),
                        );
                      });

                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 10.h),
                      decoration: const BoxDecoration(
                          // color: Colors.blue,
                          ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
