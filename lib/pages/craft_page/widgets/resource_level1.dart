import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:l2helper_v2/models/resource_model.dart';
import 'package:l2helper_v2/pages/craft_page/widgets/resource_level2.dart';

class ResourceLvl1 extends StatefulWidget {
  final ResouceModel resource;
  final int count;
  const ResourceLvl1({
    Key? key,
    required this.resource,
    required this.count,
  }) : super(key: key);

  @override
  _ResourceLvl1State createState() => _ResourceLvl1State();
}

class _ResourceLvl1State extends State<ResourceLvl1> {
  bool _showSecondResouces = false;

  final _formattedNumber = NumberFormat.decimalPattern();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      color: Colors.black12,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.resource.resources != null
                ? () {
                    setState(() {
                      _showSecondResouces = !_showSecondResouces;
                    });
                  }
                : null,
            child: Container(
              color: widget.resource.isComplete ? Colors.green[200] : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(widget.resource.image),
                      SizedBox(width: 5.w),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          if (widget.resource.isComplete != null)
                            widget.resource.isComplete =
                                !widget.resource.isComplete;
                          setState(() {});
                        },
                        child: Container(
                          height: 30.h,
                          alignment: Alignment.center,
                          child: Text(
                            widget.resource.title,
                            style: TextStyle(
                              decoration: widget.resource.isComplete
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              decorationThickness: 2.85,
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
                              decoration: widget.resource.isComplete
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              decorationThickness: 2.85),
                        ),
                        if (widget.resource.resources != null &&
                            !_showSecondResouces) ...[
                          const Icon(Icons.arrow_drop_down),
                        ] else if (widget.resource.resources != null &&
                            _showSecondResouces) ...[
                          const Icon(Icons.arrow_drop_up),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // другий ресурс
          if (widget.resource.resources != null && _showSecondResouces)
            for (var secondResouce in widget.resource.resources!)
              ResourceLvl2(
                count: widget.count,
                resource: widget.resource,
                secondResource: secondResouce,
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
