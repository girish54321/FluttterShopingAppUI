import 'package:FlutterShopingAppUI/animasions/rightToLeft.dart';
import 'package:FlutterShopingAppUI/animasions/showUp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:floating_action_row/floating_action_row.dart';

class CartViewItem extends StatelessWidget {
  final bool isCart;
  final String imageUrl;
  final String prise;

  const CartViewItem(
      {Key key, @required this.isCart, this.imageUrl, this.prise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RightToLeft(
      delay: 200,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl != null
                ? imageUrl
                : "https://static.nike.com/a/images/t_PDP_1280_v1/f_auto/5e4787fc-a474-4842-9f67-489d28a9cb1e/sportswear-t-shirt-CLFcd1.jpg",
            imageBuilder: (context, imageProvider) => Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
              height: 120.00,
              width: 120.00,
              decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover, image: imageProvider),
                borderRadius: BorderRadius.circular(4.00),
              ),
            ),
            placeholder: (context, url) => Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Text(
                "Tag Heuer Wristwatch",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xff000000),
                ),
              ),
              SizedBox(height: 8),
              Text(
                prise != null ? prise.toString() : "1100",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Theme.of(context).accentColor,
                ),
              ),
              SizedBox(height: 8),
              isCart != null
                  ? Container(
                      height: 30.00,
                      width: 80.00,
                      decoration: BoxDecoration(
                        color: Color(0xff00c569),
                        borderRadius: BorderRadius.circular(2.00),
                      ),
                      child: Center(
                        child: Text(
                          "In Stock",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ))
                  : Container(
                      height: 40.00,
                      width: 130.00,
                      decoration: BoxDecoration(
                        color: Color(0xffF0F0F0),
                        borderRadius: BorderRadius.circular(4.00),
                      ),
                      child: FloatingActionRow(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Color(0xffF0F0F0),
                        children: <Widget>[
                          FloatingActionRowButton(
                              icon: Icon(
                                Icons.remove,
                                color: Colors.black,
                              ),
                              onTap: () {}),
                          FloatingActionRowDivider(),
                          ShowUp(
                            delay: 400,
                            child: Container(
                              width: 46,
                              child: Text(
                                "2",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          FloatingActionRowDivider(),
                          FloatingActionRowButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              onTap: () {}),
                        ],
                      ))
            ],
          )
        ],
      ),
    );
  }
}
