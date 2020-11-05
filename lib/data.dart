import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Doodle {
  final String name;
  final String time;
  final String content;

  final Color iconBackground;
  final Icon icon;
  const Doodle(
      {this.name, this.time, this.content, this.icon, this.iconBackground});
}

const List<Doodle> doodles = [
  Doodle(
      name: "Order Signed",
      time: "20/18\n10:00 AM",
      content: "Lagos State, Nigeria",
      icon: Icon(
        EvaIcons.checkmark,
        color: Colors.white,
      ),
      iconBackground: Colors.green),
  Doodle(
      name: "Order Processed",
      time: "20/18\n10:00 AM",
      content: "Lagos State, Nigeria",
      icon: Icon(
        EvaIcons.settingsOutline,
        color: Colors.white,
      ),
      iconBackground: Colors.green),
  Doodle(
      name: "Shipped",
      time: "20/18\n10:00 AM",
      content: "Lagos State, Nigeria",
      icon: Icon(
        EvaIcons.carOutline,
        color: Colors.white,
      ),
      iconBackground: Colors.green),
  Doodle(
      name: "Out for delivery",
      time: "20/18\n10:00 AM",
      content: "Lagos State, Nigeria",
      icon: Icon(FontAwesomeIcons.userCircle, color: Colors.white, size: 16),
      iconBackground: Colors.orange),
  Doodle(
      name: "Delivered",
      time: "20/18\n10:00 AM",
      content: "Lagos State, Nigeria",
      icon: Icon(FontAwesomeIcons.handshake, color: Colors.white, size: 16),
      iconBackground: Colors.grey),
];
