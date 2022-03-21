import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        //used  with the  push navigation
        //title: Text(categoryTitle)
        title: Text(
          categoryTitle,
        ),
      ),
      body: Center(
        child: Text(
          "The recipes for the Category!",
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
