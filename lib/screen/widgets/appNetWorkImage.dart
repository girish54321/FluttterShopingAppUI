import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final int height;
  const AppNetworkImage({Key key, this.imageUrl, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}

class PlaseHolder extends StatelessWidget {
  const PlaseHolder({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        'assets/images/placholder.jpg',
      ),
      fit: BoxFit.cover,
    );
  }
}
