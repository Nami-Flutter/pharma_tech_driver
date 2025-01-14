import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CommonNetworkImage extends StatelessWidget {

  final String? imageUrl;
  final BoxFit? fit;

  const CommonNetworkImage(
      {Key? key,
      this.fit= BoxFit.fill ,
      required this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Stack(
      children:[
      CachedNetworkImage(
        fit: fit,
        imageUrl: imageUrl ?? '',
        placeholder: (context, url) => new CircularProgressIndicator(),
        errorWidget: (context, url, error) => new Icon(Icons.error),
      )
      ]);
  }
}
