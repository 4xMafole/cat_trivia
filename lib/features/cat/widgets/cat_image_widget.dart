import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_image_client/cat_image_client.dart';
import 'package:flutter/material.dart';

class CatImageWidget extends StatelessWidget {
  const CatImageWidget({
    required this.image,
    super.key,
  });

  final CatImage image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: CachedNetworkImage(
        imageUrl: image.url,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
