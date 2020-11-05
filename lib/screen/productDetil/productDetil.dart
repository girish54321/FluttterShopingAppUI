import 'package:FlutterShopingAppUI/animasions/FadeAnimation.dart';
import 'package:FlutterShopingAppUI/screen/productDetil/productImage.dart';
import 'package:FlutterShopingAppUI/screen/productDetil/productSelaction.dart';
import 'package:FlutterShopingAppUI/screen/widgets/chekOutAddtoCart.dart';
import 'package:FlutterShopingAppUI/screen/widgets/seeAllTitle.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ProductDetias extends StatefulWidget {
  @override
  _ProductDetiasState createState() => _ProductDetiasState();
}

class _ProductDetiasState extends State<ProductDetias> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: size.height * 0.6,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                children: [
                  ProductImage(),
                  AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    actions: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        width: 46.0,
                        height: 46.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          //borderRadius: new BorderRadius.circular(30.0),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: new Icon(EvaIcons.starOutline,
                              size: 20.0, color: Colors.black),
                        ),
                      )
                    ],
                  )
                ],
              )),
            ),
            SliverToBoxAdapter(
                child: FadeAnimation(
              0.3,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                child: new Text(
                  "Nike Dri-FIT Long Sleeve",
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            )),
            SliverToBoxAdapter(child: ProductSelction()),
            SliverToBoxAdapter(
                child: FadeAnimation(0.4, SeeAppTitle(title: "Details"))),
            SliverToBoxAdapter(
                child: FadeAnimation(
                    0.5,
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Text(
                        "Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.",
                        style: TextStyle(
                          height: 1.8,
                          fontFamily: "SF Pro Display",
                          fontSize: 18,
                        ),
                      ),
                    ))),
            SliverToBoxAdapter(
                child: FadeAnimation(
                    0.5,
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      child: Text(
                        "Read More",
                        style: TextStyle(
                          height: 1.8,
                          fontFamily: "SF Pro Display",
                          fontSize: 18,
                          color: Color(0xff00c569),
                        ),
                      ),
                    ))),
            SliverToBoxAdapter(child: SeeAppTitle(title: "Reviews")),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return FadeAnimation(
                    0.5,
                    Container(
                      margin: EdgeInsets.only(bottom: 12),
                      child: ListTile(
                          leading: CircleAvatar(
                              radius: 27,
                              backgroundImage: NetworkImage(
                                  "https://static.nike.com/a/images/t_PDP_1280_v1/f_auto/5e4787fc-a474-4842-9f67-489d28a9cb1e/sportswear-t-shirt-CLFcd1.jpg")),
                          title: new Text(
                            "Samuel Smith",
                            style: TextStyle(
                              height: 1.8,
                              fontFamily: "SF Pro Display",
                              fontWeight: FontWeight.w700,
                              // fontSize: 16,
                              color: Color(0xff000000),
                            ),
                          ),
                          subtitle: Text(
                            "Wonderful jean, perfect gift for my girl for our anniversary!",
                            style: TextStyle(
                              height: 1.7,
                              fontFamily: "SF Pro Display",
                              // fontSize: 16,
                              color: Color(0xff000000),
                            ),
                          )),
                    ),
                  );
                },
                childCount: 3,
              ),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 77.00,
            )),
          ],
        ),
      ),
      bottomSheet: CheckOutAddToCartView(
        price: "300",
        buttonText: "ADD",
        function: () {},
      ),
    );
  }
}
