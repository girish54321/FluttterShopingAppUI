import 'package:FlutterShopingAppUI/animasions/rightToLeft.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TrackOrderItem extends StatelessWidget {
  final bool done;
  final Function function;
  const TrackOrderItem({Key key, this.done, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RightToLeft(
      delay: 150,
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            height: 140.00,
            padding: EdgeInsets.all(14),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0.00, 5.00),
                  color: Color(0xff242424).withOpacity(0.05),
                  blurRadius: 15,
                ),
              ],
              borderRadius: BorderRadius.circular(4.00),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "OD - 424923192 - N",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff000000),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              "4500",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff00c569),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          height: 30.00,
                          width: 80.00,
                          decoration: BoxDecoration(
                            color: done
                                ? Theme.of(context).accentColor
                                : Color(0xffffb900),
                            borderRadius: BorderRadius.circular(2.00),
                          ),
                          child: Center(
                            child: Text(
                              done ? "Delivered" : "In Transit",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "SF Pro Display",
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                    height: 120.00,
                    width: 120.00,
                    // color: Colors.red,
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(4, (index) {
                        return CachedNetworkImage(
                          placeholder: (context, url) => Container(
                            height: 50.00,
                            width: 50.00,
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/placholder.jpg'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(4.00),
                            ),
                          ),
                          imageUrl:
                              "https://cdn.mos.cms.futurecdn.net/2tkx5PMFyVvve5ryJMH6wX.jpg",
                          imageBuilder: (context, imageProvider) => Container(
                            margin: EdgeInsets.all(4),
                            height: 50.00,
                            width: 50.00,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(4.00),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            // height: 150.0,
                            child: Icon(Icons.error),
                          ),
                        );
                      }),
                    ))
              ],
            )),
      ),
    );
  }
}
