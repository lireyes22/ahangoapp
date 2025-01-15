import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class CarouselLi extends StatelessWidget {
  const CarouselLi({
    super.key,
    required this.img,
  });

  final List<String> img;

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: FlutterCarouselOptions(
        height: 250.0,
        viewportFraction: 0.5,
        autoPlay: true,
        pageSnapping: false,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        floatingIndicator: false,
        showIndicator: false,
      ),
      items: img.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  i,
                  fit: BoxFit.cover,
                  loadingBuilder:
                      (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
