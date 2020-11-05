import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'data.dart';

class TimelinePage extends StatefulWidget {
  TimelinePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: timelineModel(TimelinePosition.Left),
        ));
  }

  timelineModel(TimelinePosition position) => Timeline.builder(
      itemBuilder: centerTimelineBuilder,
      itemCount: doodles.length,
      physics: BouncingScrollPhysics(),
      position: TimelinePosition.Left);

  TimelineModel centerTimelineBuilder(BuildContext context, int i) {
    final doodle = doodles[i];
    return TimelineModel(
        Padding(
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
        position: TimelineItemPosition.right,
        isFirst: i == 0,
        isLast: i == doodles.length,
        iconBackground: doodle.iconBackground,
        icon: doodle.icon);
  }
}
