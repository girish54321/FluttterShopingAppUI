import 'dart:convert';

import 'package:FlutterShopingAppUI/modal/BestSelingProductModal.dart';
import 'package:FlutterShopingAppUI/screen/widgets/appToolbar.dart';
import 'package:FlutterShopingAppUI/screen/widgets/cartView.dart';
import 'package:FlutterShopingAppUI/screen/widgets/gridListItem.dart';
import 'package:FlutterShopingAppUI/screen/widgets/seeAllTitle.dart';
import 'package:flutter/material.dart';

class WichListScreen extends StatefulWidget {
  WichListScreen({Key key}) : super(key: key);

  @override
  _WichListScreenState createState() => _WichListScreenState();
}

class _WichListScreenState extends State<WichListScreen> {
  BestSeliingProduct bestSeliingProduct;

  @override
  void initState() {
    getBestSeliingProduct();
    super.initState();
  }

  getBestSeliingProduct() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/bestSeliingJson.json");
    final jsonResult = json.decode(data);
    bestSeliingProduct = new BestSeliingProduct.fromJson(jsonResult);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: header(context, "WishList"),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return CartViewItem(
                  isCart: true,
                );
              },
              childCount: 3,
            ),
          ),
          SliverToBoxAdapter(
              child: SeeAppTitle(
            title: "Recommended",
          )),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / 350),
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                Product product =
                    bestSeliingProduct.bestSelling.products[index];
                return new GridListItem(
                    brandName: product.name,
                    imageUrl: product.image,
                    inStock: product.available,
                    productName: product.name,
                    prise: product.price.toString());
              },
              childCount: bestSeliingProduct.bestSelling.products.length,
            ),
          ),
        ],
      ),
    );
  }
}
