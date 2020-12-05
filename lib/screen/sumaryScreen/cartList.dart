import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CartListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://petapixel.com/assets/uploads/2017/03/product1.jpeg",
            imageBuilder: (context, imageProvider) => Container(
              height: 120.00,
              width: 120.00,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(4.00),
              ),
            ),
            placeholder: (context, url) => Container(
              height: 120.00,
              width: 120.00,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/placholder.jpg')),
                borderRadius: BorderRadius.circular(4.00),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Padding(
            padding: EdgeInsets.only(top: 6),
            child: Text(
              "Tag Heuer...",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xff000000),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 6),
            child: Text(
              "1100",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Theme.of(context).accentColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
