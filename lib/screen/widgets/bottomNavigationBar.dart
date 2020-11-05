import 'package:FlutterShopingAppUI/screen/widgets/toolbarText.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function changeIndex;

  const AppBottomNavigationBar({Key key, this.selectedIndex, this.changeIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TitledBottomNavigationBar(
        reverse: true,
        currentIndex:
            selectedIndex, // Use this to update the Bar giving a position
        onTap: (index) {
          print("Selected Index: $index");
          // setState(() {
          //   selectedIndex = index;
          // });
          changeIndex(index);
        },
        items: [
          TitledNavigationBarItem(
              title: ToolBarText(toolBarText: "Explore"),
              icon: EvaIcons.homeOutline),
          TitledNavigationBarItem(
              title: ToolBarText(toolBarText: "Cart"),
              icon: EvaIcons.shoppingCartOutline),
          TitledNavigationBarItem(
              title: ToolBarText(toolBarText: "Account"),
              icon: EvaIcons.personOutline),
        ]);
  }
}
