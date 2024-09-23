import 'package:cocktailpedia/util/ingredient.dart';
import 'package:flutter/material.dart';

class IngredientFormatter extends StatelessWidget {
  final CocktailIngredient ingredient;

  const IngredientFormatter(this.ingredient, {super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    image: DecorationImage(
                        image: ingredient.ingredient.image, fit: BoxFit.fill),
                    boxShadow: kElevationToShadow[1],
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    ingredient.ingredient.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            Text(
              ingredient.formatQuantity,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      );
}
