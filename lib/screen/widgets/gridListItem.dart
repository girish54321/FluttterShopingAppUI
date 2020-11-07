import 'package:FlutterShopingAppUI/animasions/rightToLeft.dart';
import 'package:FlutterShopingAppUI/screen/widgets/outOfStockView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GridListItem extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String brandName;
  final String prise;
  final bool inStock;
  final Function goToProductDetils;
  final int index;

  const GridListItem(
      {Key key,
      this.imageUrl,
      this.productName,
      this.brandName,
      this.prise,
      this.inStock,
      @required this.goToProductDetils,
      @required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RightToLeft(
      delay: 150,
      child: InkWell(
        onTap: () {
          goToProductDetils(index);
        },
        child: Container(
          margin: EdgeInsets.only(
            left: 12.0,
            right: 12.0,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: imageUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 240.00,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                        borderRadius: BorderRadius.circular(4.00),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      height: 240.00,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage('assets/images/placholder.jpg')),
                        borderRadius: BorderRadius.circular(4.00),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  inStock == false ? OutOfStockView() : Text("")
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 12),
                child: new Text(
                  productName != null ? productName : "",
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 8),
                child: new Text(
                  brandName != null ? brandName : "",
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontSize: 12,
                    color: Color(0xff929292),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 8),
                child: new Text(
                  prise != null ? "₹$prise" : "₹$prise",
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xff00c569),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
