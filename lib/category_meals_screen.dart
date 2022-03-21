import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/category_item.dart';

import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  //these are used for when we use the push navigator in category_item page
  // final String categoryId;
  // final String categoryTitle;
  // //const CategoryMealsScreen({ Key? key }) : super(key: key);

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    //it gives us the arguments as we pass them in the category_item
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs["title"];
    final categoryId = routeArgs["id"];

    //we filter our categories here, we are checking where a meal is re
    //we refer to our dummy meals and now they can be filtered with the where iterable to a list
    //which only contain elements of meal with a condition that we pass in our function
    //this condition receives evey item and returns true if the meal that we are looking at has the categoryId included in its categories
    //and we do that since categories is a list and we can use the contains method
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        //used  with the  push navigation
        //title: Text(categoryTitle)
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
