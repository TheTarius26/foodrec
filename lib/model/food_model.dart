class Food {
  int id, reviewers;
  String name, image, description, recipe;
  double rating;
  bool isFavorite;

  Food({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.rating,
    required this.reviewers,
    required this.recipe,
    this.isFavorite = false,
  });

  static List<Food> foodList = [
    Food(
      id: 1,
      name: 'Salad',
      image: 'meal_1',
      description: 'Fancy Salad with fresh vegetables',
      rating: 4.7,
      reviewers: 534,
      recipe: '''
6 cloves garlic, peeled, divided

¾ cup mayonnaise

5 anchovies anchovy fillets, minced

6 tablespoons grated Parmesan cheese, divided

1 teaspoon Worcestershire sauce

1 teaspoon Dijon mustard

1 tablespoon lemon juice, or more to taste

salt to taste

ground black pepper to taste

¼ cup olive oil

4 cups day-old bread, cubed

1 head romaine lettuce, torn into bite-size pieces
''',
    ),
    Food(
      id: 2,
      name: 'Strawberry Cake',
      image: 'meal_2',
      description: 'Sweet Strawberry Cake, for your sweet tooth',
      rating: 4.9,
      reviewers: 1493,
      recipe: '''
15.25 ounce box white cake mix (use ingredients listed here NOT what is listed on the box) You can also use 16.25-ounce size

3 -ounce box strawberry jello you'll use the powder

1 cup strawberries fresh or frozen mashed or finely chopped (measured after you chop or mash them)

¾ cup vegetable oil

½ cup whole milk or 2% milk

4 large eggs at room temperature
''',
    ),
    Food(
      id: 3,
      name: 'Sandwich with Boiled Egg',
      image: 'meal_3',
      description: 'Nutritious Sandwich with Hot Boiled Egg',
      rating: 4.4,
      reviewers: 423,
      recipe: '''
4 hard boiled eggs

1/4 cup mayonaise

1/4 tsp freshly ground black pepper

1/2 tsp mustard

salt to taste

6 bread slices

3 tsp soft butter
''',
    ),
    Food(
      id: 4,
      name: 'Salmon Soup',
      image: 'meal_4',
      description: 'Delicious Salmon Soup, good for your day',
      rating: 4.5,
      reviewers: 70,
      recipe: '''
Extra virgin olive oil (I used Private Reserve Greek EVOO)

4 green onions, chopped

½ green bell pepper, chopped

4 garlic cloves, minced

1 oz fresh dill, divided, chopped

5 cups low-sodium chicken broth

1 lb gold potatoes, thinly sliced into rounds (best to use a mandolin slicer)

1 carrot, thinly sliced into rounds (best to use a mandolin slicer)

1 tsp dry oregano

¾ tsp ground coriander

½ tsp ground cumin

Kosher salt and black pepper

1 lb salmon fillet, no skin, cut into large chunks

Zest and juice of 1 lemon
''',
    ),
  ];
}
