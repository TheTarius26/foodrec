import 'package:flutter/material.dart';
import 'package:foodrec/model/favorite_model.dart';
import 'package:foodrec/model/food_model.dart';
import 'package:foodrec/pages/widgets/food_list_card.dart';

class FoodList extends StatefulWidget {
  final List<Food> foodList;

  const FoodList(
    this.foodList, {
    Key? key,
  }) : super(key: key);

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      sliver: SliverGrid.count(
        crossAxisCount: gridAxis(),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: List.generate(widget.foodList.length, (index) {
          final food = widget.foodList[index];
          return FoodListCard(
            food: food,
            onTap: () {
              Navigator.pushNamed(context, '/detail', arguments: food)
                  .then((value) => setState(() {}));
            },
            onTapFavorite: () {
              if (food.isFavorite) {
                Favorite.removeFoodFromFavorite(food, widget.foodList);
              } else {
                Favorite.addFoodToFavorite(food, widget.foodList);
              }
              setState(() {});
            },
          );
        }),
      ),
    );
  }

  int gridAxis() {
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
