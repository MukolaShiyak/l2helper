import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:l2helper_v2/cubit/craft_cubit.dart';
import 'package:l2helper_v2/models/resource_model.dart';
// import 'package:l2helper_v2/models/resource_model.dart';
import 'package:l2helper_v2/pages/craft_page/widgets/resource_level1.dart';
import 'package:l2helper_v2/routes.dart';

// class WeaponArguments {
//   final String title;
//   final List<ResouceModel> resources;
//   final List<ResouceModel> lowRes;

//   WeaponArguments({
//     required this.title,
//     required this.resources,
//     required this.lowRes,
//   });
// }

enum ResourceLevel {
  first,
  second,
  third,
  fourth,
  lowRess,
}

class CraftPage extends StatefulWidget {
  final bool? isLowRes;
  final List<ResouceModel> resouceModel;
  final List<ResouceModel> lowResouceModel;
  final String title;
  final String imagePath;
  final int count;
  final bool isAfterCounterPage;
  const CraftPage({
    Key? key,
    this.isLowRes,
    required this.resouceModel,
    required this.lowResouceModel,
    required this.title,
    required this.imagePath,
    required this.count,
    required this.isAfterCounterPage,
  }) : super(key: key);

  @override
  State<CraftPage> createState() => _CraftPageState();
}

class _CraftPageState extends State<CraftPage> {
  late int _count;
  late bool _isLowResource;
  late String _title;
  late String _imagePath;
  late List<ResouceModel> _resouceModel;
  late List<ResouceModel> _lowResouceModel;

  @override
  void initState() {
    _resouceModel = widget.resouceModel;
    _lowResouceModel = widget.lowResouceModel;
    _title = widget.title;
    _imagePath = widget.imagePath;
    _count = widget.count;
    if (widget.isLowRes != null) {
      _isLowResource = widget.isLowRes!;
    }
    super.initState();
  }

  void _addToHydrate({
    required BuildContext context2,
    ResouceModel? resouceModel1lvl,
    ResouceModel? resouceModel2lvl,
    ResouceModel? resouceModel3lvl,
    ResouceModel? resouceModel4lvl,
    required ResourceLevel enumLvl,
  }) {
    switch (enumLvl) {
      case ResourceLevel.first:
        if (resouceModel1lvl != null) {
          int index = _resouceModel
              .indexWhere((element) => element == resouceModel1lvl);
          _resouceModel.removeAt(index);
          _resouceModel.insert(index, resouceModel1lvl);
        }
        break;
      case ResourceLevel.second:
        if (resouceModel1lvl != null && resouceModel2lvl != null) {
          int indexFirstLvlResource = _resouceModel
              .indexWhere((element) => element == resouceModel1lvl);
          int indexSecondLvlResource = resouceModel1lvl.resources!
              .indexWhere((element) => element == resouceModel2lvl);

          resouceModel1lvl.resources?.removeAt(indexSecondLvlResource);
          resouceModel1lvl.resources
              ?.insert(indexSecondLvlResource, resouceModel2lvl);

          _resouceModel.removeAt(indexFirstLvlResource);
          _resouceModel.insert(indexFirstLvlResource, resouceModel1lvl);
        }
        break;
      case ResourceLevel.third:
        if (resouceModel1lvl != null &&
            resouceModel2lvl != null &&
            resouceModel3lvl != null) {
          int indexFirstLvlResource = _resouceModel
              .indexWhere((element) => element == resouceModel1lvl);
          int indexSecondLvlResource = resouceModel1lvl.resources!
              .indexWhere((element) => element == resouceModel2lvl);
          int indexThirdLvlResource = resouceModel2lvl.resources!
              .indexWhere((element) => element == resouceModel3lvl);

          resouceModel2lvl.resources?.removeAt(indexThirdLvlResource);
          resouceModel2lvl.resources!
              .insert(indexThirdLvlResource, resouceModel3lvl);

          resouceModel1lvl.resources?.removeAt(indexSecondLvlResource);
          resouceModel1lvl.resources
              ?.insert(indexSecondLvlResource, resouceModel2lvl);

          _resouceModel.removeAt(indexFirstLvlResource);
          _resouceModel.insert(indexFirstLvlResource, resouceModel1lvl);
        }
        break;
      case ResourceLevel.fourth:
        if (resouceModel1lvl != null &&
            resouceModel2lvl != null &&
            resouceModel3lvl != null &&
            resouceModel4lvl != null) {
          int indexFirstLvlResource = _resouceModel
              .indexWhere((element) => element == resouceModel1lvl);
          int indexSecondLvlResource = resouceModel1lvl.resources!
              .indexWhere((element) => element == resouceModel2lvl);
          int indexThirdLvlResource = resouceModel2lvl.resources!
              .indexWhere((element) => element == resouceModel3lvl);
          int indexFourthLvlResource = resouceModel3lvl.resources!
              .indexWhere((element) => element == resouceModel4lvl);

          resouceModel3lvl.resources!.removeAt(indexFourthLvlResource);
          resouceModel3lvl.resources!
              .insert(indexFourthLvlResource, resouceModel4lvl);

          resouceModel2lvl.resources?.removeAt(indexThirdLvlResource);
          resouceModel2lvl.resources!
              .insert(indexThirdLvlResource, resouceModel3lvl);

          resouceModel1lvl.resources?.removeAt(indexSecondLvlResource);
          resouceModel1lvl.resources
              ?.insert(indexSecondLvlResource, resouceModel2lvl);

          _resouceModel.removeAt(indexFirstLvlResource);
          _resouceModel.insert(indexFirstLvlResource, resouceModel1lvl);
        }
        break;
      case ResourceLevel.lowRess:
        if (resouceModel1lvl != null) {
          int index = _lowResouceModel
              .indexWhere((element) => element == resouceModel1lvl);
          _lowResouceModel.removeAt(index);
          _lowResouceModel.insert(index, resouceModel1lvl);
        }
        break;
      default:
    }

    context2.read<CraftCubit>().setResourcesToState(
          resouces: _resouceModel,
          lowResources: _lowResouceModel,
          title: _title,
          imagePath: _imagePath,
        );
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)?.settings.arguments as WeaponArguments;

    return BlocListener<CraftCubit, CraftState>(
      listener: (context, state) {
        // print(state.isLowResources);
        if (state.isLowResources != _isLowResource) {
          _isLowResource = state.isLowResources;
          setState(() {});
        }
        // if (state.title != _title) {
        //   _title = state.title;
        //   setState(() {});
        // }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: Text(
            context.read<CraftCubit>().state.title,
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            if (widget.isAfterCounterPage)
              IconButton(
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    ModalRoute.withName(Routes.mainScreen),
                  );
                },
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              )
          ],
          // Text(BlocProvider.of<CraftCubit>(context).state.title
          // args.title
          centerTitle: true,
          backgroundColor: Colors.black54,
          foregroundColor: Colors.black54,
          shadowColor: Colors.black54,
          surfaceTintColor: Colors.black54,
        ),
        body: Stack(
          children: [
            Container(
              height: 1.sh,
              width: 1.sw,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/craftPage4.jpg'),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //   margin: EdgeInsets.only(left: 5.w),
                      //   width: 100.w,
                      //   child: TextFormField(
                      //     keyboardType: TextInputType.number,
                      //     onFieldSubmitted: (_) {
                      //       if (_controller.text == '0') return;
                      //       _count = int.parse(_controller.text);
                      //       setState(() {});
                      //     },
                      //     decoration: InputDecoration(
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(width: 3.w, color: Colors.blue),
                      //         borderRadius: BorderRadius.circular(15.r),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(width: 3.w, color: Colors.blue),
                      //         borderRadius: BorderRadius.circular(15.r),
                      //       ),
                      //     ),
                      //     controller: _controller,
                      //   ),
                      // ),
                      // TextButton(
                      //   onPressed: () {
                      //     if (_controller.text == '0' || _controller.text.length >= 4)
                      //       return;
                      //     _count = int.parse(_controller.text);
                      //     FocusScope.of(context)
                      //         .unfocus(disposition: UnfocusDisposition.scope);

                      //     setState(() {});
                      //   },
                      //   child: Container(
                      //     padding:
                      //         EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                      //     decoration: const BoxDecoration(
                      //       color: Colors.blue,
                      //     ),
                      //     child: const Text(
                      //       'Submit',
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //   ),
                      // ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black54),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black54),
                          overlayColor:
                              MaterialStateProperty.all(Colors.black54),
                          shadowColor:
                              MaterialStateProperty.all(Colors.black54),
                        ),
                        onPressed: () {
                          // _isLowResource = !_isLowResource;

                          context
                              .read<CraftCubit>()
                              .changeView(isLowRes: !_isLowResource);

                          setState(() {});
                        },
                        child: Text(
                          _isLowResource ? 'all Resources' : 'low resources',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  // перший ресурс
                  if (!_isLowResource) ...[
                    for (var resource in _resouceModel)
                      Column(
                        children: [
                          ResourceLvl1(
                            resource: resource,
                            count: _count,
                            saveToHydrate: _addToHydrate,
                            resEnum: ResourceLevel.first,
                          ),
                        ],
                      ),
                  ] else ...[
                    for (var resource in _lowResouceModel)
                      Column(
                        children: [
                          ResourceLvl1(
                            resource: resource,
                            count: _count,
                            saveToHydrate: _addToHydrate,
                            resEnum: ResourceLevel.lowRess,
                          ),
                        ],
                      ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
