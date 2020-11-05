import 'package:FlutterShopingAppUI/screen/widgets/appNetWorkImage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ProductImage extends StatelessWidget {
  List list = [
    "https://rukminim1.flixcart.com/image/880/1056/kf75fgw0-0/t-shirt/e/v/2/xxl-t325-pwgh-seven-rocks-original-imafvpbgpyqbzypw.jpeg?q=50",
    "https://rukminim1.flixcart.com/image/880/1056/kf75fgw0-0/t-shirt/e/v/2/xxl-t325-pwgh-seven-rocks-original-imafvpbgpyqbzypw.jpeg?q=50"
  ];

  @override
  Widget build(BuildContext context) {
    // return CarouselSlider(
    //   options: CarouselOptions(
    //     height: double.infinity,
    //     autoPlay: true,
    //   ),
    //   items: [1, 2, 1].map((i) {
    //     return Builder(
    //       builder: (BuildContext context) {
    //         return CachedNetworkImage(
    //           // imageUrl:
    //           //     "https://rukminim1.flixcart.com/image/880/1056/kf75fgw0-0/t-shirt/f/6/j/xxl-t325-pwgh-seven-rocks-original-imafvpbgf6nchmfj.jpeg?q=50",
    //           imageUrl:
    //               "https://rukminim1.flixcart.com/image/880/1056/kf75fgw0-0/t-shirt/e/v/2/xxl-t325-pwgh-seven-rocks-original-imafvpbgpyqbzypw.jpeg?q=50",
    //           imageBuilder: (context, imageProvider) => Container(
    //             height: double.infinity,
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //               image: DecorationImage(
    //                 fit: BoxFit.contain,
    //                 image: imageProvider,
    //               ),
    //             ),
    //           ),
    //           placeholder: (context, url) => Container(
    //             // height: size.height * 0.6,
    //             height: double.infinity,
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //               image: DecorationImage(
    //                 fit: BoxFit.cover,
    //                 image: AssetImage('assets/images/placholder.jpg'),
    //               ),
    //             ),
    //           ),
    //           errorWidget: (context, url, error) => Icon(Icons.error),
    //         );
    //       },
    //     );
    //   }).toList(),
    // );
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Carousel(
          dotSize: 4.0,
          dotSpacing: 15.0,
          dotColor: Colors.green,
          indicatorBgPadding: 5.0,
          dotBgColor: Colors.transparent,
          autoplay: false,
          images: [
            ...list.asMap().entries.map((MapEntry map) {
              return CachedNetworkImage(
                imageUrl: list[map.key],
                imageBuilder: (context, imageProvider) => Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: imageProvider,
                    ),
                  ),
                ),
                placeholder: (context, url) => Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/placholder.jpg'),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              );
            }).toList(),
          ],
        ));
  }
}
