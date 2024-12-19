import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCircularImage extends StatelessWidget {
  const CustomCircularImage({
    super.key,
    this.size = 50,
    required this.image,
    this.isNetwork = true
  });
  final double size;
  final String image;
  final bool isNetwork;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: size,
      width: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image:isNetwork? CachedNetworkImageProvider(image): AssetImage(image),
        ),
      ),
    );
  }
}
