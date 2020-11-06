import 'package:FlutterShopingAppUI/animasions/rightToLeft.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Function function;
  const CategoryButton({Key key, this.function, this.title, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RightToLeft(
      delay: 150,
      child: Container(
        margin: EdgeInsets.only(left: 14),
        child: Column(
          children: [
            InkWell(
              onTap: function,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  height: 60.00,
                  width: 60.00,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 5.00),
                        color: Color(0xff242424).withOpacity(0.05),
                        blurRadius: 20,
                      ),
                    ],
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                    borderRadius: BorderRadius.circular(40.00),
                  ),
                ),
                placeholder: (context, url) => Container(
                  height: 60.00,
                  width: 60.00,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 5.00),
                        color: Color(0xff242424).withOpacity(0.05),
                        blurRadius: 20,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/images/placholder.jpg'),
                      fit: BoxFit.contain,
                    ),
                    borderRadius: BorderRadius.circular(40.00),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff000000),
              ),
            )
          ],
        ),
      ),
    );
  }
}
