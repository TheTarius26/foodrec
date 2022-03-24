import 'package:flutter/material.dart';
import 'package:foodrec/color.dart';
import 'package:foodrec/common.dart';
import 'package:foodrec/model/food_model.dart';
import 'package:foodrec/style.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    final food = ModalRoute.of(context)?.settings.arguments as Food;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Hero(
                      tag: 'image-${food.id}',
                      child: Image.asset(
                        'assets/images/${food.image}.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  _floatingContainer(food)
                ],
              ),
              _body(food),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(food.name),
          backgroundColor: kSecondary,
        ),
      ),
    );
  }

  Padding _body(Food food) {
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            food.name,
            style: styleTitle.copyWith(
              color: Colors.black,
            ),
          ),
          const SizedBox(height: kPadding / 2),
          Text(
            food.description,
            style: styleSubtitle.copyWith(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: kPadding),
          Text(
            'Ingredients',
            style: styleBodyLarge,
          ),
          const SizedBox(height: kPadding / 2),
          Text(
            food.recipe,
            style: styleBody,
          ),
        ],
      ),
    );
  }

  Positioned _floatingContainer(Food food) {
    return Positioned(
      right: 0,
      bottom: 8,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.reviews,
              color: kSecondary,
            ),
            const SizedBox(width: 8),
            Text(
              '${food.reviewers} Reviewers',
              style: styleSubtitle,
            ),
          ],
        ),
      ),
    );
  }
}
