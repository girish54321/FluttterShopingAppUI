import 'dart:convert';

import 'package:FlutterShopingAppUI/modal/BestSelingProductModal.dart';
import 'package:FlutterShopingAppUI/modal/HomeCategoryModal.dart';
import 'package:FlutterShopingAppUI/modal/brandListModal.dart';
import 'package:FlutterShopingAppUI/screen/allProductByBrand/allProductsByBrand.dart';
import 'package:FlutterShopingAppUI/screen/allProductByCategory/allProductsByCategory.dart';
import 'package:FlutterShopingAppUI/screen/homeScreen/bannerItem.dart';
import 'package:FlutterShopingAppUI/screen/homeScreen/categoryButton.dart';
import 'package:FlutterShopingAppUI/screen/homeScreen/searchBox.dart';
import 'package:FlutterShopingAppUI/screen/widgets/featuredBarandsItem.dart';
import 'package:FlutterShopingAppUI/screen/widgets/gridListItem.dart';
import 'package:FlutterShopingAppUI/screen/widgets/seeAllTitle.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/services.dart' show rootBundle;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BestSeliingProduct bestSeliingProduct;
  HomeCategory homeCategory;
  BrandList brandList;
  goToCategoryScreen() {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child: AllProductsByCategory()));
  }

  gotoBrandPage() {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft, child: AllProductsByBrand()));
  }

  @override
  void initState() {
    getBestSeliingProduct();
    getHomeCategory();
    getHomeBrands();
    super.initState();
  }

  getHomeBrands() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/brand_list.json");
    final jsonResult = json.decode(data);
    brandList = new BrandList.fromJson(jsonResult);
    setState(() {});
  }

  getBestSeliingProduct() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/bestSeliingJson.json");
    final jsonResult = json.decode(data);
    bestSeliingProduct = new BestSeliingProduct.fromJson(jsonResult);
    setState(() {});
  }

  getHomeCategory() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/category.json");
    final jsonResult = json.decode(data);
    homeCategory = new HomeCategory.fromJson(jsonResult);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 22,
            ),
          ),
          SliverToBoxAdapter(
            child: SearchBox(),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 96,
              margin: EdgeInsets.only(
                top: 12,
              ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: homeCategory.homeCategory.category.length,
                itemBuilder: (BuildContext context, int index) {
                  Category category = homeCategory.homeCategory.category[index];
                  return CategoryButton(
                    function: goToCategoryScreen,
                    title: category.categoryName,
                    imageUrl: category.productImage[0].image,
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SeeAppTitle(title: "Best Selling"),
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
                    brandName: product.name,
                    imageUrl: product.image,
                    inStock: product.available,
                    productName: product.name,
                    prise: product.price.toString());
              },
              childCount: 6,
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
                  margin: EdgeInsets.only(top: 16), child: BannerItem())),
          SliverToBoxAdapter(
            child: SeeAppTitle(title: "Featured Brands"),
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
                    function: gotoBrandPage,
                    imageUrl: barnd.productImage[0].image,
                    title: barnd.brandName,
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SeeAppTitle(title: "Recommended"),
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
                    brandName: product.name,
                    imageUrl: product.image,
                    inStock: product.available,
                    productName: product.name,
                    prise: product.price.toString());
              },
              childCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}
