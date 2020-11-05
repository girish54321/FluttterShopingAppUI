import 'package:FlutterShopingAppUI/animasions/rightToLeft.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RightToLeft(
      delay: 150,
      child: CachedNetworkImage(
        imageUrl: "https://petapixel.com/assets/uploads/2017/03/product1.jpeg",
        imageBuilder: (context, imageProvider) => Container(
          height: 160.00,
          margin: EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(4.00),
          ),
        ),
        placeholder: (context, url) => Container(
          height: 160.00,
          margin: EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/placholder.jpg')),
            borderRadius: BorderRadius.circular(4.00),
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
