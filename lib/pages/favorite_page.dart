import 'package:flutter/material.dart';
import 'package:foodrec/color.dart';
import 'package:foodrec/common.dart';
import 'package:foodrec/model/favorite_model.dart';
import 'package:foodrec/model/food_model.dart';
import 'package:foodrec/style.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final List<Food> _selectedList = [];
  final favoritedList = Favorite.listFavoritedFood;
  @override
  Widget build(BuildContext context) {
    final foodList = Food.foodList;
    return Scaffold(
      appBar: AppBar(
        title: _selectedList.isNotEmpty
            ? Text('${_selectedList.length} selected')
            : const Text('Favorited'),
        backgroundColor: kSecondary,
        actions: [
          IconButton(
            onPressed: () {
              helpDialog();
            },
            icon: const Icon(
              Icons.help_outline,
              color: Colors.white,
            ),
          ),
          if (_selectedList.isNotEmpty) ...[
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                for (final food in _selectedList) {
                  Favorite.removeFoodFromFavorite(food, foodList);
                }
                setState(() {
                  _selectedList.clear();
                });
              },
            ),
          ],
        ],
      ),
      body: favoritedList.isNotEmpty
          ? listFavorited(favoritedList)
          : noFavorited(),
    );
  }

  void helpDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            padding: const EdgeInsets.all(kPadding),
            margin: const EdgeInsets.all(kPadding),
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kPadding),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'How to use',
                  style: styleTitle,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Long press on the food to select and click on the ',
                        style: styleSubtitle.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'delete button',
                        style: styleSubtitle.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' to remove from favorite',
                        style: styleSubtitle.copyWith(
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget noFavorited() {
    return Container(
      padding: const EdgeInsets.all(kPadding),
      alignment: AlignmentDirectional.center,
      child: Text(
        'Nothing to see here, you haven\'t favorited anything yet!',
        style: styleTitle.copyWith(color: Colors.black45),
      ),
    );
  }

  Widget listFavorited(List<Food> favoritedList) {
    return ListView.builder(
      itemCount: favoritedList.length,
      itemBuilder: (context, index) {
        final food = favoritedList[index];
        final isSelected = _selectedList.contains(food);
        return Container(
          color: isSelected ? kPrimary : Colors.transparent,
          child: ListTile(
            title: Text(
              food.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: styleSubtitle.copyWith(color: Colors.black),
            ),
            subtitle: Text(
              food.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: styleBody.copyWith(
                color: Colors.black45,
              ),
            ),
            leading: isSelected
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                  )
                : null,
            trailing: isSelected
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedList.remove(food);
                      });
                    },
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
                  )
                : null,
            onLongPress: () {
              if (!isSelected) {
                setState(() {
                  _selectedList.add(food);
                });
              }
            },
          ),
        );
      },
    );
  }
}
