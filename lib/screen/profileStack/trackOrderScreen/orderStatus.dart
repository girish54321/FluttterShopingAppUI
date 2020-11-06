import 'package:FlutterShopingAppUI/animasions/showUp.dart';
import 'package:FlutterShopingAppUI/screen/widgets/appToolbar.dart';
import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import '../../../data.dart';

class OrderStatusView extends StatefulWidget {
  @override
  _OrderStatusViewState createState() => _OrderStatusViewState();
}

class _OrderStatusViewState extends State<OrderStatusView> {
  timelineModel() => Timeline.builder(
      itemBuilder: centerTimelineBuilder,
      itemCount: doodles.length,
      physics: BouncingScrollPhysics(),
      position: TimelinePosition.Left);

  TimelineModel centerTimelineBuilder(BuildContext context, int i) {
    final doodle = doodles[i];
    return TimelineModel(
        ShowUp(
          delay: 200,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  doodle.time,
                  style: TextStyle(
                    height: 1.4,
                    fontSize: 12,
                    color: Color(0xff929292),
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  doodle.name,
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                new Text(
                  doodle.content,
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontSize: 12,
                    color: Color(0xff000000).withOpacity(0.87),
                  ),
                ),
              ],
            ),
          ),
        ),
        position: TimelineItemPosition.right,
        isFirst: i == 0,
        isLast: i == doodles.length,
        iconBackground: doodle.iconBackground,
        icon: doodle.icon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context, "OD - 424923192 - N"),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: timelineModel()));
  }
}
