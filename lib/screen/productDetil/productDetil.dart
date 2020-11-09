import 'package:FlutterShopingAppUI/animasions/FadeAnimation.dart';
import 'package:FlutterShopingAppUI/modal/BestSelingProductModal.dart';
import 'package:FlutterShopingAppUI/screen/productDetil/productImage.dart';
import 'package:FlutterShopingAppUI/screen/productDetil/productSelaction.dart';
import 'package:FlutterShopingAppUI/screen/productDetil/productSelcastion2.dart';
import 'package:FlutterShopingAppUI/screen/productDetil/productViewImages.dart';
import 'package:FlutterShopingAppUI/screen/widgets/chekOutAddtoCart.dart';
import 'package:FlutterShopingAppUI/screen/widgets/seeAllTitle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ProductDetias extends StatefulWidget {
  final Product product;

  const ProductDetias({Key key, @required this.product}) : super(key: key);
  @override
  _ProductDetiasState createState() => _ProductDetiasState();
}

class _ProductDetiasState extends State<ProductDetias> {
  int selectedSize = 0;

  goToImageView(List<String> images) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child: ProductImageView(
              images: images.length == 0 ? [widget.product.image] : images,
            )));
  }

  changeSelectedSize(index) {
    setState(() {
      selectedSize = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: size.height * 0.6,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(
              children: [
                ProductImage(
                    images: widget.product.images.length < 2
                        ? [widget.product.image]
                        : widget.product.images,
                    goToImageView: goToImageView),
              ],
            )),
          ),
          SliverToBoxAdapter(
              child: FadeAnimation(
            0.3,
            Container(
              margin: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
              child: new Text(
                widget.product.name,
                style: TextStyle(
                  fontFamily: "SF Pro Display",
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  color: Color(0xff000000),
                ),
              ),
            ),
          )),
          SliverToBoxAdapter(
            child: widget.product.size.length != 0
                ? Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),
                        Text(
                          "Select Size",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Container(
                            height: 33,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.product.size.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ProductSelcationItem(
                                  selectedSize: selectedSize,
                                  index: index,
                                  sizeName: widget.product.size[index],
                                  selectSize: changeSelectedSize,
                                );
                              },
                            )),
                      ],
                    ),
                  )
                : Text(""),
          ),
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
                      widget.product.description,
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
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                        leading: CachedNetworkImage(
                          imageUrl:
                              "https://static.nike.com/a/images/t_PDP_1280_v1/f_auto/5e4787fc-a474-4842-9f67-489d28a9cb1e/sportswear-t-shirt-CLFcd1.jpg",
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                                  radius: 27, backgroundImage: imageProvider),
                          placeholder: (context, url) => CircleAvatar(
                              radius: 27,
                              backgroundImage:
                                  AssetImage('assets/images/placholder.jpg')),
                        ),
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
      bottomSheet: CheckOutAddToCartView(
        price: widget.product.price.toString(),
        buttonText: widget.product.available ? "ADD" : "OUT OF STOCK",
        function: () {},
      ),
    );
  }
}
