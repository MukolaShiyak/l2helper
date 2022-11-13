import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:l2helper_v2/models/resource_model.dart';
import 'package:l2helper_v2/pages/craft_page/craft_page.dart';
import 'package:l2helper_v2/pages/craft_page/widgets/resource_level2.dart';

class ResourceLvl1 extends StatefulWidget {
  ResouceModel resource;
  final int count;
  final void Function({
    required BuildContext context2,
    ResouceModel? resouceModel1lvl,
    ResouceModel? resouceModel2lvl,
    ResouceModel? resouceModel3lvl,
    ResouceModel? resouceModel4lvl,
    required ResourceLevel enumLvl,
  }) saveToHydrate;
  final ResourceLevel resEnum;
  ResourceLvl1({
    Key? key,
    required this.resource,
    required this.count,
    required this.saveToHydrate,
    required this.resEnum,
  }) : super(key: key);

  @override
  _ResourceLvl1State createState() => _ResourceLvl1State();
}

class _ResourceLvl1State extends State<ResourceLvl1> {
  final _formattedNumber = NumberFormat.decimalPattern();
  void _changeCompleteStatus({required ResouceModel resouceModel}) {
    widget.resource = resouceModel;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.black87,
      ),
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            // onLongPress: () {
            //   print('Long press');
            //   Navigator.of(context).pop();
            // },
            onTap: widget.resource.resources != null
                ? () {
                    setState(() {
                      if (widget.resource.showNextResourceLvl != null) {
                        widget.resource.showNextResourceLvl =
                            !widget.resource.showNextResourceLvl!;
                      }
                    });
                    widget.saveToHydrate(
                      context2: context,
                      resouceModel1lvl: widget.resource,
                      enumLvl: widget.resEnum,
                    );
                  }
                : null,
            child: Container(
              // color: widget.resource.isComplete ? Colors.green[200] : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25.r),
                        child: Image.asset(widget.resource.image),
                      ),
                      SizedBox(width: 5.w),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          // if (widget.resource.isComplete != null)

                          widget.resource.isComplete =
                              !widget.resource.isComplete;
                          if (widget.resource.resources != null) {
                            for (int i = 0;
                                i < widget.resource.resources!.length;
                                i++) {
                              ResouceModel second =
                                  widget.resource.resources![i];
                              if (second.resources != null) {
                                for (int i = 0;
                                    i < second.resources!.length;
                                    i++) {
                                  ResouceModel third = second.resources![i];
                                  if (third.resources != null) {
                                    for (int i = 0;
                                        i < third.resources!.length;
                                        i++) {
                                      ResouceModel fourth = third.resources![i];
                                      fourth.isComplete =
                                          widget.resource.isComplete;
                                      third.resources!.removeAt(i);
                                      third.resources!.insert(i, fourth);
                                    }
                                  }
                                  third.isComplete = widget.resource.isComplete;
                                  second.resources!.removeAt(i);
                                  second.resources!.insert(i, third);
                                }
                              }
                              second.isComplete = widget.resource.isComplete;
                              widget.resource.resources!.removeAt(i);
                              widget.resource.resources!.insert(i, second);
                            }
                          }
                          setState(() {});
                          widget.saveToHydrate(
                            context2: context,
                            resouceModel1lvl: widget.resource,
                            enumLvl: widget.resEnum,
                          );
                        },
                        child: Container(
                          height: 30.h,
                          alignment: Alignment.center,
                          child: Text(
                            widget.resource.title,
                            style: TextStyle(
                              fontSize: 20.sp,
                              decoration: widget.resource.isComplete
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              decorationThickness: 2.85,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: widget.resource.resources == null
                        ? EdgeInsets.only(right: 20.w)
                        : EdgeInsets.zero,
                    child: Row(
                      children: [
                        Text(
                          '${_formattedNumber.format(int.parse(widget.resource.quantity) * widget.count)}',
                          style: TextStyle(
                            fontSize: 20.sp,
                            decoration: widget.resource.isComplete
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            decorationThickness: 2.85,
                            color: Colors.white,
                          ),
                        ),
                        if (widget.resource.resources != null &&
                            (widget.resource.showNextResourceLvl != null &&
                                !widget.resource.showNextResourceLvl!)) ...[
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                        ] else if (widget.resource.resources != null &&
                            (widget.resource.showNextResourceLvl != null &&
                                widget.resource.showNextResourceLvl!)) ...[
                          const Icon(
                            Icons.arrow_drop_up,
                            color: Colors.white,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // другий ресурс
          if (widget.resource.resources != null &&
              (widget.resource.showNextResourceLvl != null &&
                  widget.resource.showNextResourceLvl!))
            for (var secondResouce in widget.resource.resources!)
              ResourceLvl2(
                count: widget.count,
                resource1lvl: widget.resource,
                secondResource: secondResouce,
                saveToHydrate: widget.saveToHydrate,
                changeSecondLvlComplete: _changeCompleteStatus,
              ),
          // Column(
          //   children: [
          //     Container(
          //       padding: EdgeInsets.only(left: 30),
          //       child: GestureDetector(
          //         onTap: secondResouce.resources != null
          //             ? () {
          //                 setState(() {
          //                   _showThirdResouces = !_showThirdResouces;
          //                 });
          //               }
          //             : null,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(secondResouce.title),
          //             Text(
          //                 '${int.parse(secondResouce.quantity) * int.parse(widget.resource.quantity) * widget.count}'),
          //           ],
          //         ),
          //       ),
          //     ),
          //     // третій ресурс
          //     if (secondResouce.resources != null && _showThirdResouces)
          //       for (var thirdResouce in secondResouce.resources!)
          //         Column(
          //           children: [
          //             GestureDetector(
          //               onTap: thirdResouce.resources != null
          //                   ? () {
          //                       setState(() {
          //                         _showFouthResources =
          //                             !_showFouthResources;
          //                       });
          //                     }
          //                   : null,
          //               child: Container(
          //                 padding: EdgeInsets.only(left: 50),
          //                 child: Row(
          //                   mainAxisAlignment:
          //                       MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text(thirdResouce.title),
          //                     Text(
          //                         '${int.parse(thirdResouce.quantity) * (int.parse(secondResouce.quantity) * int.parse(widget.resource.quantity)) * widget.count}'),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //             // четвертий ресурс
          //             if (thirdResouce.resources != null &&
          //                 _showFouthResources)
          //               for (var fourthResource in thirdResouce.resources!)
          //                 Column(
          //                   children: [
          //                     Container(
          //                       padding: EdgeInsets.only(left: 70),
          //                       child: Row(
          //                         mainAxisAlignment:
          //                             MainAxisAlignment.spaceBetween,
          //                         children: [
          //                           Text(fourthResource.title),
          //                           Text(
          //                               '${int.parse(fourthResource.quantity) * (int.parse(thirdResouce.quantity) * (int.parse(secondResouce.quantity) * int.parse(widget.resource.quantity))) * widget.count}'),
          //                         ],
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //           ],
          //         ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
