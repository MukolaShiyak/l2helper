import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:l2helper_v2/models/resource_model.dart';
import 'package:l2helper_v2/pages/craft_page/craft_page.dart';
import 'package:l2helper_v2/utility/shared_functions.dart';

class ResourceLvl3 extends StatefulWidget {
  final ResouceModel firstResource;
  final ResouceModel secondResource;
  final ResouceModel thirdResource;
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
  final void Function({required ResouceModel resouceModel})
      changeFirstLvlComplete;
  // final void Function({required void Function() onTap}) onTap;
  const ResourceLvl3({
    Key? key,
    required this.firstResource,
    required this.count,
    required this.secondResource,
    required this.thirdResource,
    required this.saveToHydrate,
    required this.changeSecondLvlComplete,
    required this.changeFirstLvlComplete,
    // required this.onTap,
  }) : super(key: key);

  @override
  _ResourceLvl3State createState() => _ResourceLvl3State();
}

class _ResourceLvl3State extends State<ResourceLvl3> {
  final _formattedNumber = NumberFormat.decimalPattern();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.thirdResource.resources != null
              ? () {
                  setState(() {
                    if (widget.thirdResource.showNextResourceLvl != null) {
                      widget.thirdResource.showNextResourceLvl =
                          !widget.thirdResource.showNextResourceLvl!;
                    }
                  });
                  widget.saveToHydrate(
                    context2: context,
                    resouceModel1lvl: widget.firstResource,
                    resouceModel2lvl: widget.secondResource,
                    resouceModel3lvl: widget.thirdResource,
                    enumLvl: ResourceLevel.third,
                  );
                }
              : null,
          child: Container(
            margin: EdgeInsets.only(left: 50.w),
            // color: widget.thirdResource.isComplete ||
            //         widget.resource.isComplete ||
            //         widget.secondResource.isComplete ||
            //         widget.thirdResource.isComplete
            //     ? Colors.green[200]
            //     : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.r),
                      child: Image.asset(widget.thirdResource.image),
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        // if (widget.thirdResource.isComplete == null ||
                        //     widget.firstResource.isComplete ||
                        //     widget.secondResource.isComplete) return;
                        widget.thirdResource.isComplete =
                            !widget.thirdResource.isComplete;
                        if (widget.thirdResource.resources != null) {
                          for (int i = 0;
                              i < widget.thirdResource.resources!.length;
                              i++) {
                            ResouceModel res =
                                widget.thirdResource.resources![i];
                            res.isComplete = widget.thirdResource.isComplete;
                            widget.thirdResource.resources!.removeAt(i);
                            widget.thirdResource.resources!.insert(i, res);
                          }
                        }
                        if (isChildsOfThirdResourceCompleted(
                            resourceLvl: widget.secondResource)) {
                          widget.secondResource.isComplete = true;
                          widget.changeSecondLvlComplete(
                              resouceModel: widget.secondResource);
                          setState(() {});
                          if (isChildsOfThirdResourceCompleted(
                              resourceLvl: widget.firstResource)) {
                            widget.firstResource.isComplete = true;
                            widget.changeFirstLvlComplete(
                                resouceModel: widget.firstResource);
                            setState(() {});
                          }
                        } else {
                          widget.secondResource.isComplete = false;
                          widget.changeSecondLvlComplete(
                              resouceModel: widget.secondResource);
                          widget.firstResource.isComplete = false;
                          widget.changeFirstLvlComplete(
                              resouceModel: widget.firstResource);
                          setState(() {});
                        }
                        setState(() {});
                        widget.saveToHydrate(
                          context2: context,
                          resouceModel1lvl: widget.firstResource,
                          resouceModel2lvl: widget.secondResource,
                          resouceModel3lvl: widget.thirdResource,
                          enumLvl: ResourceLevel.third,
                        );
                      },
                      child: Container(
                        height: 30.h,
                        alignment: Alignment.center,
                        child: Text(
                          widget.thirdResource.title,
                          style: TextStyle(
                            fontSize: 20.sp,
                            decoration: widget.thirdResource.isComplete
                                // ||
                                //         widget.firstResource.isComplete ||
                                //         widget.secondResource.isComplete ||
                                //         widget.thirdResource.isComplete
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
                  margin: widget.thirdResource.resources == null
                      ? EdgeInsets.only(right: 20.w)
                      : EdgeInsets.zero,
                  child: Row(
                    children: [
                      Text(
                        '${_formattedNumber.format(int.parse(widget.thirdResource.quantity) * (int.parse(widget.secondResource.quantity) * int.parse(widget.firstResource.quantity)) * widget.count)}',
                        style: TextStyle(
                          fontSize: 20.sp,
                          decoration: widget.thirdResource.isComplete
                              // ||
                              //         widget.firstResource.isComplete
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          decorationThickness: 2.85,
                          color: Colors.white,
                        ),
                      ),
                      if (widget.thirdResource.resources != null &&
                          (widget.thirdResource.showNextResourceLvl != null &&
                              !widget.thirdResource.showNextResourceLvl!)) ...[
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                      ] else if (widget.thirdResource.resources != null &&
                          (widget.thirdResource.showNextResourceLvl != null &&
                              widget.thirdResource.showNextResourceLvl!)) ...[
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
        // четвертий ресурс
        if (widget.thirdResource.resources != null &&
            (widget.thirdResource.showNextResourceLvl != null &&
                widget.thirdResource.showNextResourceLvl!))
          for (var fourthResource in widget.thirdResource.resources!)
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 70.w),
                  // color: widget.resource.isComplete ||
                  //         widget.secondResource.isComplete ||
                  //         widget.thirdResource.isComplete ||
                  //         fourthResource.isComplete
                  //     ? Colors.green[200]
                  //     : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25.r),
                            child: Image.asset(fourthResource.image),
                          ),
                          SizedBox(width: 5.w),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              // if (fourthResource.isComplete == null ||
                              //     widget.firstResource.isComplete ||
                              //     widget.secondResource.isComplete ||
                              //     widget.thirdResource.isComplete) return;
                              fourthResource.isComplete =
                                  !fourthResource.isComplete;
                              if (isChildsOfThirdResourceCompleted(
                                  resourceLvl: widget.thirdResource)) {
                                widget.thirdResource.isComplete = true;
                                setState(() {});
                                if (isChildsOfThirdResourceCompleted(
                                    resourceLvl: widget.secondResource)) {
                                  widget.secondResource.isComplete = true;

                                  widget.changeSecondLvlComplete(
                                      resouceModel: widget.secondResource);

                                  setState(() {});
                                  if (isChildsOfThirdResourceCompleted(
                                      resourceLvl: widget.firstResource)) {
                                    widget.firstResource.isComplete = true;
                                    widget.changeFirstLvlComplete(
                                        resouceModel: widget.firstResource);

                                    setState(() {});
                                  }
                                }
                              } else {
                                widget.thirdResource.isComplete = false;
                                widget.secondResource.isComplete = false;

                                widget.changeSecondLvlComplete(
                                    resouceModel: widget.secondResource);
                                widget.firstResource.isComplete = false;
                                widget.changeFirstLvlComplete(
                                    resouceModel: widget.firstResource);
                                setState(() {});
                              }
                              setState(() {});
                              widget.saveToHydrate(
                                context2: context,
                                resouceModel1lvl: widget.firstResource,
                                resouceModel2lvl: widget.secondResource,
                                resouceModel3lvl: widget.thirdResource,
                                resouceModel4lvl: fourthResource,
                                enumLvl: ResourceLevel.fourth,
                              );
                            },
                            child: Container(
                              height: 30.h,
                              alignment: Alignment.center,
                              child: Text(
                                fourthResource.title,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  decoration: fourthResource.isComplete
                                      // ||
                                      //         widget.firstResource.isComplete ||
                                      //         widget.secondResource.isComplete ||
                                      //         widget.thirdResource.isComplete
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
                        margin: fourthResource.resources == null
                            ? EdgeInsets.only(right: 20.w)
                            : EdgeInsets.zero,
                        child: Text(
                          '${_formattedNumber.format(int.parse(fourthResource.quantity) * (int.parse(widget.thirdResource.quantity) * (int.parse(widget.secondResource.quantity) * int.parse(widget.firstResource.quantity))) * widget.count)}',
                          style: TextStyle(
                            fontSize: 20.sp,
                            decoration: fourthResource.isComplete
                                //  ||
                                //         widget.firstResource.isComplete
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            decorationThickness: 2.85,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      ],
    );
  }
}
