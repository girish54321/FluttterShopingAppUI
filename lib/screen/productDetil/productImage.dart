import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ProductImage extends StatelessWidget {
  final List<String> images;
  final Function goToImageView;

  const ProductImage({Key key, this.images, this.goToImageView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Carousel(
          animationCurve: Curves.linear,
          dotIncreasedColor: Colors.red,
          dotSize: 4.0,
          dotSpacing: 15.0,
          dotColor: Colors.green,
          // dotPosition: DotPosition.bottomRight,
          indicatorBgPadding: 5.0,
          dotBgColor: Colors.transparent,
          autoplay: false,
          images: [
            ...images.asMap().entries.map((MapEntry map) {
              return InkWell(
                onTap: () {
                  goToImageView(images);
                },
                child: CachedNetworkImage(
                  imageUrl: images[map.key],
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
                ),
              );
            }).toList(),
          ],
        ));
  }
}
