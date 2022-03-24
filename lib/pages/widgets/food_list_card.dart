import 'package:flutter/material.dart';
import 'package:foodrec/color.dart';
import 'package:foodrec/model/food_model.dart';
import 'package:foodrec/style.dart';

class FoodListCard extends StatelessWidget {
  final Food food;
  final void Function()? onTap, onTapFavorite;

  const FoodListCard({
    Key? key,
    required this.food,
    this.onTap,
    this.onTapFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Hero(
                      tag: 'image-${food.id}',
                      child: Image.asset(
                        'assets/images/${food.image}.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                _title(),
                _description(context),
                const Spacer(),
                _rating(),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: _favoriteButton(),
        ),
      ],
    );
  }

  IconButton _favoriteButton() {
    return IconButton(
      icon: Icon(
        Icons.favorite,
        color: food.isFavorite ? Colors.pink : Colors.grey,
      ),
      onPressed: onTapFavorite,
    );
  }

  Row _rating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              color: kPrimary,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              '${food.rating.toStringAsFixed(1)} / 5.0',
              style: styleBody,
            ),
          ],
        ),
        Text('(${food.reviewers} Reviews)', style: styleBodySmall),
      ],
    );
  }

  Text _description(BuildContext context) {
    return Text(
      food.description,
      maxLines: _maxLinesResponsive(context),
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      style: styleBody,
    );
  }

  Text _title() {
    return Text(
      food.name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
      style: styleSubtitle.copyWith(
        color: Colors.black,
      ),
    );
  }

  int _maxLinesResponsive(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 400) {
      return 2;
    } else if (width < 800) {
      return 3;
    } else {
      return 4;
    }
  }
}
