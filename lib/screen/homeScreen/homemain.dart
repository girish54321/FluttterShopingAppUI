import 'package:FlutterShopingAppUI/screen/Cart/cartScreen.dart';
import 'package:FlutterShopingAppUI/screen/allProductByBrand/allProductbyBrand.dart';
import 'package:FlutterShopingAppUI/screen/allProductByCategory/allProductByCategory.dart';
import 'package:FlutterShopingAppUI/screen/homeScreen/bannerItem.dart';
import 'package:FlutterShopingAppUI/screen/homeScreen/categoryButton.dart';
import 'package:FlutterShopingAppUI/screen/homeScreen/home.dart';
import 'package:FlutterShopingAppUI/screen/userAccount/userAccount.dart';
import 'package:FlutterShopingAppUI/screen/widgets/featuredBarandsItem.dart';
import 'package:FlutterShopingAppUI/screen/homeScreen/searchBox.dart';
import 'package:FlutterShopingAppUI/screen/widgets/bottomNavigationBar.dart';
import 'package:FlutterShopingAppUI/screen/widgets/gridListItem.dart';
import 'package:FlutterShopingAppUI/screen/widgets/seeAllTitle.dart';
import 'package:FlutterShopingAppUI/screen/widgets/toolbarText.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:page_transition/page_transition.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class HomeMainScreen extends StatefulWidget {
  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen>
    with SingleTickerProviderStateMixin {
  PageController pageController;
  int selectedIndex = 0;

  changeIndex(index) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.selectedIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      // body: Home(),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave.'),
        ),
        child: PageView(
          children: <Widget>[
            Home(),
            CartScreen(),
            UserAccount(),
          ],
          controller: pageController,
          onPageChanged: onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
          selectedIndex: selectedIndex, changeIndex: changeIndex),
    );
  }
}
