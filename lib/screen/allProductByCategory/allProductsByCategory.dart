import 'dart:convert';

import 'package:FlutterShopingAppUI/modal/BestSelingProductModal.dart';
import 'package:FlutterShopingAppUI/modal/brandListModal.dart';
import 'package:FlutterShopingAppUI/screen/widgets/featuredBarandsItem.dart';
import 'package:FlutterShopingAppUI/screen/widgets/filterView.dart';
import 'package:FlutterShopingAppUI/screen/widgets/gridListItem.dart';
import 'package:FlutterShopingAppUI/screen/widgets/seeAllTitle.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class AllProductsByCategory extends StatefulWidget {
  @override
  _AllProductsByCategoryState createState() => _AllProductsByCategoryState();
}

class _AllProductsByCategoryState extends State<AllProductsByCategory> {
  BestSeliingProduct bestSeliingProduct;
  BrandList brandList;
  @override
  void initState() {
    getBestSeliingProduct();
    getHomeBrands();
    super.initState();
  }

  getBestSeliingProduct() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/bestSeliingJson.json");
    final jsonResult = json.decode(data);
    bestSeliingProduct = new BestSeliingProduct.fromJson(jsonResult);
    setState(() {});
  }

  getHomeBrands() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/brand_list.json");
    final jsonResult = json.decode(data);
    brandList = new BrandList.fromJson(jsonResult);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Gadgets",
          style: TextStyle(
            fontFamily: "SF Pro Display",
            fontSize: 20,
            color: Color(0xff000000),
          ),
        ),
        leading: IconButton(
            icon: Icon(EvaIcons.arrowIosBack, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        actions: [
          IconButton(
              icon: Icon(EvaIcons.search, color: Theme.of(context).accentColor),
              onPressed: () {
                // Navigator.of(context).pop();
              }),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: SeeAppTitle(
                  title: "Top Brands",
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 100.00,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: brandList.barndList.barnds.length,
                    itemBuilder: (BuildContext context, int index) {
                      Barnd barnd = brandList.barndList.barnds[index];
                      return FeaturedBrands(
                        function: () {},
                        imageUrl: barnd.productImage[0].image,
                        title: barnd.brandName,
                      );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 16),
              ),
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
                        brandName: product.brandName,
                        imageUrl: product.productImage[0].image,
                        inStock: product.inStock,
                        productName: product.productName,
                        prise: product.prise);
                  },
                  childCount: bestSeliingProduct.bestSelling.products.length,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 70),
              ),
            ]),
      ),
      bottomSheet: FilterView(),
    );
  }
}
