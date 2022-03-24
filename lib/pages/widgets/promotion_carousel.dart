import 'package:flutter/material.dart';
import 'package:foodrec/color.dart';

class PromotionCarousel extends StatefulWidget {
  const PromotionCarousel({
    Key? key,
  }) : super(key: key);

  @override
  State<PromotionCarousel> createState() => _PromotionCarouselState();
}

class _PromotionCarouselState extends State<PromotionCarousel> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 200,
          maxWidth: 300,
        ),
        height: 200,
        decoration: BoxDecoration(
          color: kPrimary,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, -2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Stack(
          children: [
            PageView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/meal_${++index}.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                );
              },
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: 3,
            ),
            Positioned(
              right: 32,
              bottom: 32,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: List.generate(
                    3,
                    (index) => _pageIndicator(index),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _pageIndicator(int currentIndex) {
    final bool isSelected = _currentPage == currentIndex;
    return Container(
      margin: const EdgeInsets.only(left: 4),
      height: 4,
      width: isSelected ? 16 : 4,
      decoration: BoxDecoration(
        color: isSelected ? kSecondary : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
