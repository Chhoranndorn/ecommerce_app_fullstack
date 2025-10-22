import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/util/img_provider.dart';
import 'package:flutter/material.dart';

class MyCarouselWidget extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  const MyCarouselWidget({super.key, required this.items});
  @override
  State<MyCarouselWidget> createState() => _MyCarouselWidgetState();
}

class _MyCarouselWidgetState extends State<MyCarouselWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.items.length,
          itemBuilder: (context, index, realIndex) {
            final imageUrl = widget.items[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Img.widget(
                imageUrl["image"],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            );
          },
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 8),
        DotsIndicator(
          dotsCount: widget.items.length,
          position: currentIndex.toDouble(),
          decorator: DotsDecorator(
            activeColor: Colors.white,
            size: const Size.square(8),
            activeSize: const Size(12, 8),
          ),
        ),
      ],
    );
  }
}
