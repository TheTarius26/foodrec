import 'package:foodrec/model/food_model.dart';

class Favorite {
  static List<Food> listFavoritedFood = [];

  static bool isFoodAlreadyFavorite(Food food, List<Food> listFavorited) {
    final listFavorited = Favorite.listFavoritedFood;
    return listFavorited.where((element) => element == food).isNotEmpty;
  }

  static void addFoodToFavorite(Food food, List<Food> foodList) {
    listFavoritedFood.add(food);
    foodList.firstWhere((element) => element == food).isFavorite = true;
  }

  static void removeFoodFromFavorite(Food food, List<Food> foodList) {
    listFavoritedFood.remove(food);
    foodList.firstWhere((element) => element == food).isFavorite = false;
  }
}
