import 'package:FlutterShopingAppUI/animasions/rightToLeft.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FeaturedBrands extends StatelessWidget {
  final Function function;
  final String title;
  final String imageUrl;
  const FeaturedBrands(
      {Key key, this.function, @required this.title, @required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RightToLeft(
      delay: 150,
      child: InkWell(
        onTap: () {
          function();
        },
        child: new Container(
          padding: EdgeInsets.all(11),
          height: 90.00,
          width: 180.00,
          margin: EdgeInsets.only(left: 16, bottom: 8, top: 8),
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            // color: Colors.red,
            boxShadow: [
              BoxShadow(
                offset: Offset(0.00, 5.00),
                color: Color(0xff242424).withOpacity(0.05),
                // color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
              ),
            ],
            borderRadius: BorderRadius.circular(4.00),
          ),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  height: 55.00,
                  width: 55.00,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: imageProvider,
                    ),
                  ),
                ),
                placeholder: (context, url) => Container(
                  height: 55.00,
                  width: 55.00,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/placholder.jpg')),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: new Text(
                        "5693 Products",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff929292),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
