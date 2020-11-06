import 'dart:convert';

import 'package:FlutterShopingAppUI/modal/BestSelingProductModal.dart';
import 'package:FlutterShopingAppUI/screen/widgets/filterView.dart';
import 'package:FlutterShopingAppUI/screen/widgets/gridListItem.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class AllProductsByBrand extends StatefulWidget {
  AllProductsByBrand({Key key}) : super(key: key);

  @override
  _AllProductsByBrandState createState() => _AllProductsByBrandState();
}

class _AllProductsByBrandState extends State<AllProductsByBrand>
    with TickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
    Tab(text: 'RIGHT'),
    Tab(text: 'RIGHT'),
  ];

  TabController _tabController;

  BestSeliingProduct bestSeliingProduct;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    getBestSeliingProduct();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "B&o",
          style: TextStyle(
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
        bottom: TabBar(
          isScrollable: true,
          labelStyle: TextStyle(
              fontSize: 20,
              color: Color(0xff000000),
              fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(
            fontSize: 16,
            color: Color(0xff000000).withOpacity(0.40),
          ),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorWeight: 0.1,
          controller: _tabController,
          tabs: [
            Container(height: 44, child: Center(child: Text("All"))),
            Container(height: 44, child: Center(child: Text("Headphones"))),
            Container(height: 44, child: Center(child: Text("Speakers"))),
            Container(height: 44, child: Center(child: Text("Microphones"))),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          // final String label = tab.text.toLowerCase();
          return Container(
              width: double.infinity,
              height: double.infinity,
              child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                        child: SizedBox(
                      height: 20,
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
                        childCount:
                            bestSeliingProduct.bestSelling.products.length,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 70),
                    ),
                  ]));
        }).toList(),
      ),
      bottomSheet: FilterView(),
    );
  }
}
