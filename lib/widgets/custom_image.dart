import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/util/images.dart';
import 'package:e_commerce_app/util/url_helper.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final String placeholder; // local asset placeholder

  const CustomImage({
    super.key,
    required this.imageUrl,
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.cover,
    this.placeholder = Images.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    final fullUrl = buildImageUrl(imageUrl);
    print("Loading image from URL: $fullUrl");
    return CachedNetworkImage(
      imageUrl: fullUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Color(0xFF84C341),
          ),
        ),
      ),
      errorWidget: (context, url, error) {
        print("Error loading image from $fullUrl: $error");
        return Image.asset(
          placeholder,
          width: width,
          height: height,
          fit: fit,
        );
      },
    );
  }
}
