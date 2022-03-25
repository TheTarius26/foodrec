import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodrec/color.dart';
import 'package:foodrec/model/food_model.dart';
import 'package:foodrec/pages/widgets/promotion_carousel.dart';
import 'package:foodrec/pages/widgets/food_list.dart';
import 'package:foodrec/pages/widgets/section_header.dart';
import 'package:foodrec/style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Food> _foodList = Food.foodList;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _appBar(context, _foodList),
              _titleSpace(),
              const PromotionCarousel(),
              const SectionHeader(title: 'Happy Breakfast!'),
              FoodList(_foodList),
            ],
          ),
        ],
      ),
    );
  }

  SliverAppBar _appBar(BuildContext context, List<Food> foodList) {
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: kPrimary,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.favorite,
          ),
          tooltip: 'Favorite',
          onPressed: () {
            Navigator.pushNamed(context, '/favorite', arguments: foodList);
          },
        ),
      ],
    );
  }

  SliverToBoxAdapter _titleSpace() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          color: kPrimary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Next Meal',
              style: styleTitle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              'Find your next meal',
              style: styleSubtitle.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
