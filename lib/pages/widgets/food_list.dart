import 'package:flutter/material.dart';
import 'package:foodrec/model/favorite_model.dart';
import 'package:foodrec/model/food_model.dart';
import 'package:foodrec/pages/widgets/food_list_card.dart';

class FoodList extends StatelessWidget {
  final List<Food> foodList;

  const FoodList(
    this.foodList, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      sliver: SliverGrid.count(
        crossAxisCount: gridAxis(context),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: List.generate(foodList.length, (index) {
          final food = foodList[index];
          return FoodListCard(
            food: food,
            onTap: () {
              Navigator.pushNamed(context, '/detail', arguments: food);
            },
            onTapFavorite: () {
              if (food.isFavorite) {
                Favorite.removeFoodFromFavorite(food, foodList);
              } else {
                Favorite.addFoodToFavorite(food, foodList);
              }
            },
          );
        }),
      ),
    );
  }

  int gridAxis(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 800) {
      return 4;
    } else if (width > 600) {
      return 3;
    } else if (width > 400) {
      return 2;
    } else {
      return 1;
    }
  }
}
