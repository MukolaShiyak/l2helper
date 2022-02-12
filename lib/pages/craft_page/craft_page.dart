import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:l2helper_v2/models/resource_model.dart';
import 'package:l2helper_v2/pages/craft_page/widgets/resource_level1.dart';

class WeaponArguments {
  final String title;
  final List<ResouceModel> resources;
  final List<ResouceModel> lowRes;

  WeaponArguments({
    required this.title,
    required this.resources,
    required this.lowRes,
  });
}

class CraftPage extends StatefulWidget {
  const CraftPage({Key? key}) : super(key: key);

  @override
  State<CraftPage> createState() => _CraftPageState();
}

class _CraftPageState extends State<CraftPage> {
  int _count = 1;
  bool _isLowResource = false;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as WeaponArguments;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(args.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  width: 100.w,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onFieldSubmitted: (_) {
                      if (_controller.text == '0') return;
                      _count = int.parse(_controller.text);
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3.w, color: Colors.blue),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3.w, color: Colors.blue),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                    controller: _controller,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (_controller.text == '0' || _controller.text.length >= 4)
                      return;
                    _count = int.parse(_controller.text);
                    FocusScope.of(context)
                        .unfocus(disposition: UnfocusDisposition.scope);

                    setState(() {});
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _isLowResource = !_isLowResource;

                    setState(() {});
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      _isLowResource ? 'all Resources' : 'low resources',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            // перший ресурс
            if (!_isLowResource) ...[
              for (var resource in args.resources)
                Column(
                  children: [
                    ResourceLvl1(
                      resource: resource,
                      count: _count,
                    ),
                  ],
                ),
            ] else ...[
              for (var resource in args.lowRes)
                Column(
                  children: [
                    ResourceLvl1(
                      resource: resource,
                      count: _count,
                    ),
                  ],
                ),
            ],
          ],
        ),
      ),
    );
  }
}
