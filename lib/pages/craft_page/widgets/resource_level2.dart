import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:l2helper_v2/models/resource_model.dart';
import 'package:l2helper_v2/pages/craft_page/widgets/resource_level3.dart';

class ResourceLvl2 extends StatefulWidget {
  final ResouceModel resource;
  final ResouceModel secondResource;
  final int count;
  const ResourceLvl2({
    Key? key,
    required this.count,
    required this.resource,
    required this.secondResource,
  }) : super(key: key);

  @override
  _ResourceLvl2State createState() => _ResourceLvl2State();
}

class _ResourceLvl2State extends State<ResourceLvl2> {
  bool _showThirdResouces = false;
  final _formattedNumber = NumberFormat.decimalPattern();
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
                      _showThirdResouces = !_showThirdResouces;
                    });
                  }
                : null,
            child: Container(
              color:
                  widget.resource.isComplete || widget.secondResource.isComplete
                      ? Colors.green[200]
                      : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(widget.secondResource.image),
                      SizedBox(width: 5.w),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          if (widget.secondResource.isComplete == null ||
                              widget.resource.isComplete) return;
                          widget.secondResource.isComplete =
                              !widget.secondResource.isComplete;
                          setState(() {});
                        },
                        child: Container(
                          height: 30.h,
                          alignment: Alignment.center,
                          child: Text(
                            widget.secondResource.title,
                            style: TextStyle(
                                decoration: widget.secondResource.isComplete ||
                                        widget.resource.isComplete
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                decorationThickness: 2.85),
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
                          '${_formattedNumber.format(int.parse(widget.secondResource.quantity) * int.parse(widget.resource.quantity) * widget.count)}',
                          style: TextStyle(
                              decoration: widget.secondResource.isComplete ||
                                      widget.resource.isComplete
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              decorationThickness: 2.85),
                        ),
                        if (widget.secondResource.resources != null &&
                            !_showThirdResouces) ...[
                          const Icon(Icons.arrow_drop_down),
                        ] else if (widget.secondResource.resources != null &&
                            _showThirdResouces) ...[
                          const Icon(Icons.arrow_drop_up),
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
        if (widget.secondResource.resources != null && _showThirdResouces)
          for (var thirdResouce in widget.secondResource.resources!)
            ResourceLvl3(
              count: widget.count,
              resource: widget.resource,
              secondResource: widget.secondResource,
              thirdResource: thirdResouce,
            ),
      ],
    );
  }
}
