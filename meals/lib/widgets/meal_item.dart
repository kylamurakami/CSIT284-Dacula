import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
  });

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    const darkPink = Color(0xFF850E35);
    const cream = Color(0xFFFCF5EE);

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => onSelectMeal(meal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.network(
                  meal.imageUrl,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }

                    return Container(
                      height: 220,
                      color: const Color(0xFFF4D9D0),
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        color: darkPink,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 220,
                      color: const Color(0xFFF4D9D0),
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.restaurant_rounded,
                            size: 48,
                            color: darkPink,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Recipe image unavailable',
                            style: TextStyle(
                              color: darkPink,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: cream.withValues(alpha: 0.95),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFEE6983),
                        width: 1.2,
                      ),
                    ),
                    child: const Icon(
                      Icons.favorite_rounded,
                      color: darkPink,
                      size: 20,
                    ),
                  ),
                ),
                Positioned(
                  left: 12,
                  right: 12,
                  bottom: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: darkPink.withValues(alpha: 0.88),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: const Color(0xFFFFC4C4),
                        width: 1.2,
                      ),
                    ),
                    child: Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: 12,
                runSpacing: 12,
                children: [
                  MealItemTrait(
                    icon: Icons.schedule_rounded,
                    label: '${meal.duration} min',
                  ),
                  MealItemTrait(
                    icon: Icons.work_outline_rounded,
                    label: complexityText,
                  ),
                  MealItemTrait(
                    icon: Icons.payments_outlined,
                    label: affordabilityText,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}