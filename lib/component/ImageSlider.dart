

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:unstage_app/dto/poster_slide.dart';

class ImageSlider extends StatefulWidget {

  final List<PosterSlide> images;
  final double height;
  const ImageSlider({super.key, required this.images, required this.height});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {

  int _currentImageIndex = 1;

  void onImageChanged(int index) {
    setState(() => _currentImageIndex = index);
  }

  // width 에 맞춰 viewport 사이즈 변경
  // height : 300 일때 0.7, height : 200 일때, 0.6이 되게끔
  double _calculateFactor(double width) {
    return 0.6 + (width - 250) * 0.002;
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: _calculateFactor(widget.height), //0.7, // 각 슬라이드의 크기 조정 (0.8 = 80%)
          height: double.infinity,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 7),
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {
            onImageChanged(index + 1);
          },
        ),
        items: widget.images.map((image) =>
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: image.image,
          )
        ).toList(),
      ),
    );
  }
}
