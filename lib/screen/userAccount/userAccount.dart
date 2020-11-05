import 'package:FlutterShopingAppUI/animasions/rightToLeft.dart';
import 'package:FlutterShopingAppUI/animasions/showUp.dart';
import 'package:FlutterShopingAppUI/screen/savedCard/savedCards.dart';
import 'package:FlutterShopingAppUI/screen/trackOrderScreen/trackOrderScreen.dart';
import 'package:FlutterShopingAppUI/screen/userAccount/profileSettingItems.dart';
import 'package:FlutterShopingAppUI/screen/widgets/appNetWorkImage.dart';
import 'package:FlutterShopingAppUI/screen/widgets/appToolbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class UserAccount extends StatefulWidget {
  UserAccount({Key key}) : super(key: key);

  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  gotoSavedCards() {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft, child: SavedCardsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: header(context, null, 1),
      body: SafeArea(
        left: true,
        top: true,
        right: true,
        bottom: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.,
            children: [
              SizedBox(
                height: 14,
              ),
              ShowUp(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 14),
                      child: CachedNetworkImage(
                        placeholder: (context, url) => CircleAvatar(
                          radius: 55.0,
                          backgroundImage:
                              AssetImage('assets/images/placholder.jpg'),
                        ),
                        imageUrl:
                            "https://m.media-amazon.com/images/M/MV5BM2M2ZGE5NjItYjc2ZS00ZWYzLTk2MzEtZTc3YThhNzhiNmU4XkEyXkFqcGdeQXVyNTU0NDgwMzA@._V1_.jpg",
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 55.0,
                          backgroundImage: imageProvider,
                        ),
                        errorWidget: (context, url, error) => Container(
                          // height: 150.0,
                          child: Icon(Icons.error),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "David Spade",
                            style: TextStyle(
                              fontFamily: "SF Pro Display",
                              fontWeight: FontWeight.w500,
                              fontSize: 26,
                              color: Color(0xff000000),
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "iamdavid@gmail.com",
                            style: TextStyle(
                              fontFamily: "SF Pro Display",
                              fontSize: 14,
                              color: Color(0xff000000),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 8),
              Divider(),
              SizedBox(height: 8),
              ProfileSettingItems(
                title: "Edit Profile",
                iconData:
                    Icon(EvaIcons.edit, color: Theme.of(context).accentColor),
              ),
              ProfileSettingItems(
                title: "Shipping Address",
                iconData: Icon(EvaIcons.pinOutline,
                    color: Theme.of(context).accentColor),
              ),
              ProfileSettingItems(
                title: "Wishlist",
                iconData: Icon(EvaIcons.heartOutline,
                    color: Theme.of(context).accentColor),
              ),
              ProfileSettingItems(
                title: "Order History",
                iconData: Icon(EvaIcons.clockOutline,
                    color: Theme.of(context).accentColor),
              ),
              ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: TrackOrder()));
                  },
                  leading: Icon(FontAwesomeIcons.truck,
                      size: 18, color: Theme.of(context).accentColor),
                  title: Text(
                    "Track Order",
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      fontSize: 18,
                      color: Color(0xff000000),
                    ),
                  ),
                  trailing:
                      Icon(EvaIcons.arrowIosForward, color: Colors.black)),
              ProfileSettingItems(
                title: "Cards",
                function: gotoSavedCards,
                iconData: Icon(EvaIcons.creditCardOutline,
                    color: Theme.of(context).accentColor),
              ),
              ProfileSettingItems(
                title: "Notifications",
                iconData: Icon(EvaIcons.bellOutline,
                    color: Theme.of(context).accentColor),
              ),
              ProfileSettingItems(
                title: "Log Out",
                iconData: Icon(EvaIcons.logOutOutline,
                    color: Theme.of(context).accentColor),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
