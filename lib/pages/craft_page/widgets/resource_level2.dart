import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:l2helper_v2/models/resource_model.dart';
import 'package:l2helper_v2/pages/craft_page/craft_page.dart';
import 'package:l2helper_v2/pages/craft_page/widgets/resource_level3.dart';
import 'package:l2helper_v2/utility/shared_functions.dart';

class ResourceLvl2 extends StatefulWidget {
  final ResouceModel resource1lvl;
  ResouceModel secondResource;
  final int count;
  final void Function({
    required BuildContext context2,
    ResouceModel? resouceModel1lvl,
    ResouceModel? resouceModel2lvl,
    ResouceModel? resouceModel3lvl,
    ResouceModel? resouceModel4lvl,
    required ResourceLevel enumLvl,
  }) saveToHydrate;
  final void Function({required ResouceModel resouceModel})
      changeSecondLvlComplete;
  ResourceLvl2(
      {Key? key,
      required this.count,
      required this.resource1lvl,
      required this.secondResource,
      required this.saveToHydrate,
      required this.changeSecondLvlComplete})
      : super(key: key);

  @override
  _ResourceLvl2State createState() => _ResourceLvl2State();
}

class _ResourceLvl2State extends State<ResourceLvl2> {
  final _formattedNumber = NumberFormat.decimalPattern();
  void _changeCompleteStatus({required ResouceModel resouceModel}) {
    widget.secondResource = resouceModel;
    setState(() {});
  }

  void _onTap({required void Function() onTap}) {
    onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 30.w),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.secondResource.resources != null
                ? () {
                    setState(() {
                      if (widget.secondResource.showNextResourceLvl != null) {
                        widget.secondResource.showNextResourceLvl =
                            !widget.secondResource.showNextResourceLvl!;
                      }
                    });
                    widget.saveToHydrate(
                      context2: context,
                      resouceModel1lvl: widget.resource1lvl,
                      resouceModel2lvl: widget.secondResource,
                      enumLvl: ResourceLevel.second,
                    );
                  }
                : null,
            child: Container(
              // color: widget.resource1lvl.isComplete ||
              //         widget.secondResource.isComplete
              //     ? Colors.green[200]
              //     : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25.r),
                        child: Image.asset(widget.secondResource.image),
                      ),
                      SizedBox(width: 5.w),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          // if (widget.resource1lvl.isComplete) return;
                          widget.secondResource.isComplete =
                              !widget.secondResource.isComplete;
                          if (widget.secondResource.resources != null) {
                            for (int i = 0;
                                i < widget.secondResource.resources!.length;
                                i++) {
                              ResouceModel thirdres =
                                  widget.secondResource.resources![i];
                              if (thirdres.resources != null) {
                                for (int i = 0;
                                    i < thirdres.resources!.length;
                                    i++) {
                                  ResouceModel fourthRes =
                                      thirdres.resources![i];
                                  fourthRes.isComplete =
                                      widget.secondResource.isComplete;
                                  thirdres.resources!.removeAt(i);
                                  thirdres.resources!.insert(i, fourthRes);
                                }
                              }
                              thirdres.isComplete =
                                  widget.secondResource.isComplete;
                              widget.secondResource.resources!.removeAt(i);
                              widget.secondResource.resources!
                                  .insert(i, thirdres);
                            }
                          }
                          if (isChildsOfThirdResourceCompleted(
                              resourceLvl: widget.resource1lvl)) {
                            widget.resource1lvl.isComplete = true;
                            widget.changeSecondLvlComplete(
                                resouceModel: widget.resource1lvl);
                            setState(() {});
                          } else {
                            widget.resource1lvl.isComplete = false;
                            widget.changeSecondLvlComplete(
                                resouceModel: widget.resource1lvl);
                            setState(() {});
                          }
                          setState(() {});
                          widget.saveToHydrate(
                            context2: context,
                            resouceModel1lvl: widget.resource1lvl,
                            resouceModel2lvl: widget.secondResource,
                            enumLvl: ResourceLevel.second,
                          );
                        },
                        child: Container(
                          height: 30.h,
                          alignment: Alignment.center,
                          child: Text(
                            widget.secondResource.title,
                            style: TextStyle(
                              fontSize: 20.sp,
                              decoration: widget.secondResource.isComplete ||
                                      widget.resource1lvl.isComplete
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
                    margin: widget.secondResource.resources == null
                        ? EdgeInsets.only(right: 20.w)
                        : EdgeInsets.zero,
                    child: Row(
                      children: [
                        Text(
                          '${_formattedNumber.format(int.parse(widget.secondResource.quantity) * int.parse(widget.resource1lvl.quantity) * widget.count)}',
                          style: TextStyle(
                            fontSize: 20.sp,
                            decoration: widget.secondResource.isComplete ||
                                    widget.resource1lvl.isComplete
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            decorationThickness: 2.85,
                            color: Colors.white,
                          ),
                        ),
                        if (widget.secondResource.resources != null &&
                            (widget.secondResource.showNextResourceLvl !=
                                    null &&
                                !widget
                                    .secondResource.showNextResourceLvl!)) ...[
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                        ] else if (widget.secondResource.resources != null &&
                            (widget.secondResource.showNextResourceLvl !=
                                    null &&
                                widget
                                    .secondResource.showNextResourceLvl!)) ...[
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
        ),
        // третій ресурс
        if (widget.secondResource.resources != null &&
            (widget.secondResource.showNextResourceLvl != null &&
                widget.secondResource.showNextResourceLvl!))
          for (var thirdResouce in widget.secondResource.resources!)
            ResourceLvl3(
              count: widget.count,
              firstResource: widget.resource1lvl,
              secondResource: widget.secondResource,
              thirdResource: thirdResouce,
              saveToHydrate: widget.saveToHydrate,
              changeSecondLvlComplete: _changeCompleteStatus,
              changeFirstLvlComplete: widget.changeSecondLvlComplete,
              // onTap: _onTap,
            ),
      ],
    );
  }
}
