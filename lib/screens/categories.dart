import 'package:flutter/material.dart';
import 'package:myapp_6/models/category.dart';
import 'package:myapp_6/models/meal.dart';
import 'package:myapp_6/screens/meals.dart';
import 'package:myapp_6/widgets/category_grid_item.dart';
import 'package:myapp_6/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });
  final List<Meal> availableMeals;
  void _selectCategory(BuildContext context, Category category) {
    final filterdMeals = availableMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filterdMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(30),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: availableCategories
          .map(
            (e) => CategoryGridItem(
              category: e,
              onSelectCategory: () {
                _selectCategory(context, e);
              },
            ),
          )
          .toList(),
    );
  }
}
