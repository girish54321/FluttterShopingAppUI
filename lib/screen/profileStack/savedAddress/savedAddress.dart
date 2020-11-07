import 'package:FlutterShopingAppUI/screen/profileStack/savedAddress/savedAdressItem.dart';
import 'package:FlutterShopingAppUI/screen/widgets/appToolbar.dart';
import 'package:flutter/material.dart';

class SavedAddress extends StatefulWidget {
  @override
  _SavedAddressState createState() => _SavedAddressState();
}

class _SavedAddressState extends State<SavedAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, "Saved Address"),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: SavedAddressItem(
                    subTitle:
                        "21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria",
                    title: "Home Address",
                    selected: index == 1 ? true : false,
                  ),
                );
              },
              childCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
