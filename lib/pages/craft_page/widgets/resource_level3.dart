import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:l2helper_v2/models/resource_model.dart';

class ResourceLvl3 extends StatefulWidget {
  final ResouceModel resource;
  final ResouceModel secondResource;
  final ResouceModel thirdResource;
  final int count;
  const ResourceLvl3({
    Key? key,
    required this.resource,
    required this.count,
    required this.secondResource,
    required this.thirdResource,
  }) : super(key: key);

  @override
  _ResourceLvl3State createState() => _ResourceLvl3State();
}

class _ResourceLvl3State extends State<ResourceLvl3> {
  bool _showFouthResources = false;
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
                    _showFouthResources = !_showFouthResources;
                  });
                }
              : null,
          child: Container(
            margin: EdgeInsets.only(left: 50.w),
            color: widget.thirdResource.isComplete ||
                    widget.resource.isComplete ||
                    widget.secondResource.isComplete ||
                    widget.thirdResource.isComplete
                ? Colors.green[200]
                : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(widget.thirdResource.image),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        if (widget.thirdResource.isComplete == null ||
                            widget.resource.isComplete ||
                            widget.secondResource.isComplete) return;
                        widget.thirdResource.isComplete =
                            !widget.thirdResource.isComplete;
                        setState(() {});
                      },
                      child: Container(
                        height: 30.h,
                        alignment: Alignment.center,
                        child: Text(
                          widget.thirdResource.title,
                          style: TextStyle(
                              decoration: widget.thirdResource.isComplete ||
                                      widget.resource.isComplete ||
                                      widget.secondResource.isComplete ||
                                      widget.thirdResource.isComplete
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              decorationThickness: 2.85),
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
                        '${_formattedNumber.format(int.parse(widget.thirdResource.quantity) * (int.parse(widget.secondResource.quantity) * int.parse(widget.resource.quantity)) * widget.count)}',
                        style: TextStyle(
                            decoration: widget.thirdResource.isComplete ||
                                    widget.resource.isComplete
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            decorationThickness: 2.85),
                      ),
                      if (widget.thirdResource.resources != null &&
                          !_showFouthResources) ...[
                        const Icon(Icons.arrow_drop_down),
                      ] else if (widget.thirdResource.resources != null &&
                          _showFouthResources) ...[
                        const Icon(Icons.arrow_drop_up),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // четвертий ресурс
        if (widget.thirdResource.resources != null && _showFouthResources)
          for (var fourthResource in widget.thirdResource.resources!)
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 70.w),
                  color: widget.resource.isComplete ||
                          widget.secondResource.isComplete ||
                          widget.thirdResource.isComplete ||
                          fourthResource.isComplete
                      ? Colors.green[200]
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(fourthResource.image),
                          SizedBox(width: 5.w),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              if (fourthResource.isComplete == null ||
                                  widget.resource.isComplete ||
                                  widget.secondResource.isComplete ||
                                  widget.thirdResource.isComplete) return;
                              fourthResource.isComplete =
                                  !fourthResource.isComplete;
                              setState(() {});
                            },
                            child: Container(
                              height: 30.h,
                              alignment: Alignment.center,
                              child: Text(
                                fourthResource.title,
                                style: TextStyle(
                                    decoration: fourthResource.isComplete ||
                                            widget.resource.isComplete ||
                                            widget.secondResource.isComplete ||
                                            widget.thirdResource.isComplete
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    decorationThickness: 2.85),
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
                          '${_formattedNumber.format(int.parse(fourthResource.quantity) * (int.parse(widget.thirdResource.quantity) * (int.parse(widget.secondResource.quantity) * int.parse(widget.resource.quantity))) * widget.count)}',
                          style: TextStyle(
                              decoration: fourthResource.isComplete ||
                                      widget.resource.isComplete
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              decorationThickness: 2.85),
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
